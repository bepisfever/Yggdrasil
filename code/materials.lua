--studied from CardSleeves' code.
local use_placeholder_art = true

SMODS.Atlas {
    key = "placeholder_mat",
    path = "placeholder_material.png",
    px = 50,
    py = 50
}

SMODS.Atlas {
    key = "ygg_item_atlas1",
    path = "ygg_item_atlas1.png",
    px = 50,
    py = 50
}

SMODS.Atlas {
    key = "ygg_item_atlas2",
    path = "ygg_item_atlas2.png",
    px = 50,
    py = 50
}

SMODS.Atlas {
    key = "ygg_placeholder_atlas",
    path = "ygg_placeholder_atlas.png",
    px = 50,
    py = 50
}

local rarities = {
    common = {
        "card_scrap",
        "half_a_chip",
        "fixed_joker",
        "fixed_blue_joker",
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
    },
    rare = {
        "misprinted_essence",
        "potassium_overload",
        "cavendish",
        "misprinted_talisman",
    },
    legendary = {
        "soul_fragment",
        "soul_engine",
        "chains_of_eternity",
    },
    exotic = {
        "vial_of_rainbow",
        "rainbow_element"
    },
}

local art_credit = {
    ygg_item_atlas1 = "ygg_credit1"
}

local placeholder_atlas_to_use = {}
local placeholder_keys = {
    {"astronaut_helmet", "broken_spade", "card_scrap", "cavendish", "chains_of_eternity", "clover_talisman"},
    {"cupid_bow", "dead_clover", "diamond_staff", "fixed_blue_joker", "fixed_joker", "fractured_diamond"},
    {"gros_michel", "half_a_chip", "harmony_core", "harmony_joker", "misprinted_essence", "misprinted_talisman"},
    {"potassium", "potassium_overload", "rainbow_element", "sharp_spear", "shattered_heart", "soul_engine"},
    {"soul_fragment", "vial_of_rainbow"},
}

for i,v in ipairs(placeholder_keys) do
    for i2, key in ipairs(v) do
        placeholder_atlas_to_use[key] = { x = (i2-1), y = (i-1) }
    end
end

local atlas_to_use = {
    misprinted_essence = {
        atlas = "ygg_item_atlas1",
        pos = { x = 0, y = 0 },
    },
    half_a_chip = {
        atlas = "ygg_item_atlas1",
        pos = { x = 1, y = 0 },
    },
    fixed_joker = {
        atlas = "ygg_item_atlas1",
        pos = { x = 2, y = 0 },
    },
    fixed_blue_joker = {
        atlas = "ygg_item_atlas1",
        pos = { x = 3, y = 0 },
    },
    soul_fragment = {
        atlas = "ygg_item_atlas1",
        pos = { x = 4, y = 0 },
    },
    potassium = {
        atlas = "ygg_item_atlas1",
        pos = { x = 0, y = 1 },
    },
    potassium_overload = {
        atlas = "ygg_item_atlas1",
        pos = { x = 1, y = 1 },
    },
    gros_michel = {
        atlas = "ygg_item_atlas1",
        pos = { x = 2, y = 1 },
    },
    cavendish = {
        atlas = "ygg_item_atlas1",
        pos = { x = 3, y = 1 },
    },
    soul_engine = {
        atlas = "ygg_item_atlas1",
        pos = { x = 4, y = 1 },
    },
    astronaut_helmet = {
        atlas = "ygg_item_atlas2",
        pos = { x = 0, y = 0 },
    },
    chains_of_eternity = {
        atlas = "ygg_item_atlas2",
        pos = { x = 1, y = 0 },
    },
}
--credit colour: HEX("8f61fa")
for rarity,rarity_info in pairs(rarities) do
    for _,mat_key in ipairs(rarity_info) do
        local atlasToUse = nil
        local pos_to_use = nil

        if atlas_to_use[mat_key] then
            atlasToUse = atlas_to_use[mat_key].atlas
            pos_to_use = atlas_to_use[mat_key].pos
        end

        if not atlasToUse or use_placeholder_art then atlasToUse = "placeholder_mat" end
        if not pos_to_use or use_placeholder_art then pos_to_use = { x = 0, y = 0 } end

        if use_placeholder_art then
            atlasToUse = "ygg_placeholder_atlas"
            pos_to_use = placeholder_atlas_to_use[mat_key]
        end

        Yggdrasil.Material{
            key = mat_key,
            atlas = atlasToUse,
            pos = pos_to_use,
            display_size = { w = 50, h = 50 },
            unlocked = true,
            discovered = true,
            loc_vars = function(self, info_queue, card)
                local to_vars = {}
                if mat_key == "gros_michel" or mat_key == "cavendish" then
                    to_vars[#to_vars+1] = (G.GAME["ygg_"..mat_key.."_disabled"] and localize("ygg_inactive")) or localize("ygg_active") 
                end
                if rarity ~= "common" then
                    to_vars["colours"] = {G.C["ygg_"..rarity]}
                end

                local string = "Amount: "
                local amt = 0
                for _,v in ipairs(G.PROFILES[G.SETTINGS.profile]["YggInventory"]) do
                    if v.id == mat_key then amt = amt + 1 end
                end

                string = string..amt

                main_end = (card.ability.ygg_from_inventory) and {
                    {n = G.UIT.C, config = {algin = "bm", minh = 0}, nodes = {
                        {n = G.UIT.R, config = {algin = "bm", minh = 0}, nodes = {
                            {n = G.UIT.T, config = {text = string, colour = G.C.UI.TEXT_DARK, scale = 0.3}},
                        }},
                    }},
                } or nil
                return {vars = to_vars, main_end = main_end}
            end,
            set_badges = function(self,card,badges)
                if Yggdrasil.get_type_of_item(mat_key) == "material" then
                    badges[#badges+1] = create_badge(localize('k_YggMaterial_text'), HEX("4aa5ff"), G.C.WHITE, 1.2 )
                elseif Yggdrasil.get_type_of_item(mat_key) == "relic" then
                    badges[#badges+1] = create_badge(localize('k_YggRelic_text'), HEX("4aa5ff"), G.C.WHITE, 1.2 )
                end
                if art_credit[atlasToUse] then
                    badges[#badges+1] = create_badge(localize(art_credit[atlasToUse]), HEX("8f61fa"), G.C.WHITE, 1 )
                end
            end,
        }  
    end
end

--SMODS.add_card({set = "YggMaterial", key = "ygg_mat_ygg_card_scrap", no_edition = true, area = G.jokers})