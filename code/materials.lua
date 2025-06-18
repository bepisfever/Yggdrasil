--studied from CardSleeves' code.
local use_placeholder_art = false

SMODS.Atlas {
    key = "placeholder_mat",
    path = "placeholder_material.png",
    px = 50,
    py = 50
}

SMODS.Atlas {
    key = "ygg_placeholder_atlas",
    path = "ygg_placeholder_atlas.png",
    px = 50,
    py = 50
}

SMODS.Atlas {
    key = "com_ygg_placeholder_atlas",
    path = "complete_ygg_mat_atlas.png",
    px = 50,
    py = 50
}

local rarities = {
    common = {
        "card_scrap",
        "half_a_chip",
        "fixed_joker",
        "fixed_blue_joker",
        "philosopher_quill",
    },
    uncommon = {
        "broken_spade",
        "shattered_heart",
        "dead_clover",
        "fractured_diamond",
        "harmony_core",
        "harmony_joker",
        "potassium",
        "gros_michel",
        "sharp_spear",
        "cupid_bow",
        "diamond_staff",
        "clover_talisman",
        "astronaut_helmet",
        "four_leaf_clover",
        "tome_of_knowledge",
        "digging_shovel",
    },
    rare = {
        "misprinted_essence",
        "potassium_overload",
        "cavendish",
        "misprinted_talisman",
        "enchanted_book",
        "golden_shovel",
        "gold_ingot",
    },
    legendary = {
        "soul_fragment",
        "soul_engine",
        "chains_of_eternity",
        "bismuth",
        "wither_catalyst",
    },
    exotic = {
        "vial_of_rainbow",
        "rainbow_element",
        "react_rainbow_element",
        "necron_handle",
        "necron_blade",
        "hyperion",
        "necron_scroll",
        "alkov_blade",
    },
}

local art_credit = {
    gros_michel = {"ygg_credit1"},
    fixed_blue_joker = {"ygg_credit1"},
    fixed_joker = {"ygg_credit1"},
    cavendish = {"ygg_credit1"},
    potassium = {"ygg_credit1"},
    potassium_overload = {"ygg_credit1"},
}

local placeholder_atlas_to_use = {}
local com_atlas_to_use = {}
local placeholder_keys = {
    {"astronaut_helmet", "broken_spade", "card_scrap", "cavendish", "chains_of_eternity", "clover_talisman"},
    {"cupid_bow", "dead_clover", "diamond_staff", "fixed_blue_joker", "fixed_joker", "fractured_diamond"},
    {"gros_michel", "half_a_chip", "harmony_core", "harmony_joker", "misprinted_essence", "misprinted_talisman"},
    {"potassium", "potassium_overload", "react_rainbow_element", "sharp_spear", "shattered_heart", "soul_engine"},
    {"soul_fragment", "vial_of_rainbow", "necron_handle", "rainbow_element", "bismuth", "necron_blade"},
    {"necron_scroll", "wither_catalyst", "hyperion", "four_leaf_clover"},
}
local atlas_mat_keys = {
    {"astronaut_helmet", "broken_spade", "card_scrap", "cavendish", "chains_of_eternity", "clover_talisman"},
    {"cupid_bow", "dead_clover", "diamond_staff", "fixed_blue_joker", "fixed_joker", "fractured_diamond"},
    {"gros_michel", "half_a_chip", "harmony_core", "harmony_joker", "misprinted_essence", "misprinted_talisman"},
    {"potassium", "potassium_overload", "react_rainbow_element", "sharp_spear", "shattered_heart", "soul_engine"},
    {"soul_fragment", "vial_of_rainbow", "necron_handle", "rainbow_element", "bismuth", "necron_blade"},
    {"necron_scroll", "wither_catalyst", "hyperion", "four_leaf_clover", "philosopher_quill", "tome_of_knowledge"},
    {"enchanted_book", "digging_shovel", "gold_ingot", "golden_shovel", "alkov_blade"},
}

for i,v in ipairs(placeholder_keys) do
    for i2, key in ipairs(v) do
        placeholder_atlas_to_use[key] = { x = (i2-1), y = (i-1) }
    end
end

for i,v in ipairs(atlas_mat_keys) do
    for i2, key in ipairs(v) do
        if not (i == 1 and i2 == 1) then --quite literally the only art i made lol
            if not art_credit[key] then art_credit[key] = {} end
            art_credit[key][#art_credit[key]+1] = "ygg_credit2"
        end
        com_atlas_to_use[key] = { x = (i2-1), y = (i-1) }
    end
end

--credit colour: HEX("8f61fa")
for rarity,rarity_info in pairs(rarities) do
    for _,mat_key in ipairs(rarity_info) do
        local atlasToUse = nil
        local pos_to_use = nil

        if com_atlas_to_use[mat_key] then
            atlasToUse = "com_ygg_placeholder_atlas"
            pos_to_use = com_atlas_to_use[mat_key]
        end

        if not atlasToUse or use_placeholder_art then atlasToUse = "placeholder_mat" end
        if not pos_to_use or use_placeholder_art then pos_to_use = { x = 0, y = 0 } end

        if use_placeholder_art then
            atlasToUse = "ygg_placeholder_atlas"
            pos_to_use = placeholder_atlas_to_use[mat_key]
        end

        if not atlasToUse or not pos_to_use then atlasToUse = "placeholder_mat"; pos_to_use = {x = 0, y = 0} end

        Yggdrasil.Material{
            key = mat_key,
            atlas = atlasToUse,
            pos = pos_to_use,
            type = Yggdrasil.get_type_of_item(mat_key), --This needs to either be "relic" or "material", for now.
            rarity = Yggdrasil.get_item(mat_key).rarity, --This needs to be "common", "uncommon", etc (rarities listed in YggMaterialChance and YggMaterialList.)
            loot_config = {
                id = mat_key, --Mandatory, used to check for item's id.
                craft_id = Yggdrasil.get_craft_key(mat_key), --Optional, you can refer to this instead of the item's key in recipes.
                mod_prefix = "ygg", --Mandatory if your mod is NOT mine. :3
                --[[Other optional configs, refer to loot_system.lua > YggMaterialList for other configs if I forgot something here.
                    - min_obtain_cap, max_obtain_cap (num): To tell how many of that material you can get at a time from Blind drops.
                    - min_stake, max_stake (num): To tell which stake the material should drop. min_stake is 1 by default.
                    - min_ante, max_ante (num): To tell which ante the material should drop. min_ante is 1 by default.
                    - blind_req (str):
                        + "All": Material can be encountered in all Blind types.
                        + "Small", "Big", "Boss": Material can only be encountered in a specific Blind type.
                    - unique (bool): This item will not appear if it's already in the inventory.
                    - mod_id (str): For cross-mod purposes. Those items will only be in pool when the mod with the the given mod_id is enabled. (MANDATORY IF THIS IS NOT FROM MY MOD)
                    - card_key (str): Used to create the item in Inventory. If not set, uses id by default.
                    EX: If your card_key is "lala", and your mod_prefix is "tralala", it will try to create "ygg_mat_tralala_lala".
                ]]
            },
            loc_vars = function(self, info_queue, card)
                local to_vars = {}
                if mat_key == "gros_michel" or mat_key == "cavendish" then
                    to_vars[#to_vars+1] = (G.GAME["ygg_"..mat_key.."_disabled"] and localize("ygg_inactive")) or localize("ygg_active")
                end
                if mat_key == "necron_blade" or mat_key == "hyperion" then
                    to_vars[#to_vars+1] = (G.GAME["ygg_"..mat_key.."_wither_essence"] or 0)
                end
                if mat_key == "digging_shovel" or mat_key == "golden_shovel" then
                    to_vars[#to_vars+1] = (G.GAME.probabilities.normal or 1)
                end
                if rarity ~= "common" then
                    to_vars["colours"] = {G.C["ygg_"..rarity]}
                end

                return {vars = to_vars}
            end,
            set_badges = function(self, card, badges)
                if art_credit[mat_key] then
                    for _,v in ipairs(art_credit[mat_key]) do
                        badges[#badges+1] = create_badge(localize(v), HEX("8f61fa"), G.C.WHITE, 1 )
                    end
                end
            end,
            --[[
            in_loot_pool = function(self, center, blind_type) --You want this to return true if it can be obtained from blinds, or false if it can't. If not set, item is automatically set to be in loot pool.

            end,
            ]]
            calculate = function(self,card,context)
                if card.config.center.key == "ygg_mat_ygg_fixed_joker" then
                    if context.joker_main and context.equipped then
                        return{
                            mult = 3,
                        }
                    end
                elseif card.config.center.key == "ygg_mat_ygg_fixed_blue_joker" then
                    if context.joker_main and context.equipped then
                        return{
                            chips = 20,
                        }
                    end
                elseif card.config.center.key == "ygg_mat_ygg_harmony_joker" then
                    if context.joker_main and context.equipped then
                        return{
                            mult = 5,
                            chips = 20,
                        }
                    end
                elseif card.config.center.key == "ygg_mat_ygg_gros_michel" then
                    if context.joker_main and context.equipped and not G.GAME["ygg_gros_michel_disabled"] then
                        return{
                            mult = 10,
                        }
                    end
                    if context.end_of_round and context.equipped and not G.GAME["ygg_gros_michel_disabled"] and pseudorandom("ygg_gros_michel_roll") <= 1/5 then
                        G.GAME["ygg_gros_michel_disabled"] = true
                        return{
                            message = localize("ygg_disabled")
                        }
                    end
                elseif card.config.center.key == "ygg_mat_ygg_cavendish" then
                    if context.joker_main and context.equipped and not G.GAME["ygg_cavendish_disabled"] then
                        return{
                            xmult = 1.5,
                        }
                    end
                    if context.end_of_round and context.equipped and not G.GAME["ygg_cavendish_disabled"] and pseudorandom("ygg_cavendish_roll") <= 1/100 then
                        G.GAME["ygg_cavendish_disabled"] = true
                        return{
                            message = localize("ygg_disabled")
                        }
                    end
                elseif card.config.center.key == "ygg_mat_ygg_cupid_bow" then
                    if context.individual and context.cardarea == G.play and context.equipped and context.other_card:is_suit("Hearts") then
                        return{
                            xmult = 1.1
                        }
                    end
                elseif card.config.center.key == "ygg_mat_ygg_clubs_talisman" then
                    if context.individual and context.cardarea == G.play and context.equipped and context.other_card:is_suit("Clubs") then
                        return{
                            mult = 2
                        }
                    end
                elseif card.config.center.key == "ygg_mat_ygg_sharp_spear" then
                    if context.individual and context.cardarea == G.play and context.equipped and context.other_card:is_suit("Spades") then
                        return{
                            chips = 15
                        }
                    end
                elseif card.config.center.key == "ygg_mat_ygg_diamond_staff" then
                    if context.individual and context.cardarea == G.play and context.equipped and context.other_card:is_suit("Diamonds") then
                        return{
                            dollars = 0.5
                        }
                    end
                elseif card.config.center.key == "ygg_mat_ygg_rainbow_element" then
                    if context.individual and context.cardarea == G.play and context.equipped then
                        if context.other_card:is_suit("Hearts") then
                            local other_suit = 0
                            for _,v in ipairs(context.scoring_hand) do
                                if v:is_suit("Hearts") and v ~= context.other_card then
                                    other_suit = other_suit + 1
                                end
                            end
                            SMODS.calculate_ygg_effect({xmult = 1 + (other_suit * 0.1)}, G.deck)
                        end
                        if context.other_card:is_suit("Clubs") then
                            local other_suit = 0
                            for _,v in ipairs(context.scoring_hand) do
                                if v:is_suit("Clubs") and v ~= context.other_card then
                                    other_suit = other_suit + 1
                                end
                            end
                            SMODS.calculate_ygg_effect({mult = 5 + (other_suit * 1)}, G.deck)
                        end
                        if context.other_card:is_suit("Diamonds") then
                            local other_suit = 0
                            for _,v in ipairs(context.scoring_hand) do
                                if v:is_suit("Diamonds") and v ~= context.other_card then
                                    other_suit = other_suit + 1
                                end
                            end
                            SMODS.calculate_ygg_effect({dollars = 1 + (other_suit * 0.2)}, G.deck)
                        end
                        if context.other_card:is_suit("Spades") then
                            local other_suit = 0
                            for _,v in ipairs(context.scoring_hand) do
                                if v:is_suit("Spades") and v ~= context.other_card then
                                    other_suit = other_suit + 1
                                end
                            end
                            SMODS.calculate_ygg_effect({xchips = 1 + (other_suit * 0.1)}, G.deck)
                        end
                    end
                elseif card.config.center.key == "ygg_mat_ygg_react_rainbow_element" then
                    if context.individual and context.cardarea == G.play and context.equipped then
                        if context.other_card:is_suit("Hearts") then
                            local other_suit = 0
                            for _,v in ipairs(context.scoring_hand) do
                                if v:is_suit("Hearts") and v ~= context.other_card then
                                    other_suit = other_suit + 1
                                end
                            end
                            SMODS.calculate_ygg_effect({xmult = 2 + (other_suit * 0.2)}, G.deck)
                        end
                        if context.other_card:is_suit("Clubs") then
                            local other_suit = 0
                            for _,v in ipairs(context.scoring_hand) do
                                if v:is_suit("Clubs") and v ~= context.other_card then
                                    other_suit = other_suit + 1
                                end
                            end
                            SMODS.calculate_ygg_effect({mult = 25 + (other_suit * 5)}, G.deck)
                        end
                        if context.other_card:is_suit("Diamonds") then
                            local other_suit = 0
                            for _,v in ipairs(context.scoring_hand) do
                                if v:is_suit("Diamonds") and v ~= context.other_card then
                                    other_suit = other_suit + 1
                                end
                            end
                            SMODS.calculate_ygg_effect({dollars = 5 + (other_suit * 1)}, G.deck)
                        end
                        if context.other_card:is_suit("Spades") then
                            local other_suit = 0
                            for _,v in ipairs(context.scoring_hand) do
                                if v:is_suit("Spades") and v ~= context.other_card then
                                    other_suit = other_suit + 1
                                end
                            end
                            SMODS.calculate_ygg_effect({xchips = 2 + (other_suit * 0.2)}, G.deck)
                        end
                    end
                    if context.cardarea == G.play and context.repetition and context.equipped then
                        if context.other_card:is_suit("Hearts") and context.other_card:is_suit("Spades") and context.other_card:is_suit("Clubs") and context.other_card:is_suit("Diamonds") then
                            return{
                                repetitions = 1,
                                card = context.other_card
                            }
                        end
                    end
                elseif card.config.center.key == "ygg_mat_ygg_necron_blade" then
                    if context.individual and context.cardarea == G.play and context.equipped then
                        G.GAME["ygg_necron_blade_wither_essence"] = (G.GAME["ygg_necron_blade_wither_essence"] or 0) + 1
                        SMODS.calculate_ygg_effect({message = "+1", colour = G.C.DARK_EDITION}, context.other_card)

                        if G.GAME["ygg_necron_blade_wither_essence"] >= 10 then
                            G.GAME["ygg_necron_blade_wither_essence"] = G.GAME["ygg_necron_blade_wither_essence"] - 10
                            return{
                                xmult = 1.25
                            }
                        end
                    end
                elseif card.config.center.key == "ygg_mat_ygg_misprinted_talisman" then
                    if context.joker_main and context.equipped then
                        return{
                            xmult = 1 + pseudorandom("ygg_misprinted_talisman", -1, 5) * 0.1
                        }
                    end
                elseif card.config.center.key == "ygg_mat_ygg_alkov_blade" then
                    if context.joker_main and context.equipped then
                        if G.hand.cards and #G.hand.cards > 0 then
                            local random_cards = Yggdrasil.selectRandomCards(math.ceil(#G.hand.cards/2), G.hand.cards)
                            for _,v in ipairs(random_cards) do
                                SMODS.calculate_ygg_effect({xmult = 2}, v)
                            end
                            SMODS.destroy_cards(random_cards)
                        end
                    end
                    
                    if context.check_luck and context.equipped and G.playing_cards and #G.playing_cards < 20 then
                        return{
                            luck = 0.5
                        }
                    end

                    if context.check_xp and context.equipped and G.playing_cards and #G.playing_cards < 20 then
                        return{
                            xp_multi = 1.5
                        }
                    end
                elseif card.config.center.key == "ygg_mat_ygg_hyperion" then
                    if context.individual and context.cardarea == G.play and context.equipped then
                       G.GAME["ygg_hyperion_wither_essence"] = (G.GAME["ygg_hyperion_wither_essence"] or 0) + 1
                        SMODS.calculate_ygg_effect({message = "+1", colour = G.C.DARK_EDITION}, context.other_card)

                        if G.GAME["ygg_hyperion_wither_essence"] >= 5 then
                            G.GAME["ygg_hyperion_wither_essence"] = G.GAME["ygg_hyperion_wither_essence"] - 5
                            SMODS.calculate_ygg_effect({message = localize("ygg_wither_impact"), colour = G.C.DARK_EDITION}, G.deck)
                            for _,v in ipairs(G.hand.cards or {}) do
                                local unique = true
                                for _,v2 in ipairs(G.play.cards or {}) do
                                    if v:get_id() == v2:get_id() then unique = false break end
                                end
                                if unique then
                                    SMODS.calculate_ygg_effect({xmult = 2}, v)
                                end
                            end
                        end 
                    end
                elseif card.config.center.key == "ygg_mat_ygg_digging_shovel" then
                    if context.individual and context.cardarea == G.play and context.equipped and pseudorandom("digging_shovel_roll") <= G.GAME.probabilities.normal / 8 then
                        G.E_MANAGER:add_event(Event({
                            func = function() 
                                if #G.jokers.cards < G.jokers.config.card_limit then
                                    local new_card = SMODS.add_card({set = "Joker"})
                                    SMODS.calculate_ygg_effect({message = localize("ygg_dug"), message_card = new_card}, new_card)
                                    delay(0.3)
                                end
                                return true 
                            end
                        }))
                    end
                elseif card.config.center.key == "ygg_mat_ygg_golden_shovel" then
                    if context.individual and context.cardarea == G.play and context.equipped and pseudorandom("golden_shovel_roll") <= G.GAME.probabilities.normal / 4 then
                        G.E_MANAGER:add_event(Event({
                            func = function() 
                                if #G.jokers.cards < G.jokers.config.card_limit then
                                    local new_card = SMODS.add_card({set = "Joker"})
                                    SMODS.calculate_ygg_effect({message = localize("ygg_dug"), message_card = new_card}, new_card)
                                    delay(0.3)
                                end
                                return true 
                            end
                        }))
                    end
                    if context.check_luck and not context.equipped then
                        return{
                            luck = 0.1
                        }
                    end
                elseif card.config.center.key == "ygg_mat_ygg_astronaut_helmet" then
                    if context.other_consumeable and context.equipped and context.other_consumeable.ability.set == "Planet" then
                        return{
                            mult = 10
                        }
                    end
                elseif card.config.center.key == "ygg_mat_ygg_chains_of_eternity" then
                    if context.other_joker and context.equipped and context.other_joker.ability.eternal then
                        return{
                            xmult = 2
                        }
                    end
                elseif card.config.center.key == "ygg_mat_ygg_soul_engine" then
                    if context.check_gains and context.equipped then
                        return{
                            mult = 0.5
                        }
                    end
                elseif card.config.center.key == "ygg_mat_ygg_four_leaf_clover" then
                    if context.check_luck and context.equipped then
                        return{
                            luck = 0.2
                        }
                    end

                    if context.joker_main and context.equipped then
                        return{
                            xmult = 0.8
                        }
                    end
                elseif card.config.center.key == "ygg_mat_ygg_philosopher_quill" then
                    if context.check_xp and context.equipped then
                        return{
                            xp = 0.2
                        }
                    end
                elseif card.config.center.key == "ygg_mat_ygg_tome_of_knowledge" then
                    if context.check_xp and context.equipped then
                        return{
                            xp = 0.1 + (0.05 * math.floor(Yggdrasil.get_total_level()/100))
                        }
                    end
                elseif card.config.center.key == "ygg_mat_ygg_enchanted_book" then
                    if context.check_xp and context.equipped then
                        return{
                            xp = 0.5 + (0.1 * math.floor(Yggdrasil.get_total_level()/10))
                        }
                    end

                    if context.check_luck and context.equipped then
                        return{
                            luck = 0.2
                        }
                    end
                end
            end,
        }
    end
end

--SMODS.add_card({set = "YggMaterial", key = "ygg_mat_ygg_card_scrap", no_edition = true, area = G.jokers})