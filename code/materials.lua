--studied from CardSleeves' code.
SMODS.Atlas {
    key = "placeholder_mat",
    path = "placeholder_material.png",
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
        "harmony_core",
        "harmony_joker",
        "potassium",
        "gros_michel",
        "sharp_spear",
        "astronaut_helmet",
    },
    rare = {
        "misprinted_essence",
        "potassium_overload",
        "cavendish"
    },
    legendary = {
        "soul_fragment",
        "soul_engine",
        "chains_of_eternity",
    },
}

for rarity,rarity_info in pairs(rarities) do
    for _,mat_key in ipairs(rarity_info) do
        Yggdrasil.Material{
            key = mat_key,
            atlas = "placeholder_mat",
            pos = { x = 0, y = 0 },
            display_size = { w = 50, h = 50 },
            unlocked = true,
            discovered = true,
            loc_vars = function(self)
                local to_vars = {}
                if mat_key == "gros_michel" or mat_key == "cavendish" then
                    to_vars[#to_vars+1] = (G.GAME["ygg_"..mat_key.."_disabled"] and localize("ygg_inactive")) or localize("ygg_active") 
                end
                if rarity ~= "common" then
                    to_vars["colours"] = {G.C["ygg_"..rarity]}
                end
                return {vars = to_vars}
            end,
            set_badges = function(self,card,badges)
                badges[#badges+1] = create_badge(localize('k_YggMaterial_text'), HEX("4aa5ff"), G.C.WHITE, 1.2 )
            end,
        }  
    end
end

--SMODS.add_card({set = "YggMaterial", key = "ygg_mat_ygg_card_scrap", no_edition = true, area = G.jokers})