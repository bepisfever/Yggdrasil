--studied from CardSleeves' code.
SMODS.Atlas {
    key = "placeholder_mat",
    path = "placeholder_material.png",
    px = 50,
    py = 50
}

Yggdrasil.Material{
    key = "card_scrap",
    name = "Card Scraps",
    atlas = "placeholder_mat",
    pos = { x = 0, y = 0 },
    display_size = { w = 50, h = 50 },
    unlocked = true,
    loc_vars = function(self)
        return { vars = {} }
    end,
    set_badges = function(self,card,badges)
        badges[#badges+1] = create_badge(localize('k_YggMaterial_text'), HEX("4aa5ff"), G.C.WHITE, 1.2 )
    end,
}

--SMODS.add_card({set = "YggMaterial", key = "ygg_mat_ygg_card_scrap", no_edition = true, area = G.jokers})