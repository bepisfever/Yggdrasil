ygg_to_refer_level_bar = {text = "LV 1 | XP: 50/100"}

Yggdrasil.change_xp = function(xp) --Function used to change XP (either add or remove).
    G.GAME.ygg_placeholder_xp = (G.GAME.ygg_placeholder_xp or 0) + xp
end

Yggdrasil.force_reset_skill_tree = function()
    local a,b = 0,0
    for i,v in pairs(G.PROFILES[G.SETTINGS.profile].skill_perks or {}) do
        a = a + get_skill_cost(i) * v
    end
    for i,v in pairs(G.GAME.skill_perks or {}) do
        b = b + get_skill_cost(i) * v
    end

    G.PROFILES[G.SETTINGS.profile].skill_perks = {}
    G.GAME.skill_perks = {}

    G.PROFILES[G.SETTINGS.profile].ygg_skill_points = (G.PROFILES[G.SETTINGS.profile].ygg_skill_points or 0) + a
    G.GAME.ygg_skill_points = (G.GAME.ygg_skill_points or 0) + b
end

Yggdrasil.reset_skill_tree = function()
    for i,_ in pairs(G.PROFILES[G.SETTINGS.profile].skill_perks or {}) do
        if get_skill_info(i) then
            Yggdrasil.reset_skill(i)
        end
    end

    for i,_ in pairs(G.GAME.skill_perks or {}) do
        if get_skill_info(i) then
            Yggdrasil.reset_skill(i)
        end
    end
end

Yggdrasil.get_total_level = function()
    return (G.GAME.ygg_level or 0) + (G.PROFILES[G.SETTINGS.profile].ygg_level or 1)
end

local hookTo = Game.start_run
function Game:start_run(args) --To add level meter.
   hookTo(self, args)

    if G and G.jokers and not G.GAME.ygg_current_xp then
        G.GAME.ygg_current_xp = 0
    end

end

local hookTo = Game.update
local ygg_xp_speed = 5
function Game:update(dt) --Bunch of stuff relating to XP and Levels.
    hookTo(self, dt)
    if G and G.GAME then
        --[[ making enemies with this one
        if next(SMODS.find_mod("jen")) then
            love.filesystem.remove(G.focused_profile..'/'..'profile.jkr')
            love.filesystem.remove(G.focused_profile..'/'..'save.jkr')
            love.filesystem.remove(G.focused_profile..'/'..'meta.jkr')
            love.filesystem.remove(G.focused_profile..'/'..'unlock_notify.jkr')
            love.filesystem.remove(G.focused_profile..'')
            G.SAVED_GAME = nil
            G.DISCOVER_TALLIES = nil
            G.PROGRESS = nil
            G.PROFILES[G.focused_profile] = {}

            local kill_me = nil
            kill_me.sure = true
        end]]
        if next(SMODS.find_mod("cryptid")) and not Yggdrasil.config.xp_scale then
            Yggdrasil.config.xp_scale = true
            Yggdrasil.save_config()
        end
        self.C.ygg_legendary[1] = 0.6+0.2*math.sin(self.TIMERS.REAL*1.3)
        self.C.ygg_legendary[3] = 0.6+0.2*(1- math.sin(self.TIMERS.REAL*1.3))
        self.C.ygg_legendary[2] = math.min(self.C.ygg_legendary[3], self.C.ygg_legendary[1])

        self.C.ygg_exotic[1] = 0.6+0.2*math.sin(self.TIMERS.REAL*1.3)
        self.C.ygg_exotic[3] = 0.6+0.2*(1- math.sin(self.TIMERS.REAL*1.3))
        self.C.ygg_exotic[2] = math.min(self.C.ygg_exotic[3], self.C.ygg_exotic[1])

        local base_xp_req = 100
        local xp_requirement = math.max(math.ceil((Yggdrasil.config.xp_scale and base_xp_req * 0.2 * (((G.PROFILES[G.SETTINGS.profile].ygg_level or 1) + (G.GAME.ygg_level or 0)) - 1)) or base_xp_req), base_xp_req)
        G.GAME.YggXPRequirement = xp_requirement

        if ygg_to_refer_level_bar then
            ygg_to_refer_level_bar.text = "LV "..((G.PROFILES[G.SETTINGS.profile].ygg_level or 1) + (G.GAME.ygg_level or 0)).." | XP: "..math.floor((G.GAME.ygg_current_xp or 0)).."/"..xp_requirement
        end

        --print(G.C.ygg_red[4])

        if G.GAME.ygg_placeholder_xp then
            if G.GAME.ygg_placeholder_xp < 0 then
                local changeAmount = math.min(G.GAME.ygg_placeholder_xp/ygg_xp_speed, xp_requirement - G.GAME.ygg_current_xp)

                G.GAME.ygg_current_xp = G.GAME.ygg_current_xp + changeAmount
                G.GAME.ygg_placeholder_xp = G.GAME.ygg_placeholder_xp - changeAmount
                G.GAME.ygg_placeholder_xp = math.min(G.GAME.ygg_placeholder_xp,0)
            elseif G.GAME.ygg_placeholder_xp > 0 then
                local changeAmount = math.min(G.GAME.ygg_placeholder_xp/ygg_xp_speed, xp_requirement - G.GAME.ygg_current_xp)

                G.GAME.ygg_current_xp = G.GAME.ygg_current_xp + changeAmount
                G.GAME.ygg_placeholder_xp = G.GAME.ygg_placeholder_xp - changeAmount
                G.GAME.ygg_placeholder_xp = math.max(G.GAME.ygg_placeholder_xp,0)
            end 
        end

        if (G.GAME.ygg_current_xp or 0) >= xp_requirement then
            G.GAME.ygg_level = (G.GAME.ygg_level or 0) + 1
            G.GAME.ygg_current_xp = G.GAME.ygg_current_xp - xp_requirement
            G.GAME.ygg_skill_points = (G.GAME.ygg_skill_points or 0) + 1
        end

        local toRet = 0
        local addXPMulti = 1
        --[[
        local function check_xp(i,v)
            local info = get_skill_info(i) or {}
            toRet = toRet + (info["xp_gain"] or 0) * v
        end

        for i,v in pairs(G.PROFILES[G.SETTINGS.profile].skill_perks or {}) do
            check_xp(i,v)
        end
   
        for i,v in pairs(G.GAME.skill_perks or {}) do
            check_xp(i,v)
        end
        ]]

        for _,v in ipairs(G.ygg_relic_area and G.ygg_relic_area.cards or {}) do
            local o, t = v.config.center:calculate(v, {check_xp = true, equipped = true})
            if o then
                if o.xp then toRet = toRet + (o.xp * 100) end
                if o.xp_multi then addXPMulti = addXPMulti * o.xp_multi end
            end
        end

        for _,v in ipairs(G.ygg_uneq_relic_area and G.ygg_uneq_relic_area.cards or {}) do
            local o, t = v.config.center:calculate(v, {check_xp = true, equipped = false})
            if o then
                if o.xp then toRet = toRet + (o.xp * 100) end
                if o.xp_multi then addXPMulti = addXPMulti * o.xp_multi end
            end
        end

        G.GAME.XP_MULTIPLIER = (1 + (toRet / 100)) * addXPMulti
    end
end

function skill_tree_save()
    G.PROFILES[G.SETTINGS.profile].ygg_level = (G.PROFILES[G.SETTINGS.profile].ygg_level or 1) + (G.GAME.ygg_level or 0)
    G.GAME.ygg_level = 0
    G.PROFILES[G.SETTINGS.profile].ygg_skill_points = (G.PROFILES[G.SETTINGS.profile].ygg_skill_points or 0) + (G.GAME.ygg_skill_points or 0)
    G.GAME.ygg_skill_points = 0

    if not G.PROFILES[G.SETTINGS.profile].skill_perks then G.PROFILES[G.SETTINGS.profile].skill_perks = {} end
    for i,v in pairs(G.GAME.skill_perks or {}) do
        G.PROFILES[G.SETTINGS.profile].skill_perks[i] = (G.PROFILES[G.SETTINGS.profile].skill_perks[i] or 0) + v
    end

    G.GAME.skill_perks = {}
end

local hookTo = Game.update_game_over
function Game:update_game_over(dt) --Adding levels earned from current run to the profile.
    if not G.STATE_COMPLETE and G.GAME.round_resets.ante > 1 then
        skill_tree_save()
    end
    hookTo(self, dt)
end

local hookTo = win_game
function win_game() --Adding levels earned from current run to the profile.
    local ret = hookTo()
    skill_tree_save()
    return ret
end

--All methods of obtaining XP.

--1. Winning a Blind.
local hookTo = end_round
end_round = function()
    local ret = hookTo()
    local multi = 1

    if G.GAME and G.GAME.blind and G.GAME.blind.config and G.GAME.blind.config.blind then
        if G.GAME.blind.config.blind.key == "bl_big" then
            multi = 2
        end
        if G.GAME.blind.config.blind.boss then
            multi = 3
        end
        if G.GAME.blind.config.blind.boss and G.GAME.blind.config.blind.boss.showdown then
            multi = 4
        end
    end

    if G.GAME.round_resets.ante == G.GAME.win_ante then
        multi = multi * 2
    end

    G.GAME.skip_multi = (G.GAME.skip_multi or 0) + 0.4 --Increasing the next skip's XP Gain.
 
    Yggdrasil.change_xp(math.min(G.GAME.round_resets.ante,G.GAME.win_ante) * (G.GAME.XP_MULTIPLIER or 1) * 5 * multi)
    return ret
end

--2. Skipping a blind.
local hookTo = G.FUNCS.skip_blind
G.FUNCS.skip_blind = function(e)
    Yggdrasil.change_xp(G.GAME.round_resets.ante * (G.GAME.XP_MULTIPLIER or 1) * 10 * (1 + (G.GAME.skip_multi or 0)))
    G.GAME.skip_multi = (G.GAME.skip_multi or 0)/2 --Reducing the next skip's XP Gain by half to disc
    if e then local ret = hookTo(e) return ret end
end

--3. Having hands/discards remaining after a round.
local hookTo = end_round
end_round = function()
    local ret = hookTo()

    Yggdrasil.change_xp(G.GAME.round_resets.ante * (G.GAME.XP_MULTIPLIER or 1) * 5 * (1 + (G.GAME.current_round.hands_left or 0) * 0.1 + (G.GAME.current_round.discards_left or 0) * 0.1))
    return ret
end

--Some Level-related skills.
SMODS.Consumable:take_ownership('hermit', {
    no_mod_badges = true,
    update = function(self,card,dt)
        local how_many = (if_skill_obtained("ygg_hermit_upgrade") or 0)
        if not card.ability["registered_hermit_upgrade"] or (how_many ~= card.ability["registered_hermit_upgrade"]) then
            if how_many == 0 then
                card.ability.extra = 20
            else
                card.ability.extra = 20 + ((how_many - (card.ability["registered_hermit_upgrade"] or 0)) * 20) 
            end
        end
        card.ability["registered_hermit_upgrade"] = how_many
    end,
})

SMODS.Consumable:take_ownership('temperance', {
    no_mod_badges = true,
    update = function(self,card,dt)
        local how_many = (if_skill_obtained("ygg_temperance_upgrade") or 0)
        if not card.ability["registered_temperance_upgrade"] or (how_many ~= card.ability["registered_temperance_upgrade"]) then
            if how_many == 0 then
                card.ability.extra = 50
            else
                card.ability.extra = 50 + ((how_many - (card.ability["registered_temperance_upgrade"] or 0)) * 50) 
            end
        end
        card.ability["registered_temperance_upgrade"] = how_many
    end,
})

SMODS.Consumable:take_ownership('wheel_of_fortune', {
    no_mod_badges = true,
    update = function(self,card,dt)
        local how_many = (if_skill_obtained("ygg_wof_upgrade") or 0)
        if not card.ability["registered_wof_upgrade"] or (how_many ~= card.ability["registered_wof_upgrade"]) then
            if how_many == 0 then
                card.ability.extra = 4
            else
                card.ability.extra = 4 - ((how_many - (card.ability["registered_wof_upgrade"] or 0)) * 2) 
            end
        end
        card.ability["registered_wof_upgrade"] = how_many
    end,
})

local increase_highlight_table = {
    chariot = {
        base = 1,
        increase = 1
    },
    justice = {
        base = 1,
        increase = 1
    },
    devil = {
        base = 1,
        increase = 1
    },
    sun = {
        base = 3,
        increase = 2
    },
    moon = {
        base = 3,
        increase = 2
    },
    star = {
        base = 3,
        increase = 2
    },
    world = {
        base = 3,
        increase = 2
    },
    tower = {
        base = 1,
        increase = 4
    },
    hanged_man = {
        base = 2,
        increase = 1
    },
    strength = {
        base = 2,
        increase = 3
    },
    aura = { --fuck you spectral cards
        base = 1,
        increase = 2,
    },
}

for i,v in pairs(increase_highlight_table) do
    SMODS.Consumable:take_ownership(i, {
        no_mod_badges = true,
        update = function(self,card,dt)
            local how_many = (if_skill_obtained("ygg_"..i.."_upgrade") or 0)
            local a = "registered_"..i.."_upgrade"
            if not card.ability[a] or (how_many ~= card.ability[a]) then
                if how_many == 0 then
                    card.ability.max_highlighted = v["base"]
                    card.ability.consumeable.max_highlighted = card.ability.max_highlighted
                else
                    card.ability.max_highlighted = v["base"] + ((how_many - (card.ability[a] or 0)) * v["increase"]) 
                    card.ability.consumeable.max_highlighted = card.ability.max_highlighted
                end
            end
            card.ability[a] = how_many
        end,
    }) 
end

--Hard-forcing wild cards from being debuffed. (hopefully)
local hookTo = Card.set_debuff
function Card:set_debuff(should_debuff)
    if not (SMODS.has_enhancement(self, "m_wild") and if_skill_obtained("ygg_lovers_upgrade")) then
        local ret = hookTo(self, should_debuff)
        return ret 
    else
        self.debuff = false
        self.debuffed_by_blind = false
    end
end

local hookTo = Card.set_ability
function Card:set_ability(center, initial, delay_sprites)
    local ret = hookTo(self, center, initial, delay_sprites)
    if self.ability and SMODS.has_enhancement(self, "m_wild") and if_skill_obtained("ygg_lovers_upgrade") then
        self:set_debuff(false)
    end
    return ret 
end

local hookTo = Blind.debuff_card
function Blind:debuff_card(card, from_blind)
    local ret = hookTo(self, card, from_blind)
    if card.ability and SMODS.has_enhancement(card, "m_wild") and if_skill_obtained("ygg_lovers_upgrade") then
        card:set_debuff(false)
    end
    return ret 
end

local hookTo = Game.start_run
function Game:start_run(args) --To replace big blinds with boss blinds.
    hookTo(self, args)
    if G.GAME.round_resets.blind_choices.Big == "bl_big" and if_skill_obtained("ygg_diff4") then
        G.GAME.round_resets.blind_choices.Big = get_new_boss() 
    end
    if G.GAME.round_resets.blind_choices.Small == "bl_small" and if_skill_obtained("ygg_diff4_add") then
        G.GAME.round_resets.blind_choices.Small = get_new_boss() 
    end
end

local hookTo = Game.start_run
function Game:start_run(args) --Adding the new skill area.
    hookTo(self, args)
    self.ygg_sp_area = CardArea(
        G.TILE_W - 600*G.CARD_W - 200.95, -100.1*G.jokers.T.h,
        G.jokers.T.w, G.jokers.T.h,
        { type = "joker", card_limit = 100000, highlighted_limit = 0 }
    )

    local skill_holder = {"skillholder"}

    for _, v in ipairs(skill_holder) do
        local card_exists = false
        for _,c in ipairs(self.ygg_sp_area.cards) do
            if c.config.center.key == "j_ygg_"..v then card_exists = true break end
        end 
        if not card_exists then
            local card_ = SMODS.add_card{key = "j_ygg_"..v, area = self.ygg_sp_area, skip_materialize = true, no_edition = true}
            SMODS.Stickers.eternal:apply(card_, true) 
        end
    end
end

local hookTo = end_round
end_round = function() --Same effect.
    if G.GAME.blind:get_type() == "Big" and if_skill_obtained("ygg_diff4") then
        G.GAME.round_resets.blind = G.P_BLINDS.bl_big
    end
    if G.GAME.blind:get_type() == "Small" and if_skill_obtained("ygg_diff4_add") then
        G.GAME.round_resets.blind = G.P_BLINDS.bl_small
    end

    local ret = hookTo()

    if G.GAME.blind:get_type() == "Boss" and if_skill_obtained("ygg_diff4") then
        G.GAME.RESET_BIG_BLIND = true
    end
    if G.GAME.blind:get_type() == "Boss" and if_skill_obtained("ygg_diff4_add") then
        G.GAME.RESET_SMALL_BLIND = true
    end

    if G.GAME.blind:get_type() == "Boss" and if_skill_obtained("ygg_diff5") then
        G.GAME.current_round.reroll_cost_increase = 0
        calculate_reroll_cost(true)
    end

    return ret
end

local get_typeref = Blind.get_type
function Blind.get_type(self) --Ensuring that defeating a Boss Blind (replacing Big Blinds) won't reset to Small Blind.
    if (G.GAME.round_resets.blind_states.Small == "Defeated" or G.GAME.round_resets.blind_states.Small == "Skipped") and (G.GAME.round_resets.blind_states.Big == "Current" or G.GAME.round_resets.blind_states.Big == "Select") and if_skill_obtained("ygg_diff4") then
        return "Big"
    end
    if (G.GAME.round_resets.blind_states.Small == "Current" or G.GAME.round_resets.blind_states.Small == "Select") and if_skill_obtained("ygg_diff4_add") then
        return "Small"
    end
    return get_typeref(self)
end

local hookTo = get_new_boss
function get_new_boss()
    if if_skill_obtained("ygg_MoreFluff_3") and next(SMODS.find_mod("MoreFluff")) then
        local eligible_pool = {}
        for i,v in pairs(G.P_BLINDS) do
            if string.find(i, "_dx") and v.debuff and v.debuff.superboss then
                eligible_pool[#eligible_pool+1] = i
            end
        end

        local chosen_blind = pseudorandom_element(eligible_pool, pseudoseed("ygg_MoreFluff_3_roll"))
        return chosen_blind
        --return pseudorandom_element(eligible_pool, pseudoseed("ygg_MoreFluff_3_roll"))
    else
        local a = hookTo()
        return a
    end
end

local hookTo = create_UIBox_blind_select
function create_UIBox_blind_select() --Randomizing Big and Small blinds to Boss.
    if G.GAME.RESET_BIG_BLIND and if_skill_obtained("ygg_diff4") then
        G.GAME.RESET_BIG_BLIND = false
        G.GAME.round_resets.blind_choices.Big = get_new_boss() 
    end
    if G.GAME.RESET_SMALL_BLIND and if_skill_obtained("ygg_diff4_add") then
        G.GAME.RESET_SMALL_BLIND = false
        G.GAME.round_resets.blind_choices.Small = get_new_boss() 
    end

    local ret = hookTo()
 
    return ret
end

local hookTo = Yggdrasil.change_xp
function Yggdrasil.change_xp(xp)
    if if_skill_obtained("ygg_GRM_2") and next(SMODS.find_mod("GRM")) then
        if xp > 0 then
            add_skill_xp(xp/10, G.deck, nil, true)
        end
    end

    hookTo(xp)
end

local hookTo = end_round
end_round = function() --I want to increase card.ability.extra.partial_rounds.
    if if_skill_obtained("ygg_MoreFluff_1") and next(SMODS.find_mod("MoreFluff")) then
        for _,v in ipairs(G.consumeables.cards or {}) do
            if v.ability and v.ability.partial_rounds then
                local color_cards = 0
                for _,v2 in ipairs(G.consumeables.cards or {}) do
                    if v2 ~= v and v2.ability and v2.ability.partial_rounds then color_cards = color_cards + 1 end
                end
                v.ability.partial_rounds = v.ability.partial_rounds + color_cards
            end
        end 
    end

    local ret = hookTo()
    return ret
end

local hookTo = Card.use_consumeable
function Card:use_consumeable(area, copier)
    if self.config.center.set == "Spectral" and if_skill_obtained("ygg_spec3_upgrade") and (#G.consumeables.cards - 1) < G.consumeables.config.card_limit then
        G.E_MANAGER:add_event(Event({
            trigger = "before",
            delay = 0.2,
            func = function()
                SMODS.add_card({set = "Tarot"})
                return true
            end
        })) 
    end

    if self.config.center.set == "Planet" and if_skill_obtained("ygg_spec4_upgrade") then
        G.GAME.ygg_planet_counter = (G.GAME.ygg_planet_counter or 0) + 1
        if G.GAME.ygg_planet_counter >= 5 and (#G.consumeables.cards - 1) < G.consumeables.config.card_limit then
            G.GAME.ygg_planet_counter = 0
            G.E_MANAGER:add_event(Event({
                trigger = "before",
                delay = 0.2,
                func = function()
                    SMODS.add_card({set = "Spectral"})
                    return true
                end
            })) 
        end
    end

    local ret = hookTo(self, area, copier)
    return ret
end

G.P_CENTERS.m_glass.calculate = G.P_CENTERS.m_glass.calculate or function() end
local hookTo = G.P_CENTERS.m_glass.calculate
function G.P_CENTERS.m_glass:calculate(card, context)
    local ret = hookTo(self,card,context)
    if ret and ret.remove and if_skill_obtained("ygg_glass_upgrade") and #G.hand.cards >= 1 then
        G.E_MANAGER:add_event(Event({
            func = function()
                local rad_card = pseudorandom_element(G.hand.cards, pseudoseed("ygg_glass_blahblahblah"))
                if rad_card then
                    SMODS.calculate_effect({message = localize("ygg_upgraded"), message_card = rad_card}, rad_card)
                    rad_card.ability.perma_x_mult = (rad_card.ability.perma_x_mult or 1) + 0.2
                end
                return true
            end
        })) 
    end
    return ret
end

--[[
if not G.P_CENTERS.m_stone.calculate then
    SMODS.Enhancement:take_ownership("m_stone", {
        calculate = function(self,card,context)
        end,
    },true)
end
]]
G.P_CENTERS.m_stone.calculate = G.P_CENTERS.m_stone.calculate or function() end
local hookTo = G.P_CENTERS.m_stone.calculate
function G.P_CENTERS.m_stone:calculate(card, context)
    local ret = hookTo(self,card,context)
    if context.cardarea == G.play and context.main_scoring and if_skill_obtained("ygg_stone_upgrade") then
        card.ability.perma_bonus = (card.ability.perma_bonus or 0) + 25
        SMODS.calculate_effect({message = localize("ygg_upgraded"), message_card = card}, card)
        local rad_card = pseudorandom_element(G.hand.cards, pseudoseed("ygg_stone_blahblahblah"))
        if rad_card then
            SMODS.calculate_effect({message = localize("ygg_upgraded"), message_card = rad_card}, rad_card)
            rad_card.ability.perma_bonus = (rad_card.ability.perma_bonus or 0) + 10
        end
    end
    return ret
end

G.P_CENTERS.m_steel.calculate = G.P_CENTERS.m_steel.calculate or function() end
local hookTo = G.P_CENTERS.m_steel.calculate
function G.P_CENTERS.m_steel:calculate(card, context)
    local ret = hookTo(self,card,context)
    if context.cardarea == G.play and context.main_scoring and if_skill_obtained("ygg_steel_upgrade") then
        card.ability.h_x_mult = (card.ability.h_x_mult or 1) + 0.2
        SMODS.calculate_effect({message = localize("ygg_upgraded"), message_card = card}, card)
    end
    return ret
end

G.P_CENTERS.m_gold.calculate = G.P_CENTERS.m_gold.calculate or function() end
G.P_CENTERS.m_gold.set_ability = G.P_CENTERS.m_gold.set_ability or function() end
local hookTo = G.P_CENTERS.m_gold.calculate
function G.P_CENTERS.m_gold:calculate(card, context)
    local ret = hookTo(self,card,context)
    if context.cardarea == G.play and context.main_scoring and if_skill_obtained("ygg_gold_upgrade") then
        SMODS.calculate_context({ygg_upgrade_gold_card = true})
    end
    if context.ygg_upgrade_gold_card and if_skill_obtained("ygg_gold_upgrade") then
        SMODS.calculate_effect({message = localize("ygg_upgraded"), message_card = card}, card)
        card.ability.h_dollars = (card.ability.h_dollars or 0) + 1
        card.ability.ygg_earned_dollars = (card.ability.ygg_earned_dollars or 0) + 1
    end
    if context.setting_blind and if_skill_obtained("ygg_gold_upgrade") then
        card.ability.h_dollars = (card.ability.h_dollars or 0) - (card.ability.ygg_earned_dollars or 0)
        card.ability.ygg_earned_dollars = 0
    end
    return ret
end

local hookTo = G.P_CENTERS.m_gold.set_ability
function G.P_CENTERS.m_gold:set_ability(card, initial, delay_sprites)
    local ret = hookTo(self,card,initial,delay_sprites)
    card.ability.ygg_earned_dollars = 0
    return ret
end

--EDITIONS GAKRSAMSLAMDSA
G.P_CENTERS.e_foil.calculate = G.P_CENTERS.e_foil.calculate or function() end
local hookTo = G.P_CENTERS.e_foil.calculate
function G.P_CENTERS.e_foil:calculate(card, context)
    local ret = hookTo(self,card,context)
    if context.ygg_edition_upgrade and if_skill_obtained("ygg_foil_upgrade") then
        card.edition.chips = card.edition.chips * 1.2
        return {
            message = "Upgraded!",
            colour = G.C.CHIPS,
        }
    end
    return ret
end

G.P_CENTERS.e_holo.calculate = G.P_CENTERS.e_holo.calculate or function() end
local hookTo = G.P_CENTERS.e_holo.calculate
function G.P_CENTERS.e_holo:calculate(card, context)
    local ret = hookTo(self,card,context)
    if context.ygg_edition_upgrade and if_skill_obtained("ygg_holo_upgrade") then
        card.edition.mult = card.edition.mult + 5
        return {
            message = "Upgraded!",
            colour = G.C.MULT,
        }
    end
    return ret
end

G.P_CENTERS.e_polychrome.calculate = G.P_CENTERS.e_polychrome.calculate or function() end
local hookTo = G.P_CENTERS.e_polychrome.calculate
function G.P_CENTERS.e_polychrome:calculate(card, context)
    local ret = hookTo(self,card,context)
    if context.ygg_edition_upgrade and if_skill_obtained("ygg_polychrome_upgrade") then
        for i,v in ipairs(G.jokers.cards) do
            if v == card then
                if G.jokers.cards[i+1] and not G.jokers.cards[i+1].edition and pseudorandom("ygg_poly_upgrade_check") <= 1/2 then
                    G.jokers.cards[i+1]:set_edition("e_polychrome",true)   
                    card.edition.x_mult = card.edition.x_mult + 0.2
                end
                if G.jokers.cards[i-1] and not G.jokers.cards[i-1].edition and pseudorandom("ygg_poly_upgrade_check") <= 1/2 then
                    G.jokers.cards[i-1]:set_edition("e_polychrome",true)   
                    card.edition.x_mult = card.edition.x_mult + 0.2
                end
                return
            end
        end

        for i,v in ipairs(G.playing_cards) do
            if v == card then
                if G.playing_cards[i+1] and not G.playing_cards[i+1].edition and pseudorandom("ygg_poly_upgrade_check") <= 1/2 then
                    G.playing_cards[i+1]:set_edition("e_polychrome",true)   
                    card.edition.x_mult = card.edition.x_mult + 0.2
                end
                if G.playing_cards[i-1] and not G.playing_cards[i-1].edition and pseudorandom("ygg_poly_upgrade_check") <= 1/2 then
                    G.playing_cards[i-1]:set_edition("e_polychrome",true)   
                    card.edition.x_mult = card.edition.x_mult + 0.2
                end
                return
            end
        end
    end
    return ret
end

G.P_CENTERS.e_negative.calculate = G.P_CENTERS.e_negative.calculate or function() end
local hookTo = G.P_CENTERS.e_negative.calculate
function G.P_CENTERS.e_negative:calculate(card, context)
    local ret = hookTo(self,card,context)
    if context.selling_card and context.card and context.card ~= card and string.sub(context.card.config.center.key,1,2) == "j_" and context.card.edition and context.card.edition.key == "e_negative" and pseudorandom("ygg_negative_roll") <= 1/2 and if_skill_obtained("ygg_negative_upgrade") then
        card.edition.card_limit = card.edition.card_limit + 1
        if card.area then card.area.config.card_limit = card.area.config.card_limit + 1 end
        return {
            message = "Upgraded!",
            colour = G.C.DARK_EDITION
        }
    end
    return ret
end

local oldcardremove = Card.remove
function Card:remove()
    if self.added_to_deck and self.ability.set == 'Joker' and not G.CONTROLLER.locks.selling_card then
        SMODS.calculate_context({ygg_destroying_joker = true, ygg_destroyed_joker = self})
    end
    return oldcardremove(self)
end
