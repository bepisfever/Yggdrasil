YggMaterialChance = {
    uncommon = {chance = 1/4, priority = 1},
    rare = {chance = 1/10, priority = 2},
    legendary = {chance = 1/20, priority = 3}
}
YggMaterialList = {
    common = {
        {id = "card_scrap", min_obtain_cap = 2, max_obtain_cap = 5, blind_req = "All", rarity = "common"},
    },
    uncommon = {
        {id = "broken_spade", min_obtain_cap = 1, max_obtain_cap = 1, blind_req = "Small", rarity = "uncommon"}
    },
    rare = {
        {id = "misprinted_essence", min_obtain_cap = 1, max_obtain_cap = 1, blind_req = "Big", rarity = "rare"}
    },
    legendary = {
        {id = "soul_fragment", min_obtain_cap = 1, max_obtain_cap = 1, blind_req = "Boss", rarity = "legendary"}
    },
}

--thank you cardsleeves 
Yggdrasil.Material = SMODS.Center:extend {
    class_prefix = "ygg_mat",
    discovered = false,
    unlocked = true,
    set = "YggMaterial",
    config = {},
    badge_colour = HEX("edc95c"), --i dont even think this works
    required_params = { "key", "atlas", "pos" },
    prefix_config = {
        class = false
    },
    pre_inject_class = function(self)
        G.P_CENTER_POOLS[self.set] = {}
    end,
    get_obj = function(self, key)
        if key == nil then
            return nil
        end
        return self.obj_table[key] or SMODS.Center:get_obj(key)
    end,
    set_card_type_badge = function(self, card, badges) --oh my fucking god thank you myst :sob:
        badges = {}
    end,
}

function SMODS.current_mod.process_loc_text()
    -- will crash the game if removed (got it :3)
    G.localization.descriptions.YggMaterial = G.localization.descriptions.YggMaterial or {}
end

function create_ygg_loot_desc(type)
    local nodes = {}
    nodes[#nodes+1] = {}
    local loc_vars = {scale = 1.5}
    localize({type = 'descriptions', key = "ygg_test_name", set = 'Other', nodes = nodes[#nodes], vars = loc_vars.vars, scale = loc_vars.scale, text_colour = G.C.WHITE, shadow = true, float = true})
    nodes[#nodes] = desc_from_rows(nodes[#nodes])
    nodes[#nodes].config.colour = G.C.CLEAR
    nodes[#nodes].config.minh = loc_vars.minh or 0.2
    nodes[#nodes].config.align = "bm"

    if G.GAME["loot_table"][type.."Loots"] then
        for _,v in ipairs(G.GAME["loot_table"][type.."Loots"]) do
            nodes[#nodes+1] = {}
            local loc_vars = {scale = 0.925, text_colour = G.C.WHITE, background_colour = G.C.CLEAR, vars = {v.amount, localize("ygg_"..v.info.id), localize("ygg_"..v.info.rarity), colours = { G.C["ygg_"..v.info.rarity]},}}
            localize({type = 'descriptions', key = "ygg_test", set = 'Other', nodes = nodes[#nodes], vars = loc_vars.vars, scale = loc_vars.scale, text_colour = loc_vars.text_colour, shadow = loc_vars.shadow})
            nodes[#nodes] = desc_from_rows(nodes[#nodes])
            nodes[#nodes].config.colour = loc_vars.background_colour or nodes[#nodes].config.colour
            nodes[#nodes].config.outline = 0.7
            nodes[#nodes].config.outline_colour = G.C.GRAY
        end
    else
        nodes[#nodes+1] = {}
        local loc_vars = {scale = 0.925, text_colour = G.C.WHITE, background_colour = G.C.CLEAR, vars = {G.GAME["loot_table"][type.."Amount"], localize("ygg_"..G.GAME["loot_table"][type]["id"]), localize("ygg_"..G.GAME["loot_table"][type]["rarity"]), colours = { G.C["ygg_"..G.GAME["loot_table"][type]["rarity"]]},}}
        localize({type = 'descriptions', key = "ygg_test", set = 'Other', nodes = nodes[#nodes], vars = loc_vars.vars, scale = loc_vars.scale, text_colour = loc_vars.text_colour, shadow = loc_vars.shadow})
        nodes[#nodes] = desc_from_rows(nodes[#nodes])
        nodes[#nodes].config.colour = loc_vars.background_colour or nodes[#nodes].config.colour
        nodes[#nodes].config.outline = 0.7
        nodes[#nodes].config.outline_colour = G.C.GRAY
    end

    return
        {n = G.UIT.ROOT, 
        config = {
            r = 0.1,
            align = "cm", 
            padding = 0.07,
            colour = G.C.L_BLACK,
            outline = 1,
            outline_colour = G.C.GRAY,
        }, 
        nodes = nodes
    }
end

function roll_material_rng(type)
    local valid_pool = {}
    for i,v in pairs(YggMaterialList) do
        for _,mat_info in ipairs(v) do
            if not mat_info.blind_req or mat_info.blind_req == "All" or mat_info.blind_req == type then
                if not valid_pool[i] then valid_pool[i] = {} end
                valid_pool[i][#valid_pool[i]+1] = mat_info
            end
        end 
    end

    local total_luck_change = 1
    for _,v in pairs(G.GAME.YGG_LUCK_BUFF or {}) do
        total_luck_change = total_luck_change * v.luck
    end
    local chosen_rarities = {}
    for i,_ in pairs(valid_pool) do
        if YggMaterialChance[i] and pseudorandom("ygg_rollrarity_"..i) <= (YggMaterialChance[i]["chance"] * total_luck_change) then
            chosen_rarities[#chosen_rarities+1] = i
        end
    end

    local current_priority = nil
    local chosen_rarity = nil
    for _,v in pairs(chosen_rarities) do
        if not current_priority or YggMaterialChance[v]["priority"] > current_priority then
            current_priority = YggMaterialChance[v]["priority"]
            chosen_rarity = v
        end
    end
    if not chosen_rarity then chosen_rarity = "common" end

    local randomMat = pseudorandom_element(valid_pool[chosen_rarity], pseudoseed("roll_material_rng_roll"))
    local random_amount = pseudorandom("roll_material_rng_roll_amount", randomMat["min_obtain_cap"] or 1, randomMat["max_obtain_cap"] or 1)
    return randomMat, random_amount
end

local hookTo = UIElement.hover
function UIElement:hover()     
    if self.config.id == "select_blind_button" then
        --self.config.ref_table
        local check = nil
        if self.config.ref_table.key == "bl_small" then
            check = "Small"
        elseif self.config.ref_table.key == "bl_big" then
            check = "Big"
        elseif self.config.ref_table.boss then
            check = "Boss"
        end
        self.config.h_popup = create_ygg_loot_desc(check)
        self.config.h_popup_config = {align="tm", offset = {x=0,y=-0.2}, parent = self}
    end

    self.config.is_hovered = true

    hookTo(self)
end

local game_start_run_ref = Game.start_run
function Game:start_run(args)
    game_start_run_ref(self, args)

    if not G.GAME["loot_table"] then
        local allBlindTypes = {"Small", "Big", "Boss"}
        G.GAME["loot_table"] = {}
        for _,v in ipairs(allBlindTypes) do
            local amountOfMat = pseudorandom("amountOfMat_check",1,3)
            for i = 1,amountOfMat do
                local mat, amt = roll_material_rng(v)
                if not G.GAME["loot_table"][v.."Loots"] then G.GAME["loot_table"][v.."Loots"] = {} end

                G.GAME["loot_table"][v.."Loots"][#G.GAME["loot_table"][v.."Loots"] + 1] = {info = mat, amount = amt}
            end
        end
    end
end