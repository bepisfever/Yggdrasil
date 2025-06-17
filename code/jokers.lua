SMODS.Atlas {
   key = "trash_atlas",
   path = "trash.png",
   px = 71,
   py = 95,
}
--Don't mind this one.
SMODS.Joker {
   key = 'skillholder',
   loc_txt = {
      name = 'Skill Tree',
      text = {
         '...You aren\'t supposed to see this.'
      },
   },
   atlas = 'trash_atlas',
   rarity = 1,
   cost = 0,
   unlocked = true,
   discovered = true,
   blueprint_compat = true,
   eternal_compat = true,
   perishable_compat = false,
   pos = { x = 0, y = 0 },
   no_collection = true,
   no_doe = true,
   in_pool = function(self, args)
      return false
   end,

   update = function(self,card,dt)
      if G and G.GAME then
         local gains = {
            hand_size = 0,
            ante_scaling = 0,
            showdown_ante_decrease = 0,
         }
   
         local function check_skill_gains(i,v)
            local info = get_skill_info(i) or {}
            for i2,v2 in pairs(info) do
               if i2 == "showdown_ante_decrease" and info["force_showdown_ante_decrease"] then
                  if gains[i2] then gains[i2] = gains[i2] + ((v2 + (G.GAME.win_ante - 8)) * v) end
               else
                  if gains[i2] then gains[i2] = gains[i2] + (v2 * v) end
               end
            end
         end
   
         for i,v in pairs(G.PROFILES[G.SETTINGS.profile].skill_perks or {}) do
            if not DisabledSkills[i] then
               check_skill_gains(i,v)
            end
         end
   
         for i,v in pairs(G.GAME.skill_perks or {}) do
            if not DisabledSkills[i] then
               check_skill_gains(i,v)
            end
         end
   
         if if_skill_obtained("ygg_mult10") then
            gains["hand_size"] = gains["hand_size"] + math.floor((card.ability.current_mult or 0)/100)
         end

         if if_skill_obtained("ygg_MoreFluff_2") and next(SMODS.find_mod("MoreFluff")) then
            local registered_keys = {}

            for _,v in ipairs(G.consumeables.cards or {}) do
               if v.ability and v.ability.partial_rounds and not table.contains(registered_keys, v.config.center.key) then registered_keys[#registered_keys+1] = v.config.center.key end
            end

            gains["hand_size"] = gains["hand_size"] + #registered_keys
         end
   
         for i,v in pairs(gains) do
            if v ~= (G.GAME["skill_added_"..i] or 0) then
               if i == "hand_size" and G.hand then
                  G.hand:change_size(v - (G.GAME["skill_added_"..i] or 0))
               elseif i == "ante_scaling" then
                  G.GAME.win_ante = (G.GAME.win_ante or 0) + (v - (G.GAME["skill_added_"..i] or 0))
               elseif i == "showdown_ante_decrease" then
                  G.GAME[i] = (G.GAME[i] or 0) + (v - (G.GAME["skill_added_"..i] or 0))
               end
               G.GAME["skill_added_"..i] = v
            end
         end
      end
   end,

   calc_dollar_bonus = function(self, card)
      local bonus = 0

      local function check_skill_gains(i,v)
         local info = get_skill_info(i) or {}
         bonus = bonus + ((info["cash"] or 0) * v)
      end

      for i,v in pairs(G.PROFILES[G.SETTINGS.profile].skill_perks or {}) do
         check_skill_gains(i,v)
      end

      for i,v in pairs(G.GAME.skill_perks or {}) do
         check_skill_gains(i,v)
      end

      if bonus > 0 then return bonus end
   end,

   calculate = function(self,card,context)
      local gains = {
         mult = 0, chips = 0, xmult = 1, xchips = 1, multMulti = 1, chipsMulti = 1
      }

      if card.edition then
         card:set_edition(nil,true)
      end

      local function check_skill_gains(i,v)
         local info = get_skill_info(i) or {}
         for i2,_ in pairs(gains) do
            local multi = 1
            if if_skill_obtained("ygg_mult6") and i2 == "mult" then
               multi = multi + 0.2
            end
            gains[i2] = gains[i2] + ((info[i2] or 0) * v * multi) 
         end
      end

      for i,v in pairs(G.PROFILES[G.SETTINGS.profile].skill_perks or {}) do
         check_skill_gains(i,v)
      end

      for i,v in pairs(G.GAME.skill_perks or {}) do
         check_skill_gains(i,v)
      end

      for i,v in pairs(gains) do
         if card.ability[i] then
            gains[i] = gains[i] + card.ability[i]
         end
      end

      if if_skill_obtained("ygg_mult3") then
         gains["xmult"] = gains["xmult"] + (get_skill_info("ygg_mult3")["config"]["xmult"] * math.floor(gains["mult"]/10))
      end

      if if_skill_obtained("ygg_mult8") then
         for _,v in ipairs(G.playing_cards or {}) do
            if v:is_face() then
               gains["mult"] = gains["mult"] + 5
            end
         end
      end

      if if_skill_obtained("ygg_mult12") then
         if #G.jokers.cards < 19 and G.GAME.current_round.hands_played < 2 then
            gains["mult"] = gains["mult"] + 87
         end
      end

      if if_skill_obtained("ygg_chips5") then
         gains["xchips"] = math.max(gains["xchips"],1.1)
      end

      if if_skill_obtained("ygg_chips6") then
         local stop = false
         repeat
            if pseudorandom("ygg_chips6") <= 3/4 then
               local multi = 1
               gains["chips"] = gains["chips"] + (25 * multi) 
            else
               stop = true
            end
         until stop
      end

      if if_skill_obtained("ygg_chips7") then
         gains["chips"] = gains["chips"] + (gains["mult"]/10)
      end

      if if_skill_obtained("ygg_chips8") then
         if G.GAME.current_round.hands_left == 1 then
            gains["xchips"] = gains["xchips"] + 0.5
         end
      end

      if if_skill_obtained("ygg_chips10") then
         if pseudorandom("ygg_chips10") <= 1/2 then
            gains["xchips"] = gains["xchips"] + 0.5
         else
            gains["chips"] = gains["chips"] - 50
         end
      end

      if if_skill_obtained("ygg_AKYRS_1") and AKYRS then
         for _,v in ipairs(G.jokers.cards or {}) do
            local key = v.config.center.key
            local desc = (G.localization.descriptions.Joker[key] or {})["text"] or nil
            
            if desc then
               local chars = 0
               local is_multi_box = false
               for i,v in pairs(desc) do
                  if type(v) == "table" then is_multi_box = true end
               end

               if is_multi_box then
                  for _,box in ipairs(desc) do
                     for _,str in ipairs(box) do
                        local normalizedStr = Yggdrasil.toNormalString(str)
                        local final = string.gsub(normalizedStr," ","")
                        final = string.gsub(final, "#", "")
                        chars = chars + string.len(final)
                     end
                  end
               else
                  for _,str in ipairs(desc) do
                     local normalizedStr = Yggdrasil.toNormalString(str)
                     local final = string.gsub(normalizedStr," ","")
                     final = string.gsub(final, "#", "")
                     chars = chars + string.len(final)
                  end
               end
               gains["chips"] = gains["chips"] + (0.5 * chars)
            end
         end
      end

      if if_skill_obtained("ygg_AKYRS_4") and AKYRS then
         gains["xmult"] = gains["xmult"] + (0.5 * math.max(40 - love.timer.getFPS(), 0))
      end

      gains["mult"] = gains["mult"] * math.max(gains["multMulti"], 0)
      gains["chips"] = gains["chips"] * math.max(gains["chipsMulti"], 0)

      if not context.retrigger_joker and not context.blueprint then
         card.ability.current_mult = gains["mult"]
         if context.joker_main then
            SMODS.calculate_context({mat_joker_main = true})
            if if_skill_obtained("ygg_mult7") then
               SMODS.calculate_effect({mult = gains["mult"]},G.deck)
            end
            SMODS.calculate_effect({mult = gains["mult"], chips = gains["chips"], xchips = gains["xchips"], xmult = gains["xmult"]},G.deck)
         end

         if context.other_joker then
            SMODS.calculate_context({mat_other_joker = context.other_joker})
         end
         if context.other_consumeable then
            SMODS.calculate_context({mat_other_consumeable = context.other_consumeable})
         end

         if context.repetition and context.cardarea == G.play then
            if Yggdrasil.have_item("rainbow_element") then
               if context.other_card:is_suit("Hearts") and context.other_card:is_suit("Spades") and context.other_card:is_suit("Clubs") and context.other_card:is_suit("Diamonds") then
                  return {
                     repetitions = Yggdrasil.amt_item_inv("rainbow_element"),
                     card = context.other_card
                  }
               end
            end
         end

         if context.end_of_round and context.main_eval then
            SMODS.calculate_context({mat_end_of_round = true})
            if if_skill_obtained("ygg_spec1_upgrade") then
               local tarot_pool = {}
               for _,v in ipairs(G.consumeables.cards) do
                  if v.config.center.set == "Tarot" then tarot_pool[#tarot_pool+1] = v end
               end

               if #tarot_pool > 0 and (#G.consumeables.cards - 1) < G.consumeables.config.card_limit then
                  local rad_card = pseudorandom_element(tarot_pool, pseudoseed("ygg_spec1_upgrade_check"))
                  G.E_MANAGER:add_event(Event({
                     trigger = "before",
                     delay = 0.2,
                     func = function()
                        rad_card:start_dissolve()
                        if if_skill_obtained("ygg_spec2_upgrade") then
                           SMODS.add_card({set = "Spectral", edition = "e_negative"})
                        else
                           SMODS.add_card({set = "Spectral"})
                        end
                        return true
                     end
                  })) 
               end
            end
         end

         if context.individual and context.cardarea == G.play then
            SMODS.calculate_context({mat_individual = true, cardarea = G.play, other_card = context.other_card, scoring_hand = context.scoring_hand})
            if if_skill_obtained("ygg_AKYRS_2") and AKYRS then
               if context.other_card:get_letter_with_pretend() == "y" or context.other_card:get_letter_with_pretend() == "Y" then
                  return{
                     xmult = 2.99999999999999998,
                     card = context.other_card,
                  }
               end
            end
         end

         if context.remove_playing_cards and not context.scoring_hand then
            for _ = 1,#context.removed do
               if if_skill_obtained("ygg_mult11") then
                  card.ability["mult"] = (card.ability["mult"] or 0) + 5
               end
            end
         end

         if context.before then
            if if_skill_obtained("ygg_special_light") then
               for _,v in ipairs(G.play.cards or {}) do
                  v.ability.perma_bonus = (v.ability.perma_bonus or 0) + 5
                  if to_big((v:get_chip_bonus() or 0)) >= to_big(100) then
                     v.ability.perma_x_mult = (v.ability.perma_x_mult or 1) + 0.05 
                  end
               end
            end

            if if_skill_obtained("ygg_mult9") then
               for _,v in ipairs(G.play.cards or {}) do
                  v.ability.perma_mult = (v.ability.perma_mult or 0) + 5
               end
            end
         end

         if if_skill_obtained("ygg_foil_upgrade") then
            if context.retrigger_joker_check and context.other_card ~= card and context.other_card.edition and context.other_card.edition.key == "e_foil" then --context.other_card.edition.chips
               return {
                  repetitions = 1,
                  card = context.other_card,
                  message_card = context.other_card,
                  message = localize("k_again_ex"),
                  colour = G.C.CHIPS,
               }
            end

            if context.repetition and context.other_card.edition and context.other_card.edition.key == "e_foil" then
               return {
                  repetitions = 1,
                  card = context.other_card,
                  message_card = context.other_card,
                  message = localize("k_again_ex"),
                  colour = G.C.CHIPS,
               }
            end
         end

         if if_skill_obtained("ygg_holo_upgrade") then
            if context.retrigger_joker_check and context.other_card ~= card and context.other_card.edition and context.other_card.edition.key == "e_holo" and context.other_card.edition.mult >= 30 then --context.other_card.edition.chips
               return {
                  repetitions = math.floor(context.other_card.edition.mult/30),
                  card = context.other_card,
                  message_card = context.other_card,
                  message = localize("k_again_ex"),
                  colour = G.C.MULT,
               }
            end

            if context.repetition and context.other_card.edition and context.other_card.edition.key == "e_holo" and context.other_card.edition.mult >= 30 then
               return {
                  repetitions = math.floor(context.other_card.edition.mult/30),
                  card = context.other_card,
                  message_card = context.other_card,
                  message = localize("k_again_ex"),
                  colour = G.C.MULT,
               }
            end
         end
      end
   end,
}
