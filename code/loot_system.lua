--G.GAME.stake (num)

--Welcome to the most bs thing I ever worked on.
G.E_MANAGER.queues.yggdrasil = {} --referenced from Galdur, credits to Eremel :3
YggMaterialChance = {
    --[[
    ALL rarities should be listed here. Priority is important.
    ]]
    uncommon = {chance = 1/4, priority = 1},
    rare = {chance = 1/10, priority = 2},
    legendary = {chance = 1/25, priority = 3},
    exotic = {chance = 1/200, priority = 4},
}
YggMaterialList = {
    --[[
    Format:
    rarity = {
        {id = "id", craft_id = "craft_id", min_obtain_cap = 1, max_obtain_cap = 1, blind_req = "All", rarity = "common", mod_prefix = "ygg", stake_req = 1}
    },

    - id (str): The equivalent of keys.
    - craft_id (str, optional): Used in YggCraftingRecipes to shorten the text.
    - min_obtain_cap, max_obtain_cap (num): To tell how many of that material you can get at a time from Blind drops.
    - min_stake, max_stake (num): To tell which stake the material should drop. min_stake is 1 by default.
    - min_ante, max_ante (num: ): To tell which ante the material should drop. min_stake is 1 by default.
    - blind_req (str):
        + "All": Material can be encountered in all Blind types.
        + "Small", "Big", "Boss": Material can only be encountered in a specific Blind type.
    - rarity (str): Rarity of the material. It should be listed in YggMaterialChance.
    - mod_prefix (str): The mod prefix of the material's object.
    - unique (bool): This material/relic will not appear if it's already in the inventory.
    ]]
    common = {
        {id = "card_scrap", craft_id = "cs", min_obtain_cap = 1, max_obtain_cap = 3, blind_req = "All", rarity = "common", mod_prefix = "ygg"},
        {id = "half_a_chip", craft_id = "hac", min_obtain_cap = 1, max_obtain_cap = 3, blind_req = "All", rarity = "common", mod_prefix = "ygg"},
    },
    uncommon = {
        {id = "broken_spade", craft_id = "bs", min_obtain_cap = 1, max_obtain_cap = 1, blind_req = "Small", rarity = "uncommon", mod_prefix = "ygg"},
        {id = "shattered_heart", craft_id = "sh", min_obtain_cap = 1, max_obtain_cap = 1, blind_req = "Small", rarity = "uncommon", mod_prefix = "ygg"},
        {id = "fractured_diamond", craft_id = "fd", min_obtain_cap = 1, max_obtain_cap = 1, blind_req = "Small", rarity = "uncommon", mod_prefix = "ygg"},
        {id = "dead_clover", craft_id = "dc", min_obtain_cap = 1, max_obtain_cap = 1, blind_req = "Small", rarity = "uncommon", mod_prefix = "ygg"},
        {id = "harmony_core", craft_id = "hc", min_obtain_cap = 1, max_obtain_cap = 1, blind_req = "Big", rarity = "uncommon", mod_prefix = "ygg"},
        {id = "potassium", craft_id = "pota", min_obtain_cap = 1, max_obtain_cap = 1, blind_req = "Boss", rarity = "uncommon", mod_prefix = "ygg"},
        {id = "astronaut_helmet", craft_id = "ast_h", min_obtain_cap = 1, max_obtain_cap = 1, blind_req = "Big", rarity = "uncommon", mod_prefix = "ygg", unique = true},
    },
    rare = {
        {id = "misprinted_essence", craft_id = "me", min_obtain_cap = 1, max_obtain_cap = 1, blind_req = "Big", rarity = "rare", mod_prefix = "ygg"},
        {id = "potassium_overload", craft_id = "pota_o", min_obtain_cap = 1, max_obtain_cap = 1, blind_req = "Boss", rarity = "rare", mod_prefix = "ygg"},
    },
    legendary = {
        {id = "soul_fragment", craft_id = "sf", min_obtain_cap = 1, max_obtain_cap = 1, blind_req = "Boss", rarity = "legendary", mod_prefix = "ygg"},
        {id = "chains_of_eternity", craft_id = "coe", min_obtain_cap = 1, max_obtain_cap = 1, blind_req = "Boss", rarity = "legendary", mod_prefix = "ygg", unique = true},
    },
    exotic = {
        {id = "vial_of_rainbow", craft_id = "vor", min_obtain_cap = 1, max_obtain_cap = 1, blind_req = "Boss", rarity = "exotic", mod_prefix = "ygg"},
    },

    --Type sorting here.
    relic = {
        {id = "fixed_joker", craft_id = "fj", rarity = "common", mod_prefix = "ygg"},
        {id = "fixed_blue_joker", craft_id = "fbj", rarity = "common", mod_prefix = "ygg"},
        {id = "harmony_joker", craft_id = "hj", rarity = "uncommon", mod_prefix = "ygg"},
        {id = "gros_michel", craft_id = "g_m", rarity = "uncommon", mod_prefix = "ygg"},
        {id = "sharp_spear", craft_id = "s_p", rarity = "uncommon", mod_prefix = "ygg"},
        {id = "cupid_bow", craft_id = "c_b", rarity = "uncommon", mod_prefix = "ygg"},
        {id = "diamond_staff", craft_id = "d_s", rarity = "uncommon", mod_prefix = "ygg"},
        {id = "clover_talisman", craft_id = "c_t", rarity = "uncommon", mod_prefix = "ygg"},
        {id = "cavendish", craft_id = "cav", rarity = "rare", mod_prefix = "ygg"},
        {id = "misprinted_talisman", craft_id = "mt", rarity = "rare", mod_prefix = "ygg"},
        {id = "soul_engine", craft_id = "soul_e", rarity = "legendary", mod_prefix = "ygg"},
        {id = "rainbow_element", craft_id = "r_e", rarity = "exotic", mod_prefix = "ygg"},
        {id = "chains_of_eternity", craft_id = "coe", min_obtain_cap = 1, max_obtain_cap = 1, blind_req = "Boss", rarity = "legendary", mod_prefix = "ygg", unique = true},
        {id = "astronaut_helmet", craft_id = "ast_h", min_obtain_cap = 1, max_obtain_cap = 1, blind_req = "Big", rarity = "uncommon", mod_prefix = "ygg", unique = true},
    },
    material = {
        {id = "card_scrap", craft_id = "cs", min_obtain_cap = 1, max_obtain_cap = 3, blind_req = "All", rarity = "common", mod_prefix = "ygg"},
        {id = "half_a_chip", craft_id = "hac", min_obtain_cap = 1, max_obtain_cap = 3, blind_req = "All", rarity = "common", mod_prefix = "ygg"},
        {id = "broken_spade", craft_id = "bs", min_obtain_cap = 1, max_obtain_cap = 1, blind_req = "Small", rarity = "uncommon", mod_prefix = "ygg"},
        {id = "shattered_heart", craft_id = "sh", min_obtain_cap = 1, max_obtain_cap = 1, blind_req = "Small", rarity = "uncommon", mod_prefix = "ygg"},
        {id = "harmony_core", craft_id = "hc", min_obtain_cap = 1, max_obtain_cap = 1, blind_req = "Big", rarity = "uncommon", mod_prefix = "ygg"},
        {id = "potassium", craft_id = "pota", min_obtain_cap = 1, max_obtain_cap = 1, blind_req = "Boss", rarity = "uncommon", mod_prefix = "ygg"},
        {id = "fractured_diamond", craft_id = "fd", min_obtain_cap = 1, max_obtain_cap = 1, blind_req = "Small", rarity = "uncommon", mod_prefix = "ygg"},
        {id = "dead_clover", craft_id = "dc", min_obtain_cap = 1, max_obtain_cap = 1, blind_req = "Small", rarity = "uncommon", mod_prefix = "ygg"},
        {id = "misprinted_essence", craft_id = "me", min_obtain_cap = 1, max_obtain_cap = 1, blind_req = "Big", rarity = "rare", mod_prefix = "ygg"},
        {id = "potassium_overload", craft_id = "pota_o", min_obtain_cap = 1, max_obtain_cap = 1, blind_req = "Boss", rarity = "rare", mod_prefix = "ygg"},
        {id = "soul_fragment", craft_id = "sf", min_obtain_cap = 1, max_obtain_cap = 1, blind_req = "Boss", rarity = "legendary", mod_prefix = "ygg"},
        {id = "vial_of_rainbow", craft_id = "vor", min_obtain_cap = 1, max_obtain_cap = 1, blind_req = "Boss", rarity = "exotic", mod_prefix = "ygg"},
    },
}
YggCraftingRecipes = {
    --[[
    Format:
    object_key = {
        recipe = { --The number of tables represents rows.
            {"craft_id/id", "craft_id/id"},
            {"craft_id/id", "craft_id/id"},
            {"craft_id/id", "craft_id/id"},
        },
        config:
        - amount (num): How many of that item will be given. Default is 1.
        - immediate_emplace (bool): For consumables and jokers. They are immediately placed in their respective areas.
        - specific_area (str): For consumables and jokers. They are placed in that area specifically.
        - unique (bool): Usually for Relics specifically. If this is true, prevents crafting this item if it already exists in the inventory.
        - no_order (bool): Disables fixed positioning of the crafting recipe.
    },
    ]]

    {
        card_key = "c_soul",
        recipe = {
            {"cs", "cs", "cs"},
            {"cs", "sf", "cs"},
            {"cs", "cs", "cs"},
        },
        config = {
            amount = 1,
            immediate_emplace = true,
            specific_area = "consumeables"
        }
    },
    {
        card_key = "j_joker",
        recipe = {
            {"cs", "cs"},
            {"cs", "cs"},
        },
        config = {
            amount = 1,
            immediate_emplace = true,
            specific_area = "jokers"
        }
    },
    {
        card_key = "ygg_mat_ygg_fixed_joker",
        recipe = {
            {"cs", "cs", "cs"},
            {"cs", "cs", "cs"},
            {"cs", "cs", "cs"},
        },
        config = {
            amount = 1,
            unique = true
        }
    },
    {
        card_key = "ygg_mat_ygg_gros_michel",
        recipe = {
            {"cs", "cs", "cs"},
            {"cs", "pota", "cs"},
            {"cs", "cs", "cs"},
        },
        config = {
            amount = 1,
            unique = true
        }
    },
    {
        card_key = "ygg_mat_ygg_sharp_spear",
        recipe = {
            {"bs", "bs"},
            {"bs", "bs"},
        },
        config = {
            amount = 1,
            unique = true
        }
    },
    {
        card_key = "ygg_mat_ygg_cupid_bow",
        recipe = {
            {"sh", "sh"},
            {"sh", "sh"},
        },
        config = {
            amount = 1,
            unique = true
        }
    },
    {
        card_key = "ygg_mat_ygg_diamond_staff",
        recipe = {
            {"fd", "fd"},
            {"fd", "fd"},
        },
        config = {
            amount = 1,
            unique = true
        }
    },
    {
        card_key = "ygg_mat_ygg_clover_talisman",
        recipe = {
            {"dc", "dc"},
            {"dc", "dc"},
        },
        config = {
            amount = 1,
            unique = true
        }
    },
    {
        card_key = "ygg_mat_ygg_cavendish",
        recipe = {
            {"pota_o", "g_m"}
        },
        config = {
            amount = 1,
            unique = true,
            no_order = true
        }
    },
    {
        card_key = "ygg_mat_ygg_fixed_blue_joker",
        recipe = {
            {"hac", "hac", "hac"},
            {"hac", "fj", "hac"},
            {"hac", "hac", "hac"},
        },
        config = {
            amount = 1,
            unique = true
        }
    },
    {
        card_key = "ygg_mat_ygg_soul_engine",
        recipe = {
            {"cs", "cs", "cs"},
            {"cs", "sf", "cs"},
            {"cs", "hc", "cs"},
        },
        config = {
            amount = 1,
            unique = true
        }
    },
    {
        card_key = "ygg_mat_ygg_harmony_joker",
        recipe = {
            {"fbj", "fj", "hc"}
        },
        config = {
            amount = 1,
            unique = true,
            no_order = true
        }
    },
    {
        card_key = "ygg_mat_ygg_rainbow_element",
        recipe = {
            {"s_p","c_b","d_s","c_t","vor"}
        },
        config = {
            amount = 1,
            unique = true,
            no_order = true
        }
    },
    {
        card_key = "ygg_mat_ygg_misprinted_talisman",
        recipe = {
            {"cs", "cs"},
            {"cs", "me"},
        },
        config = {
            amount = 1,
            unique = true
        }
    }
} 

YggRelicEffects = {
    --[[
    Format:
    mat_key = {
        config:
        - mult/chips (num): Give that many mult/chips.
        - xmult/xchips (num): Increase xmult/xchips by that amount.
        - has_disable (bool): The relic can be disabled.
        - mult/chips/xmult/xchips.."_multi" (num): Used to increase all mult/chips/xmult/xchips source by that amount.
        - retrigger_times (num): Retrigger ALL effects of relics (if possible) this amount of time.
    },
    ]]

    fixed_joker = {
        config = {
            mult = 3,
        }
    },
    fixed_blue_joker = {
        config = {
            chips = 20
        }
    },
    harmony_joker = {
        config = {
            chips = 20,
            mult = 5,
        }
    },
    gros_michel = {
        config = {
            mult = 10,
            has_disable = true,
        }
    },
    cavendish = {
        config = {
            xmult = 0.5,
            has_disable = true,
        }
    },
    soul_engine = {
        config = {
            mult_multi = 1.5,
        }
    }
}

Yggdrasil.get_type_table = function() --Returns a table with items in type tables only.
    local valid_list = {}
    for rarity, v in pairs(YggMaterialList) do
        local valid = true
        if rarity == "common" then valid = false end
        if valid then
            for rarity2,_ in pairs(YggMaterialChance) do
                if rarity2 == rarity then valid = false break end
            end
        end

        if valid then
            valid_list[rarity] = v
        end
    end

    return valid_list
end

Yggdrasil.reset_inventory = function() --Does exactly like what it says.
    G.PROFILES[G.SETTINGS.profile]["YggInventory"] = {}
end

Yggdrasil.get_item = function(id) --Use this to find an item in YggMaterialList through an id/key.
    local find_item = nil
    for _,rarity in pairs(YggMaterialList) do
        for _,item in pairs(rarity) do
            if item.id == id then find_item = item break end
        end
    end

    return find_item
end

Yggdrasil.give_item = function(id, amt) --Give you that item, amt stands for amount.
    local find_item = Yggdrasil.get_item(id)

    if find_item then
        if not G.PROFILES[G.SETTINGS.profile]["YggInventory"] then G.PROFILES[G.SETTINGS.profile]["YggInventory"] = {} end
        for _ = 1, (amt or 1) do
            G.PROFILES[G.SETTINGS.profile]["YggInventory"][#G.PROFILES[G.SETTINGS.profile]["YggInventory"]+1] = find_item
        end
        return find_item
    end
end

Yggdrasil.get_true_key = function(card, key, mod_prefix) --Get the id/key of an item through its Object's key.
    if card then
        local class_prefix = "ygg_mat"
        local mod_prefix = card.config.center.mod.prefix
        local cutout_pos = #class_prefix + #mod_prefix + 3

        local final_key = string.sub(card.config.center.key, cutout_pos, #card.config.center.key) 
        return final_key
    else
        local class_prefix = "ygg_mat"
        local cutout_pos = #class_prefix + #mod_prefix + 3

        local final_key = string.sub(key, cutout_pos, #key) 
        return final_key
    end
end

Yggdrasil.get_craft_key = function(key) --Get the craft key/id of a normal key/id.
    for _,rarity in pairs(YggMaterialList) do
        for _,material in ipairs(rarity) do
            if material.id == key and material.craft_id then
                return material.craft_id
            end
        end
    end
    return nil
end

Yggdrasil.get_tk_from_ck = function(craft_key) --Get key/id from craft key/id.
    for _,rarity in pairs(YggMaterialList) do
        for _,material in ipairs(rarity) do
            if material.craft_id and material.craft_id == craft_key and material.id then
                return material.id
            end
        end
    end

    return craft_key
end

Yggdrasil.have_item = function(key, amt) --Check if you have that item in inventory, amt stands for amount.
    local amount = 0
    if amt then
        for _,v in ipairs(G.PROFILES[G.SETTINGS.profile]["YggInventory"] or {}) do
            if v.id == key then amount = amount + 1 end
        end

        if amount >= amt then return true end
    else
        for _,v in ipairs(G.PROFILES[G.SETTINGS.profile]["YggInventory"] or {}) do
            if v.id == key then return true end
        end
    end
    return false
end

Yggdrasil.item_exist = function(key, amt) --Check if you have that item in inventory, crafting AND delete zones, amt stands for amount.
    local amount = 0
    if amt then
        for _,v in ipairs(G.PROFILES[G.SETTINGS.profile]["YggInventory"] or {}) do
            if v.id == key then amount = amount + 1 end
        end

        for i = 1,3 do
            for _,v in ipairs(G.PROFILES[G.SETTINGS.profile]["YggCrafting"..i] or {}) do
                if v.id == key then amount = amount + 1 end
            end

            for _,v in ipairs(G.PROFILES[G.SETTINGS.profile]["YggDelete"..i] or {}) do
                if v.id == key then amount = amount + 1 end
            end
        end

        if amount >= amt then return true end
    else
        for _,v in ipairs(G.PROFILES[G.SETTINGS.profile]["YggInventory"] or {}) do
            if v.id == key then return true end
        end

        for i = 1,3 do
            for _,v in ipairs(G.PROFILES[G.SETTINGS.profile]["YggCrafting"..i] or {}) do
                if v.id == key then return true end
            end

            for _,v in ipairs(G.PROFILES[G.SETTINGS.profile]["YggDelete"..i] or {}) do
                if v.id == key then return true end
            end
        end
    end
    return false
end

Yggdrasil.amt_item_inv = function(key) --Return how many of that item you have in inventory. I would suggest using Yggdrasil.have_item instead if you are just checking whether that item exists for performance.
    local amount = 0
    for _,v in ipairs(G.PROFILES[G.SETTINGS.profile]["YggInventory"] or {}) do
        if v.id == key then amount = amount + 1 end
    end

    return amount
end

Yggdrasil.insert_loot_to_blind = function(key, blind, amt) --To insert loots to blinds' loot table, should be obvious eonugh.
    local found_mat = nil

    for _,rarity_list in pairs(YggMaterialList) do
        if found_mat then break end
        for _,mat_info in ipairs(rarity_list) do
            if mat_info.id == key then
                found_mat = mat_info
                break
            end
        end
    end

    if found_mat then
        if blind == "Small" or blind == "Big" or blind == "Boss" then
            if G.GAME["loot_table"][blind.."Loots"] then
                local exist = false
                for i,v in ipairs(G.GAME["loot_table"][blind.."Loots"]) do
                    if v.info.id == found_mat.id then
                        exist = true
                        G.GAME["loot_table"][blind.."Loots"][i] = {info = found_mat, amount = v.amount + (amt or 1)}
                        break
                    end
                end

                if not exist then
                    G.GAME["loot_table"][blind.."Loots"][#G.GAME["loot_table"][blind.."Loots"]+1] = {info = found_mat, amount = (amt or 1)}
                end
            else
                G.GAME["loot_table"][blind.."Loots"] = {}
                G.GAME["loot_table"][blind.."Loots"][#G.GAME["loot_table"][blind.."Loots"]+1] = {info = found_mat, amount = (amt or 1)}
            end
        else
            print("blind type isn't correct (needs to be Small, Big, or Boss)")
        end
    end
end

Yggdrasil.check_mat_conflict = function() --Check the entire YggMaterialList for every conflict in id and craft_id. Useful for debugging.
    local conflict_ids = {}
    local conflict_craft_ids = {}

    local valid_list = Yggdrasil.get_type_table()

    for _,v in pairs(valid_list) do
        for _,mat in ipairs(v) do
            if not conflict_craft_ids[mat.craft_id] then conflict_craft_ids[mat.craft_id] = {} end
            conflict_craft_ids[mat.craft_id][#conflict_craft_ids[mat.craft_id]+1] = mat.id

            if not conflict_ids[mat.id] then conflict_ids[mat.id] = {} end
            conflict_ids[mat.id][#conflict_ids[mat.id]+1] = mat.craft_id
        end
    end

    for craft_id,v in pairs(conflict_craft_ids) do
        if #v > 1 then
            local add_text = ""
            for _,id in ipairs(v) do
                add_text = add_text..id..","
            end
            add_text = string.sub(add_text,1,(#add_text-1))
            print("[Yggdrasil] Confict in craft_id ("..craft_id.."): "..add_text)
        end
    end

    for id,v in pairs(conflict_ids) do
        if #v > 1 then
            local add_text = ""
            for _,craft_id in ipairs(v) do
                add_text = add_text..craft_id..","
            end
            add_text = string.sub(add_text,1,(#add_text-1))
            print("[Yggdrasil] Confict in id ("..id.."): "..add_text)
        end
    end
end

Yggdrasil.get_type_of_item = function(key) --Get the type of the item from its key. (ex: material, relic, etc.)
    local list = Yggdrasil.get_type_table()

    for typ, typeTable in pairs(list) do
        for _, mat_info in ipairs(typeTable) do
            if mat_info.id == key then return typ end
        end
    end
    
    print("[Yggdrasil, get_type_of_item] Couldn't get item's type, are you sure the key is correct? ("..key..")")
    return nil
end

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

function create_ygg_loot_desc(type, specific)
    local nodes = {}
    nodes[#nodes+1] = {}
    local loc_vars = {scale = 1.5}
    localize({type = 'descriptions', key = "ygg_test_name", set = 'Other', nodes = nodes[#nodes], vars = loc_vars.vars, scale = loc_vars.scale, text_colour = G.C.WHITE, shadow = true, float = true})
    nodes[#nodes] = desc_from_rows(nodes[#nodes])
    nodes[#nodes].config.colour = G.C.CLEAR
    nodes[#nodes].config.minh = loc_vars.minh or 0.2
    nodes[#nodes].config.align = "bm"

    if specific == "Locked" then
        nodes[#nodes+1] = {}
        local loc_vars = {scale = 0.925, text_colour = G.C.WHITE, background_colour = G.C.CLEAR, vars = {}}
        localize({type = 'descriptions', key = "ygg_locked_test", set = 'Other', nodes = nodes[#nodes], vars = loc_vars.vars, scale = loc_vars.scale, text_colour = loc_vars.text_colour, shadow = loc_vars.shadow})
        nodes[#nodes] = desc_from_rows(nodes[#nodes])
        nodes[#nodes].config.colour = loc_vars.background_colour or nodes[#nodes].config.colour
        nodes[#nodes].config.outline = 0.7
        nodes[#nodes].config.outline_colour = G.C.GRAY
    else
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
            local loc_vars = {scale = 0.925, text_colour = G.C.WHITE, background_colour = G.C.CLEAR, vars = {G.GAME["loot_table"][type.."Amount"], localize("ygg_"..G.GAME["loot_table"][type.."Loots"]["id"]), localize("ygg_"..G.GAME["loot_table"][type.."Loots"]["rarity"]), colours = { G.C["ygg_"..G.GAME["loot_table"][type.."Loots"]["rarity"]]},}}
            localize({type = 'descriptions', key = "ygg_test", set = 'Other', nodes = nodes[#nodes], vars = loc_vars.vars, scale = loc_vars.scale, text_colour = loc_vars.text_colour, shadow = loc_vars.shadow})
            nodes[#nodes] = desc_from_rows(nodes[#nodes])
            nodes[#nodes].config.colour = loc_vars.background_colour or nodes[#nodes].config.colour
            nodes[#nodes].config.outline = 0.7
            nodes[#nodes].config.outline_colour = G.C.GRAY
        end
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
                local is_valid = true
                if mat_info.min_stake then
                    if (G.GAME.stake or 1) < mat_info.min_stake then
                        is_valid = false
                    end
                end

                if mat_info.min_ante then
                    if (G.GAME.round_resets.ante or 1) < mat_info.min_ante then
                        is_valid = false
                    end
                end

                if mat_info.max_stake then
                    if (G.GAME.stake or 1) > mat_info.max_stake then
                        is_valid = false
                    end
                end

                if mat_info.max_ante then
                    if (G.GAME.round_resets.ante or 1) > mat_info.max_ante then
                        is_valid = false
                    end
                end

                if mat_info.unique then
                    if Yggdrasil.item_exist(mat_info.id) then
                        is_valid = false
                    end
                end

                if is_valid then valid_pool[i][#valid_pool[i]+1] = mat_info end
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
        if self.config.ref_table.small then print(":3") end
        if self.config.ref_table.key == "bl_small" or self.config.ref_table.small then
            check = "Small"
        elseif self.config.ref_table.key == "bl_big" or self.config.ref_table.big then
            check = "Big"
        else
            check = "Boss"
        end

        if G.GAME.round_resets.blind_states[check] == "Upcoming" then
            self.config.h_popup = create_ygg_loot_desc(check, "Locked")
            self.config.h_popup_config = {align="tm", offset = {x=0,y=-0.2}, parent = self}
        elseif not (G.GAME.round_resets.blind_states[check] == "Defeated" or G.GAME.round_resets.blind_states[check] == "Skipped") then
            self.config.h_popup = create_ygg_loot_desc(check)
            self.config.h_popup_config = {align="tm", offset = {x=0,y=-0.2}, parent = self}
        else
            self.config.h_popup = nil
        end
    end

    if self.config.id == "ygg_search_option" or self.config.id == "ygg_recipe_search" then
        self.config.h_popup = create_skill_perk_desc(nil, nil, "ygg_search_option") --im lazy so reusing this :3
        self.config.h_popup_config = {align="tm", offset = {x=0,y=-0.2}, parent = self}
    end

    if self.config.id == "ygg_auto_delete" then
        self.config.h_popup = create_skill_perk_desc(nil, nil, self.config.id) --im lazy so reusing this :3
        self.config.h_popup_config = {align="tm", offset = {x=0,y=-0.2}, parent = self}
    end

    self.config.is_hovered = true

    hookTo(self)
end

function reset_blind_loots(specific_type)
    local allBlindTypes = {"Small", "Big", "Boss"}
    if specific_type then allBlindTypes = {specific_type} end
    if not G.GAME["loot_table"] then G.GAME["loot_table"] = {} end
    for _,v in ipairs(allBlindTypes) do
        local amountOfMat = pseudorandom("amountOfMat_check",1,3)
        G.GAME["loot_table"][v.."Loots"] = {}
        for i = 1,amountOfMat do
            local mat, amt = roll_material_rng(v)
            if not G.GAME["loot_table"][v.."Loots"] then G.GAME["loot_table"][v.."Loots"] = {} end

            G.GAME["loot_table"][v.."Loots"][#G.GAME["loot_table"][v.."Loots"] + 1] = {info = mat, amount = amt}
        end
    end
end

local game_start_run_ref = Game.start_run
function Game:start_run(args)
    game_start_run_ref(self, args)

    Yggdrasil.check_mat_conflict()

    if not G.GAME["loot_table"] then
        reset_blind_loots()
    end
end

local hookTo = end_round
end_round = function()
    local ret = hookTo()

    local blindtype = G.GAME.blind:get_type()
    if not blindtype then blindtype = "Boss" end
    for _,v in ipairs(G.GAME["loot_table"][blindtype.."Loots"]) do
        if not G.PROFILES[G.SETTINGS.profile]["YggInventory"] then G.PROFILES[G.SETTINGS.profile]["YggInventory"] = {} end
        local rarities_to_delete = {}
        if G.GAME["YggAutoDelete"] and type(G.GAME["YggAutoDelete"]) == "string" then            
            local delete_text = string.lower(Yggdrasil.remove_space(G.GAME["YggAutoDelete"]))
            local begin_pos = 1

            for i = 1 ,#delete_text do
                local char = string.sub(delete_text,i,i) 
                if char == "," or i == #delete_text then
                    rarities_to_delete[string.gsub(string.sub(delete_text,begin_pos,i),",","")] = true
                    begin_pos = i
                end
            end
        end
        
        for _ = 1, v.amount do
            if not rarities_to_delete[v.info.rarity] then
                G.PROFILES[G.SETTINGS.profile]["YggInventory"][#G.PROFILES[G.SETTINGS.profile]["YggInventory"]+1] = v.info
            end
        end
    end
    reset_blind_loots(blindtype)

    if G.GAME.blind:get_type() == "Boss" then
        reset_blind_loots()
    end

    return ret
end

--Code to drag card from Inventory to Crafting. Adapted from Aikoyori Shenanigans' code (check it out btw) ALL OF THESE CODE ARE ADAPTED FROM AIKO RAHH
function Yggdrasil.draw_card(from, to, percent, dir, sort, card, delay, mute, stay_flipped, vol, discarded_only, forced_facing)
    percent = percent or 50
    delay = delay or 0.1 
    if dir == 'down' then 
        percent = 1-percent
    end
    sort = sort or false
    local drawn = nil

    G.E_MANAGER:add_event(Event({
        trigger = 'before',
        delay = delay,
        blocking = not (G.SETTINGS.GAMESPEED >= 999 and ((to == G.hand and from == G.deck) or (to == G.deck and from == G.hand))), -- Has to be these specific draws only, otherwise it's buggy
        
        func = function()
            if card then 
                if from then card = from:remove_card(card) end
                if card then drawn = true end
                if card and to == G.hand and not card.states.visible then
                    card.states.visible = true
                end
                local stay_flipped = G.GAME and G.GAME.blind and G.GAME.blind:stay_flipped(to, card, from)
                if to then
                    to:emplace(card, nil, stay_flipped)
                else
                    
                end
                if card and forced_facing then 
                    card.sprite_facing = forced_facing
                    card.facing = forced_facing
                end
            else
                card = to:draw_card_from(from, stay_flipped, discarded_only)
                if card then drawn = true end
                if card and to == G.hand and not card.states.visible then
                    card.states.visible = true
                end
                if card and forced_facing then 
                    card.sprite_facing = forced_facing
                    card.facing = forced_facing
                end
            end
            if not mute and drawn then
                if from == G.deck or from == G.hand or from == G.play or from == G.jokers or from == G.consumeables or from == G.discard then
                    G.VIBRATION = G.VIBRATION + 0.6
                end
                play_sound('card1', 0.85 + percent*0.2/100, 0.6*(vol or 1))
            end
            if sort then
                to:sort()
            end
            SMODS.drawn_cards = SMODS.drawn_cards or {}
            if card and card.playing_card then SMODS.drawn_cards[#SMODS.drawn_cards+1] = card end
            
            if card and forced_facing then 
                card.facing = forced_facing
                card.sprite_facing = forced_facing
            end
            return true
        end
      }))
end

local toHook = Card.stop_drag
function Card:stop_drag()
    if G.ygg_hold_lshift and not self.ability.is_material then
        local c = toHook(self)
        return c
    end
    if self.ability.cannot_drag then
        local c = toHook(self)
        return c
    elseif self.ability.is_material then
        local area = self.area
        self.ygg_oldarea = self.area or self.ygg_oldarea
        for i, k in ipairs(G.CONTROLLER.collision_list) do
            if (k:is(CardArea)) then
                area = k
                break
            end
            
            if (k:is(Card)) and false then
                area = k.area
                break
            end
        end

        local found_recipe = nil
        for _,v in ipairs(YggCraftingRecipes) do
            if v.card_key and v.card_key == self.config.center.key then found_recipe = v end
        end
        if found_recipe["config"] and found_recipe["config"]["unique"] then
            local already_exist = false

            for _,v in ipairs(G.PROFILES[G.SETTINGS.profile]["YggInventory"]) do
                if v.id == Yggdrasil.get_true_key(self) then already_exist = true break end
            end

            if not already_exist then
                for i = 1,3 do
                    for _,v in ipairs(G.PROFILES[G.SETTINGS.profile]["YggCrafting"..i] or {}) do
                        if v.id == Yggdrasil.get_true_key(self) then already_exist = true break end
                    end
                end
            end

            if already_exist then
                local c = toHook(self)
                return c
            end
        end

        if area and area ~= self.area then
            local to_inventory = nil
            for i = 1,3 do
                if area == G["ygg_inventory_cardarea"..i] then to_inventory = G["ygg_inventory_cardarea"..i] break end
            end

            local recipe_list = nil
            local materials = {}
            for _,recipe_info in pairs(YggCraftingRecipes) do
                if recipe_info.card_key == self.config.center.key then recipe_list = recipe_info["recipe"] end
            end
            if recipe_list then
                for _,row in ipairs(recipe_list) do
                    for _,mat in ipairs(row) do
                        local true_key = Yggdrasil.get_tk_from_ck(mat) or mat
                        if not materials[true_key] then materials[true_key] = 0 end
                        materials[true_key] = materials[true_key] + 1
                    end
                end
            end

            if to_inventory then
                for i = 1,3 do --Removing materials.
                    if G["ygg_crafting_cardarea"..i] and G["ygg_crafting_cardarea"..i].cards then
                        for _,card in ipairs(G["ygg_crafting_cardarea"..i].cards) do
                            local for_crafting = false
                            local true_key = Yggdrasil.get_true_key(card)
                            for mat_key,_ in pairs(materials) do
                                if mat_key == true_key then for_crafting = true break end
                            end
                            if for_crafting then
                                G.E_MANAGER:add_event(Event({
                                    func = function() 
                                        G["ygg_crafting_cardarea"..i]:remove_card(card)
                                        card:remove()
                                        return true 
                                    end
                                }))
                                for mat_index,mat_info in ipairs(G.PROFILES[G.SETTINGS.profile]["YggCrafting"..i]) do
                                    if mat_info.id == true_key then
                                        table.remove(G.PROFILES[G.SETTINGS.profile]["YggCrafting"..i], mat_index)
                                    end
                                end
                                materials[true_key] = materials[true_key] - 1
                                if materials[true_key] <= 0 then materials[true_key] = nil end
                            end
                        end
                    end
                end

                G["ygg_crafting_show"]:remove_card(self)
                local found_recipe = nil
                for _,v in ipairs(YggCraftingRecipes) do
                    if v.card_key and v.card_key == self.config.center.key then found_recipe = v end
                end
                if not found_recipe["config"].immediate_emplace then
                    local true_key = Yggdrasil.get_true_key(self)
                    local item = Yggdrasil.get_item(true_key)
                    local to_emplace = (Yggdrasil.amt_item_inv(true_key) <= 0 and true) or false
                    if item then
                        G.PROFILES[G.SETTINGS.profile]["YggInventory"][#G.PROFILES[G.SETTINGS.profile]["YggInventory"]+1] = item
                    end
                    
                    if to_emplace then
                        Yggdrasil.draw_card(self.area, area, 1, 'up', nil, self ,0)
                        G.E_MANAGER:add_event(Event({
                            func = function() 
                                self.ygg_oldarea = nil
                                self:remove()
                                return true 
                            end
                        }))
                        area:align_cards()
                    else
                        G.E_MANAGER:add_event(Event({
                            func = function() 
                                self.ygg_oldarea = nil
                                self:remove()
                                return true 
                            end
                        }))
                    end
                else
                    for _ = 1, found_recipe["config"].amount or 1 do
                        if not found_recipe["config"].specific_area then
                            SMODS.add_card({key = self.config.center.key})
                        else
                            SMODS.add_card({key = self.config.center.key, area = G[found_recipe["config"].specific_area]})
                        end
                    end
                    G.E_MANAGER:add_event(Event({
                        func = function() 
                            self.ygg_oldarea = nil
                            self:remove()
                            return true 
                        end
                    }))
                end
                save_run()
            end
        local c = toHook(self)
        return c
        end
    end

    local area = self.area
    self.ygg_oldarea = self.area or self.ygg_oldarea
    for i, k in ipairs(G.CONTROLLER.collision_list) do
        if (k:is(CardArea)) then
            area = k
            break
        end
        
        if (k:is(Card)) and false then
            area = k.area
            break
        end
    end

    local valid_area = false
    for i = 1,3 do
        if area == G["ygg_inventory_cardarea"..i] then valid_area = true break end
        if area == G["ygg_crafting_cardarea"..i] then valid_area = true break end
        if area == G["ygg_delete_cardarea"..i] then valid_area = true break end
    end

    if area and area ~= self.area and valid_area then
        local cardarea = nil
        local cardarea_type = nil
        for i = 1,3 do
            if self.ygg_oldarea == G["ygg_inventory_cardarea"..i] then cardarea = G["ygg_inventory_cardarea"..i]; cardarea_type = "Inventory" break end
            if self.ygg_oldarea == G["ygg_crafting_cardarea"..i] then cardarea = G["ygg_crafting_cardarea"..i]; cardarea_type = "Crafting"..i break end
            if self.ygg_oldarea == G["ygg_delete_cardarea"..i] then cardarea = G["ygg_delete_cardarea"..i]; cardarea_type = "Delete"..i break end
        end
        local to_emplace = false
        local stop_create = false
        if cardarea then
            if cardarea_type and cardarea_type == "Inventory" then
                local class_prefix = "ygg_mat"
                local mod_prefix = self.config.center.mod.prefix
                local cutout_pos = #class_prefix + #mod_prefix + 3
                local is_to_inventory = false

                local final_key = string.sub(self.config.center.key, cutout_pos, #self.config.center.key)
                for i,v in ipairs(G.PROFILES[G.SETTINGS.profile]["YggInventory"] or {}) do
                    if v.id == final_key then
                        table.remove(G.PROFILES[G.SETTINGS.profile]["YggInventory"], i)
                        break
                    end
                end
                local true_key = Yggdrasil.get_true_key(self)
                if Yggdrasil.amt_item_inv(true_key) >= 1 then to_emplace = true end

                for i = 1,3 do
                    if area == G["ygg_crafting_cardarea"..i] then
                        local item = Yggdrasil.get_item(final_key)
                        if not G.PROFILES[G.SETTINGS.profile]["YggCrafting"..i] then G.PROFILES[G.SETTINGS.profile]["YggCrafting"..i] = {} end
                        if item then
                            G.PROFILES[G.SETTINGS.profile]["YggCrafting"..i][#G.PROFILES[G.SETTINGS.profile]["YggCrafting"..i]+1] = item
                        end
                    end

                    if area == G["ygg_delete_cardarea"..i] then
                        local item = Yggdrasil.get_item(final_key)
                        if not G.PROFILES[G.SETTINGS.profile]["YggDelete"..i] then G.PROFILES[G.SETTINGS.profile]["YggDelete"..i] = {} end
                        if item then
                            G.PROFILES[G.SETTINGS.profile]["YggDelete"..i][#G.PROFILES[G.SETTINGS.profile]["YggDelete"..i]+1] = item
                        end
                    end

                    if area == G["ygg_inventory_cardarea"..i] then
                        local item = Yggdrasil.get_item(final_key)
                        G.PROFILES[G.SETTINGS.profile]["YggInventory"][#G.PROFILES[G.SETTINGS.profile]["YggInventory"]+1] = item
                    end
                end
            elseif cardarea_type then
                for i = 1,3 do
                    if cardarea_type == "Crafting"..i then
                        local class_prefix = "ygg_mat"
                        local mod_prefix = self.config.center.mod.prefix or nil
                        local cutout_pos = #class_prefix + (#mod_prefix or - 2) + 3

                        local final_key = string.sub(self.config.center.key, cutout_pos, #self.config.center.key)

                        for i2,v in ipairs(G.PROFILES[G.SETTINGS.profile]["YggCrafting"..i] or {}) do
                            if v.id == final_key then
                                table.remove(G.PROFILES[G.SETTINGS.profile]["YggCrafting"..i], i2)
                                break
                            end
                        end

                        local true_key = Yggdrasil.get_true_key(self)
                        if Yggdrasil.amt_item_inv(true_key) >= 1 then stop_create = true end

                        for i2 = 1,3 do
                            if area == G["ygg_crafting_cardarea"..i2] then
                                local item = Yggdrasil.get_item(final_key)
                                if not G.PROFILES[G.SETTINGS.profile]["YggCrafting"..i2] then G.PROFILES[G.SETTINGS.profile]["YggCrafting"..i2] = {} end
                                if item then
                                    G.PROFILES[G.SETTINGS.profile]["YggCrafting"..i2][#G.PROFILES[G.SETTINGS.profile]["YggCrafting"..i2]+1] = item
                                end
                            end

                            if area == G["ygg_delete_cardarea"..i2] then
                                local item = Yggdrasil.get_item(final_key)
                                if not G.PROFILES[G.SETTINGS.profile]["YggDelete"..i2] then G.PROFILES[G.SETTINGS.profile]["YggDelete"..i2] = {} end
                                if item then
                                    G.PROFILES[G.SETTINGS.profile]["YggDelete"..i2][#G.PROFILES[G.SETTINGS.profile]["YggDelete"..i2]+1] = item
                                end
                            end

                            if area == G["ygg_inventory_cardarea"..i2] then
                                local item = Yggdrasil.get_item(final_key)
                                G.PROFILES[G.SETTINGS.profile]["YggInventory"][#G.PROFILES[G.SETTINGS.profile]["YggInventory"]+1] = item
                            end
                        end
                        break
                    elseif cardarea_type == "Delete"..i then
                        local class_prefix = "ygg_mat"
                        local mod_prefix = self.config.center.mod.prefix or nil
                        local cutout_pos = #class_prefix + (#mod_prefix or - 2) + 3

                        local final_key = string.sub(self.config.center.key, cutout_pos, #self.config.center.key)

                        for i2,v in ipairs(G.PROFILES[G.SETTINGS.profile]["YggDelete"..i] or {}) do
                            if v.id == final_key then
                                table.remove(G.PROFILES[G.SETTINGS.profile]["YggDelete"..i], i2)
                                break
                            end
                        end

                        local true_key = Yggdrasil.get_true_key(self)
                        if Yggdrasil.amt_item_inv(true_key) >= 1 then stop_create = true end

                        for i2 = 1,3 do
                            if area == G["ygg_crafting_cardarea"..i2] then
                                local item = Yggdrasil.get_item(final_key)
                                if not G.PROFILES[G.SETTINGS.profile]["YggCrafting"..i2] then G.PROFILES[G.SETTINGS.profile]["YggCrafting"..i2] = {} end
                                if item then
                                    G.PROFILES[G.SETTINGS.profile]["YggCrafting"..i2][#G.PROFILES[G.SETTINGS.profile]["YggCrafting"..i2]+1] = item
                                end
                            end
                            
                            if area == G["ygg_delete_cardarea"..i2] then
                                local item = Yggdrasil.get_item(final_key)
                                if not G.PROFILES[G.SETTINGS.profile]["YggDelete"..i2] then G.PROFILES[G.SETTINGS.profile]["YggDelete"..i2] = {} end
                                if item then
                                    G.PROFILES[G.SETTINGS.profile]["YggDelete"..i2][#G.PROFILES[G.SETTINGS.profile]["YggDelete"..i2]+1] = item
                                end
                            end

                            if area == G["ygg_inventory_cardarea"..i2] then
                                local item = Yggdrasil.get_item(final_key)
                                G.PROFILES[G.SETTINGS.profile]["YggInventory"][#G.PROFILES[G.SETTINGS.profile]["YggInventory"]+1] = item
                            end
                        end
                        break
                    end
                end
            end
        end

        if not stop_create then
            local new_card = SMODS.add_card({key = self.config.center.key, area = area})
            new_card.ability.ygg_is_item = true
            local is_to_inventory = false
            for i = 1,3 do
                if area == G["ygg_inventory_cardarea"..i] then is_to_inventory = true end
            end
            if is_to_inventory == true then new_card.ability.ygg_from_inventory = true end
        end
        
        if not to_emplace then
            G.E_MANAGER:add_event(Event({
                func = function()
                    cardarea:remove_card(self)
                    self:remove()
                    self.ygg_oldarea = nil
                    return true 
                end
            }))
        end
    end
    local c = toHook(self)
    return c
end 

local toHook = Card.click
function Card:click() 
    local ret = toHook(self)
    
    if G.ygg_hold_lshift and self.ability.ygg_is_item then
        if G.GAME["YggSecondAreaMode"] and G.GAME["YggSecondAreaMode"] == "Delete" then
            local from_area = "Inventory"
            local area = nil
            local num = nil
            for i = 1,3 do
                if area and num then break end
                if G["ygg_delete_cardarea"..i] and G["ygg_delete_cardarea"..i].cards then
                    for _,c in ipairs(G["ygg_delete_cardarea"..i].cards) do
                        if c == self then area = G["ygg_delete_cardarea"..i]; num = i; from_area = "Delete"; break end
                    end
                end
                if G["ygg_inventory_cardarea"..i] and G["ygg_inventory_cardarea"..i].cards then
                    for _,c in ipairs(G["ygg_inventory_cardarea"..i].cards) do
                        if c == self then area = G["ygg_inventory_cardarea"..i]; num = i; from_area = "Inventory"; break end
                    end
                end
            end

            if from_area == "Inventory" and area and num then
                local true_key = Yggdrasil.get_true_key(self)
                local transferred_item = nil

                for i,v in ipairs(G.PROFILES[G.SETTINGS.profile]["YggInventory"]) do
                    if v.id == true_key then
                        transferred_item = v
                        table.remove(G.PROFILES[G.SETTINGS.profile]["YggInventory"],i)
                        break
                    end
                end
            
                if not G.PROFILES[G.SETTINGS.profile]["YggDelete"..num] then G.PROFILES[G.SETTINGS.profile]["YggDelete"..num] = {} end
                G.PROFILES[G.SETTINGS.profile]["YggDelete"..num][#G.PROFILES[G.SETTINGS.profile]["YggDelete"..num]+1] = transferred_item
                local new_card = SMODS.add_card({key = self.config.center.key, area = G["ygg_delete_cardarea"..num]})
                new_card.ability.ygg_is_item = true

                if Yggdrasil.amt_item_inv(true_key) <= 0 then
                    area:remove_card(self)
                    self:remove()
                end
            elseif from_area == "Delete" and area and num then
                local true_key = Yggdrasil.get_true_key(self)
                local transferred_item = nil
                local to_emplace = (Yggdrasil.amt_item_inv(true_key) <= 0 and true) or false

                for i,v in ipairs(G.PROFILES[G.SETTINGS.profile]["YggDelete"..num]) do
                    if v.id == true_key then
                        transferred_item = v
                        table.remove(G.PROFILES[G.SETTINGS.profile]["YggDelete"..num],i)
                        break
                    end
                end
                area:remove_card(self)
                self:remove()

                if not G.PROFILES[G.SETTINGS.profile]["YggInventory"] then G.PROFILES[G.SETTINGS.profile]["YggInventory"] = {} end
                G.PROFILES[G.SETTINGS.profile]["YggInventory"][#G.PROFILES[G.SETTINGS.profile]["YggInventory"]+1] = transferred_item
                if to_emplace then
                    local new_card = SMODS.add_card({key = self.config.center.key, area = G["ygg_inventory_cardarea"..num]})
                    new_card.ability.ygg_is_item = true
                    new_card.ability.ygg_from_inventory = true
                end
            end
        elseif G.GAME["YggSecondAreaMode"] and G.GAME["YggSecondAreaMode"] == "Recipes" then
            --We don't really want anything here, so.
        else
            local from_area = "Inventory"
            local area = nil
            local num = nil
            for i = 1,3 do
                if area and num then break end
                if G["ygg_crafting_cardarea"..i] and G["ygg_crafting_cardarea"..i].cards then
                    for _,c in ipairs(G["ygg_crafting_cardarea"..i].cards) do
                        if c == self then area = G["ygg_crafting_cardarea"..i]; num = i; from_area = "Craft"; break end
                    end
                end
                if G["ygg_inventory_cardarea"..i] and G["ygg_inventory_cardarea"..i].cards then
                    for _,c in ipairs(G["ygg_inventory_cardarea"..i].cards) do
                        if c == self then area = G["ygg_inventory_cardarea"..i]; num = i; from_area = "Inventory"; break end
                    end
                end
            end

            if from_area == "Inventory" and area and num then
                local true_key = Yggdrasil.get_true_key(self)
                local transferred_item = nil

                for i,v in ipairs(G.PROFILES[G.SETTINGS.profile]["YggInventory"]) do
                    if v.id == true_key then
                        transferred_item = v
                        table.remove(G.PROFILES[G.SETTINGS.profile]["YggInventory"],i)
                        break
                    end
                end

                if not G.PROFILES[G.SETTINGS.profile]["YggCrafting"..num] then G.PROFILES[G.SETTINGS.profile]["YggCrafting"..num] = {} end
                G.PROFILES[G.SETTINGS.profile]["YggCrafting"..num][#G.PROFILES[G.SETTINGS.profile]["YggCrafting"..num]+1] = transferred_item
                local new_card = SMODS.add_card({key = self.config.center.key, area = G["ygg_crafting_cardarea"..num]})
                new_card.ability.ygg_is_item = true

                if Yggdrasil.amt_item_inv(true_key) <= 0 then
                    area:remove_card(self)
                    self:remove()
                end
            elseif from_area == "Craft" and area and num then
                local true_key = Yggdrasil.get_true_key(self)
                local transferred_item = nil
                local to_emplace = (Yggdrasil.amt_item_inv(true_key) <= 0 and true) or false

                for i,v in ipairs(G.PROFILES[G.SETTINGS.profile]["YggCrafting"..num]) do
                    if v.id == true_key then
                        transferred_item = v
                        table.remove(G.PROFILES[G.SETTINGS.profile]["YggCrafting"..num],i)
                        break
                    end
                end
                area:remove_card(self)
                self:remove()

                if not G.PROFILES[G.SETTINGS.profile]["YggInventory"] then G.PROFILES[G.SETTINGS.profile]["YggInventory"] = {} end
                G.PROFILES[G.SETTINGS.profile]["YggInventory"][#G.PROFILES[G.SETTINGS.profile]["YggInventory"]+1] = transferred_item
                if to_emplace then
                    local new_card = SMODS.add_card({key = self.config.center.key, area = G["ygg_inventory_cardarea"..num]})
                    new_card.ability.ygg_is_item = true
                    new_card.ability.ygg_from_inventory = true
                end
            end
        end
    end

    return ret
end

G.FUNCS.to_next_inventory_page = function(e)
    G.GAME.ygg_inven_page = (G.GAME.ygg_inven_page or 1) + 1
    if G.GAME.ygg_inven_page > (e.config.page or math.max(math.ceil(#(G.PROFILES[G.SETTINGS.profile]["YggInventory"] or {})/15), 1)) then
        G.GAME.ygg_inven_page = 1
    end
    G.FUNCS.ygg_open_inventory()
end

G.FUNCS.to_previous_inventory_page = function(e)
    G.GAME.ygg_inven_page = (G.GAME.ygg_inven_page or 1) - 1
    if G.GAME.ygg_inven_page <= 0 then
        G.GAME.ygg_inven_page = (e.config.page or math.max(math.ceil(#(G.PROFILES[G.SETTINGS.profile]["YggInventory"] or {})/15), 1))
    end
    G.FUNCS.ygg_open_inventory()
end

G.FUNCS.to_next_recipe_page = function(e)
    G.GAME["YggRecipePage"] = (G.GAME["YggRecipePage"] or 1) + 1
    if G.GAME["YggRecipePage"] > (e.config.page) then
        G.GAME["YggRecipePage"] = 1
    end
    G.FUNCS.ygg_open_inventory()
end

G.FUNCS.to_previous_recipe_page = function(e)
    G.GAME["YggRecipePage"] = (G.GAME["YggRecipePage"] or 1) - 1
    if G.GAME["YggRecipePage"] <= 0 then
        G.GAME["YggRecipePage"] = (e.config.page)
    end
    G.FUNCS.ygg_open_inventory()
end

G.FUNCS.ygg_switch_sort_type = function(e)
    local sort_type = e.config.sort_type or nil
    if sort_type then
        G.GAME["YggInventorySort"] = sort_type
        G.FUNCS.ygg_open_inventory()
    end
end

G.FUNCS.ygg_switch_second_area = function(e)
    local second_area = e.config.second_area or nil
    if second_area then
        G.GAME["YggSecondAreaMode"] = second_area
        G.FUNCS.ygg_open_inventory()
    end
end

G.FUNCS.ygg_load_text_input = function(e)
    if not e.config or not e.config.auto_selected then
        if not e.config then e.config = {} end
        e.config.auto_selected = true

        G.E_MANAGER:add_event(Event({
            blockable = false,
            func = function() 
                e.UIBox:recalculate(true) 
                return true 
            end
        }))
    end
end

G.FUNCS.ygg_delete_all = function()
    for i = 1,3 do
        if G.PROFILES[G.SETTINGS.profile]["YggDelete"..i] then
            G.PROFILES[G.SETTINGS.profile]["YggDelete"..i] = nil
        end

        if G["ygg_delete_cardarea"..i] and G["ygg_delete_cardarea"..i].cards then
            for _,card in ipairs(G["ygg_delete_cardarea"..i].cards or {}) do
                G.E_MANAGER:add_event(Event({
                    func = function() 
                        if G["ygg_delete_cardarea"..i] and card then
                            G["ygg_delete_cardarea"..i]:remove_card(card)
                            card:remove() 
                        end
                        return true 
                    end
                }))
            end
        end
    end
end

G.FUNCS.ygg_clear_text = function()
    G.GAME["YggSearchOption"] = ""
    G.GAME["YggSearchOptionInput"] = ""
    G.FUNCS.ygg_open_inventory()
end

G.FUNCS.ygg_clear_delete_text = function()
    G.GAME["YggAutoDelete"] = ""
    G.GAME["YggAutoDeleteInput"] = ""
    G.FUNCS.ygg_open_inventory()
end

G.FUNCS.ygg_clear_recipe_text = function()
    G.GAME["YggRecipe"] = ""
    G.GAME["YggRecipeInput"] = ""
    G.FUNCS.ygg_open_inventory()
end

--[[
G.FUNCS.ygg_text_input_key = function(args)
    args = args or {}

    if args.key == '[' or args.key == ']' then return end

    --shortcut to hook config
    local hook_config = G.CONTROLLER.text_input_hook.config.ref_table
    hook_config.orig_colour = hook_config.orig_colour or copy_table(hook_config.colour)

    args.key = args.key or '%'
    args.caps = args.caps or G.CONTROLLER.capslock or hook_config.all_caps --capitalize if caps lock or hook requires

    --Some special keys need to be mapped accordingly before passing through the corpus
    local keymap = {
        space = ' ',
        backspace = 'BACKSPACE',
        delete = 'DELETE',
        ['return'] = 'RETURN',
        right = 'RIGHT',
        left = 'LEFT'
    }
    local hook = G.CONTROLLER.text_input_hook
    local corpus = '123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'..(hook.config.ref_table.extended_corpus and " 0!$&()<>?:{}+-=,.[]_" or '')
    
    if hook.config.ref_table.extended_corpus then 
        local lower_ext = '1234567890-=;\',./'
        local upper_ext = '!@#$%^&*()_+:"<>?'
        if string.find(lower_ext, args.key) and args.caps then 
        args.key = string.sub(string.sub(upper_ext,string.find(lower_ext, args.key)), 0, 1)
        end
    end
    local text = hook_config.text

    --set key to mapped key or upper if caps is true
    args.key = keymap[args.key] or (args.caps and string.upper(args.key) or args.key)
    
    --Start by setting the cursor position to the correct location
    TRANSPOSE_TEXT_INPUT(0)

    if string.len(text.ref_table[text.ref_value]) > 0 and args.key == 'BACKSPACE' then --If not at start, remove preceding letter
        MODIFY_TEXT_INPUT{
        letter = '',
        text_table = text,
        pos = text.current_position,
        delete = true
        }
        TRANSPOSE_TEXT_INPUT(-1)
    elseif string.len(text.ref_table[text.ref_value]) > 0 and args.key == 'DELETE' then --if not at end, remove following letter
        MODIFY_TEXT_INPUT{
        letter = '',
        text_table = text,
        pos = text.current_position+1,
        delete = true
        }
        TRANSPOSE_TEXT_INPUT(0)
    elseif args.key == 'RETURN' then --Release the hook
        if hook.config.ref_table.callback then hook.config.ref_table.callback() end
        hook.parent.parent.config.colour = hook_config.colour
        local temp_colour = copy_table(hook_config.orig_colour)
        hook_config.colour[1] = G.C.WHITE[1]
        hook_config.colour[2] = G.C.WHITE[2]
        hook_config.colour[3] = G.C.WHITE[3]
        ease_colour(hook_config.colour, temp_colour)
        G.CONTROLLER.text_input_hook = nil
    elseif args.key == 'LEFT' then --Move cursor position to the left
        TRANSPOSE_TEXT_INPUT(-1)
    elseif args.key == 'RIGHT' then --Move cursor position to the right
        TRANSPOSE_TEXT_INPUT(1)
    elseif hook_config.max_length > string.len(text.ref_table[text.ref_value]) and
            (string.len(args.key) == 1) and
            string.find( corpus,  args.key , 1, true) then --check to make sure the key is in the valid corpus, add it to the string
        MODIFY_TEXT_INPUT{
        letter = args.key,
        text_table = text,
        pos = text.current_position+1
        }
        TRANSPOSE_TEXT_INPUT(1)
    end
end

G.FUNCS.ygg_text_input = function(e)
    local args =e.config.ref_table
    if G.CONTROLLER.text_input_hook == e then
        e.parent.parent.config.colour = args.hooked_colour
        args.current_prompt_text = ''
        args.current_position_text = args.position_text
    else
        e.parent.parent.config.colour = args.colour
        args.current_prompt_text = (args.text.ref_table[args.text.ref_value] == '' and args.prompt_text or '')
        args.current_position_text = ''
    end

    local OSkeyboard_e = e.parent.parent.parent
    if G.CONTROLLER.text_input_hook == e and G.CONTROLLER.HID.controller then
        if not OSkeyboard_e.children.controller_keyboard then 
        OSkeyboard_e.children.controller_keyboard = UIBox{
            definition = create_keyboard_input{backspace_key = true, return_key = true, space_key = false},
            config = {
            align= 'cm',
            offset = {x = 0, y = G.CONTROLLER.text_input_hook.config.ref_table.keyboard_offset or -4},
            major = e.UIBox, parent = OSkeyboard_e}
        }
        G.CONTROLLER.screen_keyboard = OSkeyboard_e.children.controller_keyboard
        G.CONTROLLER:mod_cursor_context_layer(1)
        end
    elseif OSkeyboard_e.children.controller_keyboard then
        OSkeyboard_e.children.controller_keyboard:remove()
        OSkeyboard_e.children.controller_keyboard = nil
        G.CONTROLLER.screen_keyboard = nil
        G.CONTROLLER:mod_cursor_context_layer(-1)
    end
end
]]

function ygg_create_text_input(args)
    args = args or {}
    args.colour = copy_table(args.colour) or copy_table(G.C.BLUE)
    args.hooked_colour = copy_table(args.hooked_colour) or darken(copy_table(G.C.BLUE), 0.3)
    args.w = args.w or 2.5
    args.h = args.h or 0.7
    args.text_scale = args.text_scale or 0.4
    args.max_length = args.max_length or 100
    args.all_caps = args.all_caps or false
    args.prompt_text = args.prompt_text or localize('k_enter_text')
    args.current_prompt_text = ''
    args.id = args.id or "text_input"

    local text = {ref_table = args.ref_table, ref_value = args.ref_value, letters = {}, current_position = string.len(args.ref_table[args.ref_value])}
    local ui_letters = {}
    for i = 1, args.max_length do
        text.letters[i] = (args.ref_table[args.ref_value] and (string.sub(args.ref_table[args.ref_value], i, i) or '')) or ''
        ui_letters[i] = {n=G.UIT.T, config={ref_table = text.letters, ref_value = i, scale = args.text_scale, colour = G.C.UI.TEXT_LIGHT, id = args.id..'_letter_'..i}}
    end
    args.text = text

    local position_text_colour = lighten(copy_table(G.C.BLUE), 0.4)

    ui_letters[#ui_letters+1] = {n=G.UIT.T, config={ref_table = args, ref_value = 'current_prompt_text', scale = args.text_scale, colour = lighten(copy_table(args.colour), 0.4), id = args.id..'_prompt'}}
    ui_letters[#ui_letters+1] = {n=G.UIT.B, config={r = 0.03,w=0.1, h=0.4, colour = position_text_colour, id = args.id..'_position', func = 'flash'}}

    local t = 
        {n=G.UIT.C, config={align = "cm", colour = G.C.CLEAR}, nodes = {
            {n=G.UIT.C, config={id = args.id, align = "cm", padding = 0.05, r = 0.1, hover = true, colour = args.colour,minw = args.w, min_h = args.h, func = "ygg_load_text_input", button = 'select_text_input', shadow = true}, nodes={
                {n=G.UIT.R, config={ref_table = args, padding = 0.05, align = "cm", r = 0.1, colour = G.C.CLEAR}, nodes={
                {n=G.UIT.R, config={ref_table = args, align = "cm", r = 0.1, colour = G.C.CLEAR, func = 'text_input', ygg_input = true}, nodes=
                    ui_letters
                }
                }}
            }}
            }}
    return t
end

local hookTo = G.FUNCS.exit_overlay_menu
G.FUNCS.exit_overlay_menu = function()
    G.E_MANAGER:clear_queue('yggdrasil')
    hookTo()
end

function create_inventory_UI(args)
    args = args or {}
    local back_func = args.back_func or "exit_overlay_menu"

    local area_minw = 8
    local area_minh = 7
    local cardarea_padding = -0.5
    local true_page = nil
    local true_recipe_page = nil

    local function clear_ygg_areas()
        for i = 1,3 do
            if G["ygg_delete_cardarea"..i] then
                G["ygg_delete_cardarea"..i]:remove()
                G["ygg_delete_cardarea"..i] = nil
            end
            if G["ygg_inventory_cardarea"..i] then
                G["ygg_inventory_cardarea"..i]:remove()
                G["ygg_inventory_cardarea"..i] = nil
            end
            if G["ygg_crafting_cardarea"..i] then
                G["ygg_crafting_cardarea"..i]:remove()
                G["ygg_crafting_cardarea"..i] = nil
            end
            if G["ygg_recipe_cardarea"..i] then
                G["ygg_recipe_cardarea"..i]:remove()
                G["ygg_recipe_cardarea"..i] = nil
            end
            if G["ygg_placeholder_cardarea"..i] then
                G["ygg_placeholder_cardarea"..i]:remove()
                G["ygg_placeholder_cardarea"..i] = nil
            end
        end

        if G["ygg_recipe_cardarea4"] then
            G["ygg_recipe_cardarea4"]:remove()
            G["ygg_recipe_cardarea4"] = nil
        end
        if G["ygg_crafting_show"] then G["ygg_crafting_show"]:remove(); G["ygg_crafting_show"] = nil end
    end

    clear_ygg_areas()
    G.E_MANAGER:clear_queue('yggdrasil')

    for i = 1,3 do
        if G["ygg_inventory_cardarea"..i] then
            G["ygg_inventory_cardarea"..i]:remove()
            G["ygg_inventory_cardarea"..i] = nil
        end
        G["ygg_inventory_cardarea"..i] = CardArea(
            G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2, G.ROOM.T.h,
            4.25 * G.CARD_W,
            0.95 * G.CARD_H,
            {card_limit = 5, type = 'title', highlight_limit = 0}
        )
        G["ygg_inventory_cardarea"..i].states.collide.can = true
    end

    if G.GAME["YggSecondAreaMode"] and G.GAME["YggSecondAreaMode"] == "Delete" then
        for i = 1,3 do
            if G["ygg_delete_cardarea"..i] then
                G["ygg_delete_cardarea"..i]:remove()
                G["ygg_delete_cardarea"..i] = nil
            end
            G["ygg_delete_cardarea"..i] = CardArea(
                G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2, G.ROOM.T.h,
                4.25 * G.CARD_W,
                0.95 * G.CARD_H,
                {card_limit = 5, type = 'title', highlight_limit = 0}
            )
            G["ygg_delete_cardarea"..i].states.collide.can = true
        end
    elseif G.GAME["YggSecondAreaMode"] and G.GAME["YggSecondAreaMode"] == "Recipes" then
        local testing = true
        for i = 1,3 do
            if G["ygg_recipe_cardarea"..i] then
                G["ygg_recipe_cardarea"..i]:remove()
                G["ygg_recipe_cardarea"..i] = nil
            end
            G["ygg_recipe_cardarea"..i] = CardArea(
                G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2, G.ROOM.T.h,
                4.25 * G.CARD_W/1.35,
                0.95 * G.CARD_H,
                {card_limit = 5, type = 'title', highlight_limit = 0}
            )
            G["ygg_recipe_cardarea"..i].states.collide.can = testing
        end
        for i = 1,2 do
            if G["ygg_placeholder_cardarea"..i] then
                G["ygg_placeholder_cardarea"..i]:remove()
                G["ygg_placeholder_cardarea"..i] = nil
            end
            G["ygg_placeholder_cardarea"..i] = CardArea(
                G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2, G.ROOM.T.h,
                4.25 * G.CARD_W/4.5,
                0.95 * G.CARD_H,
                {card_limit = 5, type = 'title', highlight_limit = 0}
            )
            G["ygg_placeholder_cardarea"..i].states.collide.can = false
        end
        if G["ygg_recipe_cardarea4"] then
            G["ygg_recipe_cardarea4"]:remove()
            G["ygg_recipe_cardarea4"] = nil
        end
        G["ygg_recipe_cardarea4"] = CardArea(
            G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2, G.ROOM.T.h,
            4.25 * G.CARD_W/4.5,
            0.95 * G.CARD_H,
            {card_limit = 5, type = 'title', highlight_limit = 0}
        )
        G["ygg_recipe_cardarea4"].states.collide.can = testing
    else
        for i = 1,3 do
            if G["ygg_crafting_cardarea"..i] then
                G["ygg_crafting_cardarea"..i]:remove()
                G["ygg_crafting_cardarea"..i] = nil
            end
            G["ygg_crafting_cardarea"..i] = CardArea(
                G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2, G.ROOM.T.h,
                4.25 * G.CARD_W,
                0.95 * G.CARD_H,
                {card_limit = 5, type = 'title', highlight_limit = 0}
            )
            G["ygg_crafting_cardarea"..i].states.collide.can = true
        end

        if G["ygg_crafting_show"] then G["ygg_crafting_show"]:remove(); G["ygg_crafting_show"] = nil end
        G["ygg_crafting_show"] = CardArea(
            G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2, G.ROOM.T.h,
            4.25 * G.CARD_W,
            0.95 * G.CARD_H,
            {card_limit = 5, type = 'title', highlight_limit = 0}
        )
        G["ygg_crafting_show"].states.collide.can = false
    end

    if YggdrasilDebugCraftingMode then --please dont turn this on
        for i = 1,3 do
            for _, key in ipairs({"ygg_mat_ygg_card_scrap","ygg_mat_ygg_card_scrap","ygg_mat_ygg_card_scrap","ygg_mat_ygg_card_scrap","ygg_mat_ygg_card_scrap"}) do
                local card = Card(G["ygg_inventory_cardarea"..i].T.x + G["ygg_inventory_cardarea"..i].T.w / 2, G["ygg_inventory_cardarea"..i].T.y,
                    G.CARD_W, G.CARD_H, G.P_CARDS.empty,
                    G.P_CENTERS[key])
                card.ability.ygg_is_item = true
                card.children.back:remove()
                card.children.back = Sprite(card.T.x, card.T.y, card.T.w, card.T.h, G.ASSET_ATLAS["ygg_placeholder_mat"], { x = 0, y = 0 })
                card.children.back.states.hover = card.states.hover
                card.children.back.states.click = card.states.click
                card.children.back.states.drag = card.states.drag
                card.children.back.states.collide.can = false
                card.children.back:set_role({major = card, role_type = 'Glued', draw_major = card})
                G["ygg_inventory_cardarea"..i]:emplace(card)
                --[[ Code supposed to add text on top of a card. Doesn't work. Resorted to just adding each instance of that material in the inventory instead.
                G.idk = UIBox {
                    definition = {
                        n = G.UIT.ROOT,
                        config = {
                            align = "cm",
                            minw = 1,
                            minh = 0.3,
                            padding = 0.15,
                            r = 0.1,
                            colour = G.C.CLEAR
                        },
                        nodes = {
                            {
                                n = G.UIT.C,
                                config = {align = "cm", maxw = 2, padding = 0.1, r = 0.08, minw = 2, minh = 0, hover = true, shadow = true, colour = G.C.CLEAR},
                                nodes = {
                                    {n = G.UIT.T, config = {text = "X1", colour = G.C.BLACK, scale = 1}}
                                }
                            },
                
                        }
                    },
                    config = {
                        align = "cm",
                        offset = { x = 0, y = 0 },
                        major = G["ygg_inventory_cardarea"..i].cards[#G["ygg_inventory_cardarea"..i].cards],
                        bond = 'Strong'
                    }
                }
                ]]
            end
        end 
    else --Loading cards to the area.
        if G.PROFILES[G.SETTINGS.profile]["YggInventory"] then
            local current_page = G.GAME.ygg_inven_page or 1
            local list_to_use = G.PROFILES[G.SETTINGS.profile]["YggInventory"]
            if G.GAME["YggSearchOption"] and type(G.GAME["YggSearchOption"]) == "string" then
                local search_option = string.lower(Yggdrasil.remove_space(G.GAME["YggSearchOption"]))
                local search_list = G.PROFILES[G.SETTINGS.profile]["YggInventory"]

                if search_option ~= "" then
                    list_to_use = {}
                    if string.find(search_option, "(type=", nil, true) then
                        local start_type, end_type = string.find(search_option, "(type=", nil, true)
                        
                        local end_pos = end_type
                        for i = end_type, #search_option do
                            if string.sub(search_option, i, i) == ")" or i == #search_option then
                                end_pos = i
                                break
                            end
                        end

                        local type_cube = string.sub(search_option, start_type, end_pos)
                        local actual_type = string.gsub(type_cube, "%(type=", "")
                        actual_type = string.gsub(actual_type, "%)", "")

                        if YggMaterialList[actual_type] then
                            local available_mats = YggMaterialList[actual_type]
                            local temp_search_list = {}

                            for _,item_info in ipairs(search_list) do
                                for _,avail_info in ipairs(available_mats) do
                                    if avail_info.id == item_info.id then
                                        temp_search_list[#temp_search_list+1] = item_info
                                        break
                                    end
                                end
                            end

                            search_list = temp_search_list
                        end

                        local temp_search_option = nil
                        if type_cube == "(type="..actual_type then
                            temp_search_option = string.gsub(search_option,"%(type="..actual_type,"")
                        elseif type_cube == "(type="..actual_type..")" then
                            temp_search_option = string.gsub(search_option,"%(type="..actual_type.."%)","")
                        else
                            print("something went wrong with yggdrasil's type sorting in search bar - please show this message to BepisFever in Balatro discord, thanks and sorry.")
                        end

                        search_option = temp_search_option
                    end

                    if string.find(search_option, "(rarity=", nil, true) then
                        local start_type, end_type = string.find(search_option, "(rarity=", nil, true)
                        
                        local end_pos = end_type
                        for i = end_type, #search_option do
                            if string.sub(search_option, i, i) == ")" or i == #search_option then
                                end_pos = i
                                break
                            end
                        end

                        local type_cube = string.sub(search_option, start_type, end_pos)
                        local actual_type = string.gsub(type_cube, "%(rarity=", "")
                        actual_type = string.gsub(actual_type, "%)", "")

                        if YggMaterialList[actual_type] then
                            local available_mats = YggMaterialList[actual_type]
                            local temp_search_list = {}

                            for _,item_info in ipairs(search_list) do
                                if item_info.rarity and item_info.rarity == actual_type then
                                    temp_search_list[#temp_search_list+1] = item_info
                                end
                            end

                            search_list = temp_search_list
                        end

                        local temp_search_option = nil
                        if type_cube == "(rarity="..actual_type then
                            temp_search_option = string.gsub(search_option,"%(rarity="..actual_type,"")
                        elseif type_cube == "(rarity="..actual_type..")" then
                            temp_search_option = string.gsub(search_option,"%(rarity="..actual_type.."%)","")
                        else
                            print("something went wrong with yggdrasil's type sorting in search bar - please show this message to BepisFever in Balatro discord, thanks and sorry.")
                        end

                        search_option = temp_search_option
                    end

                    for _,item_info in ipairs(search_list) do
                        local item_name = string.lower(Yggdrasil.remove_underline(item_info.id))

                        if string.find(item_name, search_option or "") then
                            list_to_use[#list_to_use+1] = item_info
                        end
                    end

                    true_page = math.max(math.ceil(#(list_to_use or {})/15), 1)
                    G.GAME.ygg_inven_page = math.min(G.GAME.ygg_inven_page or 1, true_page)
                    current_page = G.GAME.ygg_inven_page
                end
            end
            local list_to_take = list_to_use

            if G.GAME.YggInventorySort then
                if G.GAME.YggInventorySort == "Rarity" then
                    local temp_list = {}
                    --list_to_take = {}
                    for _,item_info in ipairs(list_to_use) do
                        if not temp_list[item_info.rarity] then temp_list[item_info.rarity] = {} end
                        temp_list[item_info.rarity][#temp_list[item_info.rarity]+1] = item_info
                    end

                    local all_rarities = {}
                    for rarity,_ in pairs(YggMaterialChance) do
                        all_rarities[#all_rarities+1] = rarity
                    end
                    table.sort(all_rarities, function(a,b) return YggMaterialChance[a]["priority"] > YggMaterialChance[b]["priority"] end)

                    list_to_take = {}
                    for _,rarity in ipairs(all_rarities) do
                        for _,item in ipairs(temp_list[rarity] or {}) do
                            list_to_take[#list_to_take + 1] = item
                        end
                    end

                    for _,item in ipairs(temp_list["common"] or {}) do
                        list_to_take[#list_to_take + 1] = item
                    end
                end
            end

            local loaded_keys = {}

            local temp_list_to_take = {}
            for _,v in ipairs(list_to_take) do
                local exist = false
                for _,v2 in ipairs(temp_list_to_take) do
                    if v2.id == v.id then exist = true break end
                end
                if not exist then
                    temp_list_to_take[#temp_list_to_take+1] = v
                end
            end
            list_to_take = temp_list_to_take

            true_page = math.max(math.ceil(#list_to_take/15), 1)
            if (G.GAME.ygg_inven_page or 1) >= true_page then G.GAME.ygg_inven_page = true_page end

            for i = (1 + (15 * (current_page - 1))), (15 + (15 * (current_page - 1))) do
                local skill_to_insert = list_to_take[i]
                if skill_to_insert then
                    local saved_skill_to_insert = skill_to_insert
                    G.E_MANAGER:add_event(Event({
                        func = function() 
                            local key = "ygg_mat_"..saved_skill_to_insert.mod_prefix.."_"..saved_skill_to_insert.id
                            if table.contains(loaded_keys, key) then return true end
                            loaded_keys[#loaded_keys+1] = key
                            local cardarea_to_insert = nil
                            for i2 = 1,3 do
                                if not G["ygg_inventory_cardarea"..i2] or not G["ygg_inventory_cardarea"..i2].cards then return end
                                if #G["ygg_inventory_cardarea"..i2].cards < 5 then
                                    cardarea_to_insert = G["ygg_inventory_cardarea"..i2]
                                    break
                                end
                            end
                            if cardarea_to_insert then
                                local card = Card(cardarea_to_insert.T.x + cardarea_to_insert.T.w / 2, cardarea_to_insert.T.y,
                                    G.CARD_W, G.CARD_H, G.P_CARDS.empty,
                                    G.P_CENTERS[key])
                                card.ability.ygg_from_inventory = true
                                card.ability.ygg_is_item = true
                                card.children.back:remove()
                                card.children.back = Sprite(card.T.x, card.T.y, card.T.w, card.T.h, G.ASSET_ATLAS["ygg_placeholder_mat"], { x = 0, y = 0 })
                                card.children.back.states.hover = card.states.hover
                                card.children.back.states.click = card.states.click
                                card.children.back.states.drag = card.states.drag
                                card.children.back.states.collide.can = false
                                card.children.back:set_role({major = card, role_type = 'Glued', draw_major = card})
                                cardarea_to_insert:emplace(card) 
                            end
                            return true 
                        end
                    }), "yggdrasil")
                end
            end
        end

        for i = 1,3 do
            if G.GAME["YggSecondAreaMode"] and G.GAME["YggSecondAreaMode"] == "Delete" then
                if G.PROFILES[G.SETTINGS.profile]["YggDelete"..i] then
                    for _,v in ipairs(G.PROFILES[G.SETTINGS.profile]["YggDelete"..i]) do
                        local skill_to_insert = v
                        if skill_to_insert then
                            local saved_skill_to_insert = skill_to_insert
                            local key = "ygg_mat_"..saved_skill_to_insert.mod_prefix.."_"..saved_skill_to_insert.id
                            local cardarea_to_insert = G["ygg_delete_cardarea"..i]
                            if cardarea_to_insert then
                                local card = Card(cardarea_to_insert.T.x + cardarea_to_insert.T.w / 2, cardarea_to_insert.T.y,
                                    G.CARD_W, G.CARD_H, G.P_CARDS.empty,
                                    G.P_CENTERS[key])
                                card.ability.ygg_is_item = true
                                card.children.back:remove()
                                card.children.back = Sprite(card.T.x, card.T.y, card.T.w, card.T.h, G.ASSET_ATLAS["ygg_placeholder_mat"], { x = 0, y = 0 })
                                card.children.back.states.hover = card.states.hover
                                card.children.back.states.click = card.states.click
                                card.children.back.states.drag = card.states.drag
                                card.children.back.states.collide.can = false
                                card.children.back:set_role({major = card, role_type = 'Glued', draw_major = card})
                                cardarea_to_insert:emplace(card) 
                            end
                        end
                    end
                end
            elseif G.GAME["YggSecondAreaMode"] and G.GAME["YggSecondAreaMode"] == "Recipes" then
                --code here idk
            else
                if G.PROFILES[G.SETTINGS.profile]["YggCrafting"..i] then
                    for _,v in ipairs(G.PROFILES[G.SETTINGS.profile]["YggCrafting"..i]) do
                        local skill_to_insert = v
                        if skill_to_insert then
                            local saved_skill_to_insert = skill_to_insert
                            local key = "ygg_mat_"..saved_skill_to_insert.mod_prefix.."_"..saved_skill_to_insert.id
                            local cardarea_to_insert = G["ygg_crafting_cardarea"..i]
                            if cardarea_to_insert then
                                local card = Card(cardarea_to_insert.T.x + cardarea_to_insert.T.w / 2, cardarea_to_insert.T.y,
                                    G.CARD_W, G.CARD_H, G.P_CARDS.empty,
                                    G.P_CENTERS[key])
                                card.ability.ygg_is_item = true
                                card.children.back:remove()
                                card.children.back = Sprite(card.T.x, card.T.y, card.T.w, card.T.h, G.ASSET_ATLAS["ygg_placeholder_mat"], { x = 0, y = 0 })
                                card.children.back.states.hover = card.states.hover
                                card.children.back.states.click = card.states.click
                                card.children.back.states.drag = card.states.drag
                                card.children.back.states.collide.can = false
                                card.children.back:set_role({major = card, role_type = 'Glued', draw_major = card})
                                cardarea_to_insert:emplace(card) 
                            end
                        end
                    end
                end
            end
        end
    end

    if (G.GAME["YggRecipePage"] or 1) == 0 then G.GAME["YggRecipePage"] = 1 end

    if G.GAME["YggSecondAreaMode"] and G.GAME["YggSecondAreaMode"] == "Recipes" then --Recipe searching code.
        local valid_recipe_list = YggCraftingRecipes
        local fixed_recipe_list = YggCraftingRecipes --its not actually fixed but im lazy to change the name lol

        if G.GAME["YggRecipe"] and type(G.GAME["YggRecipe"]) == "string" then
            local search = string.lower(Yggdrasil.remove_space(G.GAME["YggRecipe"]))

            if string.find(search, "(rarity=", nil, true) then
                local start_type, end_type = string.find(search, "(rarity=", nil, true)
                
                local end_pos = end_type
                for i = end_type, #search do
                    if string.sub(search, i, i) == ")" or i == #search then
                        end_pos = i
                        break
                    end
                end

                local rarity_cube = string.sub(search, start_type, end_pos)
                local actual_rarity = string.gsub(rarity_cube, "%(rarity=", "")
                actual_rarity = string.gsub(actual_rarity, "%)", "")

                if YggMaterialList[actual_rarity] then
                    local temp_recipe = {}

                    for _,v in ipairs(fixed_recipe_list) do
                        if v.card_key then
                            if not v.config.immediate_emplace then
                                local true_key = Yggdrasil.get_true_key(nil,v.card_key,(v.config.mod_prefix or "ygg"))
                                if true_key then
                                    local item = Yggdrasil.get_item(true_key)
                                    if item.rarity == actual_rarity then
                                        --print(true_key)
                                        temp_recipe[#temp_recipe+1] = v
                                    end
                                end
                            end
                        end
                    end

                    fixed_recipe_list = temp_recipe
                end

                local temp_search_option = nil
                if rarity_cube == "(rarity="..actual_rarity then
                    temp_search_option = string.gsub(search,"%(rarity="..actual_rarity,"")
                elseif rarity_cube == "(rarity="..actual_rarity..")" then
                    temp_search_option = string.gsub(search,"%(rarity="..actual_rarity.."%)","")
                else
                    print("something went wrong with yggdrasil's rarity sorting in search bar - please show this message to BepisFever in Balatro discord, thanks and sorry.")
                end

                search = temp_search_option
            end

            if string.find(search, "(type=", nil, true) then
                local start_type, end_type = string.find(search, "(type=", nil, true)
                
                local end_pos = end_type
                for i = end_type, #search do
                    if string.sub(search, i, i) == ")" or i == #search then
                        end_pos = i
                        break
                    end
                end

                local rarity_cube = string.sub(search, start_type, end_pos)
                local actual_rarity = string.gsub(rarity_cube, "%(type=", "")
                actual_rarity = string.gsub(actual_rarity, "%)", "")

                if YggMaterialList[actual_rarity] then
                    local temp_recipe = {}

                    for _,v in ipairs(fixed_recipe_list) do
                        if v.card_key then
                            if not v.config.immediate_emplace then
                                local true_key = Yggdrasil.get_true_key(nil,v.card_key,(v.config.mod_prefix or "ygg"))
                                if true_key then
                                    local type = Yggdrasil.get_type_of_item(true_key)
                                    if type == actual_rarity then
                                        temp_recipe[#temp_recipe+1] = v
                                    end
                                end
                            end
                        end
                    end

                    fixed_recipe_list = temp_recipe
                end

                local temp_search_option = nil
                if rarity_cube == "(type="..actual_rarity then
                    temp_search_option = string.gsub(search,"%(type="..actual_rarity,"")
                elseif rarity_cube == "(type="..actual_rarity..")" then
                    temp_search_option = string.gsub(search,"%(type="..actual_rarity.."%)","")
                else
                    print("something went wrong with yggdrasil's type sorting in search bar - please show this message to BepisFever in Balatro discord, thanks and sorry.")
                end

                search = temp_search_option
            end

            local temp_list = {}
            for _,v in ipairs(fixed_recipe_list) do
                if string.find(string.lower(Yggdrasil.remove_underline(v.card_key)), search) then
                    temp_list[#temp_list+1] = v
                end
            end
            fixed_recipe_list = temp_list

            valid_recipe_list = fixed_recipe_list
        end

        true_recipe_page = #valid_recipe_list
        G.GAME["YggRecipePage"] = math.min((G.GAME["YggRecipePage"] or 1), true_recipe_page)

        local recipe_to_choose = valid_recipe_list[(G.GAME["YggRecipePage"] or 1)]
        if recipe_to_choose then
            local key = recipe_to_choose.card_key
            local card = SMODS.add_card({key = key, no_edition = true, area = G["ygg_recipe_cardarea4"]})
            --[[card.children.back.states.hover = false
            card.children.back.states.click = false]]
            card.children.back.states.drag.can = false
            card.children.back.states.collide.can = false

            for line,mats in ipairs(recipe_to_choose.recipe) do
                for _,mat in ipairs(mats) do
                    local id = Yggdrasil.get_tk_from_ck(mat)
                    local mat_info = Yggdrasil.get_item(id)
                    local key2 = "ygg_mat_"..mat_info.mod_prefix.."_"..id

                    G.E_MANAGER:add_event(Event({
                        func = function() 
                            local material = SMODS.add_card({key = key2, no_edition = true, area = G["ygg_recipe_cardarea"..line]})
                            material.children.back.states.drag.can = false
                            material.children.back.states.collide.can = false
                            return true 
                        end
                    }), "yggdrasil")
                end
            end

            G.E_MANAGER:add_event(Event({
                func = function() 
                    for i = 1,3 do
                        if G["ygg_recipe_cardarea"..i] and G["ygg_recipe_cardarea"..i].cards then
                            for _,c in ipairs(G["ygg_recipe_cardarea"..i].cards) do
                                c.children.back.states.drag.can = false
                                c.children.back.states.collide.can = false
                            end
                        end
                    end
                    return true 
                end
            }), "yggdrasil")
        end
    end

    if not G.GAME["YggSearchOptionInput"] then G.GAME["YggSearchOptionInput"] = "" end
    if not G.GAME["YggSearchOption"] then G.GAME["YggSearchOption"] = "" end
    if not G.GAME["YggRecipeInput"] then G.GAME["YggRecipeInput"] = "" end
    if not G.GAME["YggRecipe"] then G.GAME["YggRecipe"] = "" end
    if not G.GAME["YggAutoDeleteInput"] then G.GAME["YggAutoDeleteInput"] = "" end
    if not G.GAME["YggAutoDelete"] then G.GAME["YggAutoDelete"] = "" end
    
    local second_area_nodes = {}
    if G.GAME["YggSecondAreaMode"] and G.GAME["YggSecondAreaMode"] == "Delete" then --Delete Area
        second_area_nodes = {
            {n = G.UIT.R, config = {align = "tm", padding = 0.2}, nodes = {
                {n = G.UIT.O, config = {align = "tm",object = DynaText({scale = 0.75, string = localize('ygg_delete_area_text'), maxw = 9, colours = { G.C.WHITE }, float = true, silent = true, shadow = true})}}
            }},
            {n = G.UIT.R, config = {align = "tr", padding = 0.02}, nodes = {
                ygg_create_text_input({w = 3, prompt_text = G.GAME["YggAutoDelete"], id = "ygg_auto_delete", extended_corpus = true, ref_table = G.GAME, ref_value = 'YggAutoDeleteInput',
                    callback = function(_)
                        local command_head = "-"
                        local input = string.lower(Yggdrasil.remove_space(G.GAME["YggAutoDeleteInput"]))
                        local current_command_starters = {
                            "delete",
                        }
                        if string.sub(input,1,1) == command_head then
                            local starter = ""
                            local command = nil
                            for i = 2,#input do
                                if string.sub(input,i,i) == "(" then break end
                                starter = starter..string.sub(input,i,i)
                            end

                            for _,v in ipairs(current_command_starters) do
                                if v == starter then command = v break end
                            end
                            
                            if command == "delete" then
                                local item_key = nil
                                local amt = nil

                                local cut_off = string.sub(input,2+#command,#input)
                                local sections = {}

                                cut_off = string.gsub(cut_off, "%(", "")
                                cut_off = string.gsub(cut_off, "%)", "")

                                local indiv_sec = ""
                                for i = 1, #cut_off do
                                    local character = string.sub(cut_off,i,i)
                                    if character == "," or i == #cut_off then
                                        if i == #cut_off then indiv_sec = indiv_sec..string.sub(cut_off,i,i) end
                                        sections[#sections+1] = string.gsub(indiv_sec, ",", "")
                                        indiv_sec = ""
                                    end
                                    indiv_sec = indiv_sec..string.sub(cut_off,i,i)
                                end

                                item_key = sections[1]
                                amt = sections[2] or 1

                                if item_key then
                                    for _ = 1, amt do
                                        for i,v in ipairs(G.PROFILES[G.SETTINGS.profile]["YggInventory"] or {}) do
                                            if v.id == item_key then table.remove(G.PROFILES[G.SETTINGS.profile]["YggInventory"], i) break end
                                        end
                                    end
                                end
                            end
                        end
                        G.GAME["YggAutoDelete"] = G.GAME["YggAutoDeleteInput"]
                        G.FUNCS.ygg_open_inventory()
                    end
                }),
                {n = G.UIT.C, config = {align = "tr", minw = 0.5, minh = 0.5, padding = 0.1, r = 0.1, hover = true, colour = G.C.RED, shadow = true, button = "ygg_clear_delete_text"}, nodes = {
                    {n = G.UIT.R, config = { align = "cm", padding = 0.05 }, nodes = {
                        {n = G.UIT.T, config = {text = localize("ygg_clear"), scale = 0.4, colour = G.C.UI.TEXT_LIGHT}}
                        }
                    },
                    }
                },   
            }},
            {n = G.UIT.R, config = {align = "tr", padding = 0.02}, nodes = {
                {n = G.UIT.C, config = {align = "tr", minw = 0.5, minh = 0.5, padding = 0.1, r = 0.1, hover = true, colour = G.C.RED, shadow = true, button = "ygg_switch_second_area", second_area = "Craft"}, nodes = {
                    {n = G.UIT.R, config = { align = "cm", padding = 0.05 }, nodes = {
                        {n = G.UIT.T, config = {text = localize("ygg_craft_text"), scale = 0.4, colour = G.C.UI.TEXT_LIGHT}}
                        }
                    },
                    }
                },
                {n = G.UIT.C, config = {align = "tr", minw = 0.5, minh = 0.5, padding = 0.1, r = 0.1, hover = true, colour = G.C.RED, shadow = true, button = "ygg_switch_second_area", second_area = "Recipes"}, nodes = {
                    {n = G.UIT.R, config = { align = "cm", padding = 0.05 }, nodes = {
                        {n = G.UIT.T, config = {text = localize("ygg_recipes_text"), scale = 0.4, colour = G.C.UI.TEXT_LIGHT}}
                        }
                    },
                    }
                },   
            }},
            {n = G.UIT.R, config = {align = "tm", padding = cardarea_padding}, nodes = {
                {n = G.UIT.O, config = {align = "tm", object = G["ygg_delete_cardarea1"]}}
            }},
            {n = G.UIT.R, config = {align = "tm", padding = cardarea_padding}, nodes = {
                {n = G.UIT.O, config = {align = "tm", object = G["ygg_delete_cardarea2"]}}
            }},
            {n = G.UIT.R, config = {align = "tm", padding = cardarea_padding}, nodes = {
                {n = G.UIT.O, config = {align = "tm", object = G["ygg_delete_cardarea3"]}}
            }},
            {n = G.UIT.R, config = {align = "cm", padding = 0.02}, nodes = {
                {n = G.UIT.C, config = {align = "cm", minw = 1.8, minh = 1.2, padding = 0.1, r = 0.1, hover = true, colour = G.C.RED, shadow = true, button = "ygg_delete_all"}, nodes = {
                    {n = G.UIT.R, config = { align = "cm", padding = 0.05 }, nodes = {
                        {n = G.UIT.T, config = {text = string.upper(localize("ygg_delete_text")), scale = 0.7, colour = G.C.UI.TEXT_LIGHT}}
                        }
                    },
                    }
                },   
            }},
        }
    elseif G.GAME["YggSecondAreaMode"] and G.GAME["YggSecondAreaMode"] == "Recipes" then --Recipe Area
        second_area_nodes = {
            {n = G.UIT.R, config = {align = "tm", padding = 0.2}, nodes = {
                {n = G.UIT.O, config = {align = "tm",object = DynaText({scale = 0.75, string = localize('ygg_recipe_area_text'), maxw = 9, colours = { G.C.WHITE }, float = true, silent = true, shadow = true})}}
            }},
            {n = G.UIT.R, config = {align = "tr", padding = 0.02}, nodes = {
                ygg_create_text_input({w = 3, prompt_text = G.GAME["YggRecipe"], id = "ygg_recipe_search", extended_corpus = true, ref_table = G.GAME, ref_value = 'YggRecipeInput',
                    callback = function(_)
                        G.GAME["YggRecipe"] = G.GAME["YggRecipeInput"]
                        G.FUNCS.ygg_open_inventory()
                    end
                }),
                {n = G.UIT.C, config = {align = "tr", minw = 0.5, minh = 0.5, padding = 0.1, r = 0.1, hover = true, colour = G.C.RED, shadow = true, button = "ygg_clear_recipe_text"}, nodes = {
                    {n = G.UIT.R, config = { align = "cm", padding = 0.05 }, nodes = {
                        {n = G.UIT.T, config = {text = localize("ygg_clear"), scale = 0.4, colour = G.C.UI.TEXT_LIGHT}}
                        }
                    },
                    }
                },   
            }},
            {n = G.UIT.R, config = {align = "tr", padding = 0.02}, nodes = {
                {n = G.UIT.C, config = {align = "tr", minw = 0.5, minh = 0.5, padding = 0.1, r = 0.1, hover = true, colour = G.C.RED, shadow = true, button = "ygg_switch_second_area", second_area = "Craft"}, nodes = {
                    {n = G.UIT.R, config = { align = "cm", padding = 0.05 }, nodes = {
                        {n = G.UIT.T, config = {text = localize("ygg_craft_text"), scale = 0.4, colour = G.C.UI.TEXT_LIGHT}}
                        }
                    },
                    }
                }, 
                {n = G.UIT.C, config = {align = "tr", minw = 0.5, minh = 0.5, padding = 0.1, r = 0.1, hover = true, colour = G.C.RED, shadow = true, button = "ygg_switch_second_area", second_area = "Delete"}, nodes = {
                    {n = G.UIT.R, config = { align = "cm", padding = 0.05 }, nodes = {
                        {n = G.UIT.T, config = {text = localize("ygg_delete_text"), scale = 0.4, colour = G.C.UI.TEXT_LIGHT}}
                        }
                    },
                    }
                },     
            }},
            {n = G.UIT.R, config = {align = "tm", padding = 0.2}, nodes = {
                {n = G.UIT.C, config = {align = "tm", padding = 0.2}, nodes = {
                    {n = G.UIT.R, config = {align = "tm", padding = cardarea_padding}, nodes = {
                        {n = G.UIT.O, config = {align = "tm", object = G["ygg_recipe_cardarea1"]}}
                    }},
                    {n = G.UIT.R, config = {align = "tm", padding = cardarea_padding}, nodes = {
                        {n = G.UIT.O, config = {align = "tm", object = G["ygg_recipe_cardarea2"]}}
                    }},
                    {n = G.UIT.R, config = {align = "tm", padding = cardarea_padding}, nodes = {
                        {n = G.UIT.O, config = {align = "tm", object = G["ygg_recipe_cardarea3"]}}
                    }},
                }},
                {n=G.UIT.C, config={align = "cm",padding = args.padding or 0.2, minw = 1}, nodes= 
                    {
                        {n = G.UIT.O, config = {align = "tm",object = DynaText({scale = 0.75, string = ">", maxw = 9, colours = { G.C.WHITE }, float = true, silent = true, shadow = true})}}
                    }
                },
                {n = G.UIT.C, config = {align = "tm", padding = 0.2}, nodes = {
                    {n = G.UIT.R, config = {align = "tm", padding = cardarea_padding}, nodes = {
                        {n = G.UIT.O, config = {align = "tm", object = G["ygg_placeholder_cardarea1"]}}
                    }},
                    {n = G.UIT.R, config = {align = "tm", padding = cardarea_padding}, nodes = {
                        {n = G.UIT.O, config = {align = "tm", object = G["ygg_recipe_cardarea4"]}}
                    }},
                    {n = G.UIT.R, config = {align = "tm", padding = cardarea_padding}, nodes = {
                        {n = G.UIT.O, config = {align = "tm", object = G["ygg_placeholder_cardarea2"]}}
                    }},
                }},
            }},
            {n = G.UIT.R, config = {align = "cm", padding = 0.02}, nodes = {
                {
                    n = G.UIT.C,
                    config = {
                        align = "cm",
                        minw = 0.5,
                        minh = 0.5,
                        padding = 0.1,
                        r = 0.1,
                        hover = true,
                        colour = G.C.RED,
                        shadow = true,
                        button = "to_previous_recipe_page",
                        page = true_recipe_page
                    },
                    nodes = {
                        {
                            n = G.UIT.R,
                            config = { align = "cm", padding = 0.05 },
                            nodes = {
                                {
                                    n = G.UIT.T,
                                    config = {
                                        text = "<",
                                        scale = 0.4,
                                        colour = G.C.UI.TEXT_LIGHT
                                    }
                                }
                            }
                        },
                    }
                },   

                {
                    n = G.UIT.C,
                    config = {
                        align = "cm",
                        minw = 1,
                        minh = 0.5,
                        padding = 0.1,
                        r = 0.1,
                        hover = true,
                        colour = G.C.RED,
                        shadow = true,
                    },
                    nodes = {
                        {
                            n = G.UIT.R,
                            config = { align = "cm", padding = 0.05 },
                            nodes = {
                                {
                                    n = G.UIT.T,
                                    config = {
                                        text = localize("ygg_page").." "..(G.GAME["YggRecipePage"] or 1).."/"..(true_recipe_page),
                                        scale = 0.4,
                                        colour = G.C.UI.TEXT_LIGHT
                                    }
                                }
                            }
                        },
                    }
                },   

                {
                    n = G.UIT.C,
                    config = {
                        align = "cm",
                        minw = 0.5,
                        minh = 0.5,
                        padding = 0.1,
                        r = 0.1,
                        hover = true,
                        colour = G.C.RED,
                        shadow = true,
                        button = "to_next_recipe_page",
                        page = true_recipe_page
                    },
                    nodes = {
                        {
                            n = G.UIT.R,
                            config = { align = "cm", padding = 0.05 },
                            nodes = {
                                {
                                    n = G.UIT.T,
                                    config = {
                                        text = ">",
                                        scale = 0.4,
                                        colour = G.C.UI.TEXT_LIGHT
                                    }
                                }
                            }
                        },
                    }
                },   
            }},
        }
    else --Crafting Area
        second_area_nodes = {
            {n = G.UIT.R, config = {align = "tm", padding = 0.2}, nodes = {
                {n = G.UIT.O, config = {align = "tm",object = DynaText({scale = 0.75, string = localize('ygg_crafting_area_text'), maxw = 9, colours = { G.C.WHITE }, float = true, silent = true, shadow = true})}}
            }},
            {n = G.UIT.R, config = {align = "tr", padding = 0.02}, nodes = {
                {n = G.UIT.C, config = {align = "tr", minw = 0.5, minh = 0.5, padding = 0.1, r = 0.1, hover = true, colour = G.C.RED, shadow = true, button = "ygg_switch_second_area", second_area = "Delete"}, nodes = {
                    {n = G.UIT.R, config = { align = "cm", padding = 0.05 }, nodes = {
                        {n = G.UIT.T, config = {text = localize("ygg_delete_text"), scale = 0.4, colour = G.C.UI.TEXT_LIGHT}}
                        }
                    },
                    }
                },
                {n = G.UIT.C, config = {align = "tr", minw = 0.5, minh = 0.5, padding = 0.1, r = 0.1, hover = true, colour = G.C.RED, shadow = true, button = "ygg_switch_second_area", second_area = "Recipes"}, nodes = {
                    {n = G.UIT.R, config = { align = "cm", padding = 0.05 }, nodes = {
                        {n = G.UIT.T, config = {text = localize("ygg_recipes_text"), scale = 0.4, colour = G.C.UI.TEXT_LIGHT}}
                        }
                    },
                    }
                },
            }},
            {n = G.UIT.R, config = {align = "tm", padding = cardarea_padding}, nodes = {
                {n = G.UIT.O, config = {align = "tm", object = G["ygg_crafting_cardarea1"]}}
            }},
            {n = G.UIT.R, config = {align = "tm", padding = cardarea_padding}, nodes = {
                {n = G.UIT.O, config = {align = "tm", object = G["ygg_crafting_cardarea2"]}}
            }},
            {n = G.UIT.R, config = {align = "tm", padding = cardarea_padding}, nodes = {
                {n = G.UIT.O, config = {align = "tm", object = G["ygg_crafting_cardarea3"]}}
            }},
            {n = G.UIT.R, config = {align = "tm", padding = cardarea_padding}, nodes = {
                {n = G.UIT.O, config = {align = "tm", object = DynaText({scale = 0.4, string = localize('ygg_craft_guide'), maxw = 9, colours = { G.C.GREY }, silent = true})}},
            }},
            {n = G.UIT.R, config = {align = "cm", padding = cardarea_padding, colour = {G.C.GREY[1], G.C.GREY[2], G.C.GREY[3],0.3}, r = 0.3}, nodes = {
                {n = G.UIT.O, config = {align = "tm", object = G["ygg_crafting_show"]}}
            }},
        }
    end

    return {n=G.UIT.ROOT, config = {align = "cm", minw = G.ROOM.T.w*5, minh = G.ROOM.T.h*5,padding = 0.1, r = 0.1, colour = args.bg_colour or {G.C.GREY[1], G.C.GREY[2], G.C.GREY[3],0.7}}, nodes={
      {n=G.UIT.R, config={align = "cm", minh = 1,r = 0.3, padding = 0.07, minw = 1, colour = args.outline_colour or G.C.JOKER_GREY, emboss = 0.1}, nodes={
        {n=G.UIT.C, config={align = "cm", minh = 1,r = 0.2, padding = 0.2, minw = 1, colour = args.colour or G.C.L_BLACK}, nodes={
            {n = G.UIT.R, config = {align = "cm", padding = 0}, nodes = {
                {n=G.UIT.C, config={align = "cm",padding = args.padding or 0.05, minw = args.minw or 7}, nodes= 
                    {
                        {n=G.UIT.R, config={align = "cm",padding = args.padding or 0.2, minw = args.minw or 7}, nodes= 
                            {

                                {n=G.UIT.C, config={align = "tm",padding = args.padding or 0.05, r = 0.3, minw = area_minw, minh = area_minh, colour = G.C.BLACK}, nodes= --Inventory Area
                                    {
                                        {n = G.UIT.R, config = {align = "tm", padding = 0.2}, nodes = {
                                            {n = G.UIT.O, config = {align = "tm", object = DynaText({scale = 0.75, string = localize('ygg_inventory_text'), maxw = 9, colours = { G.C.WHITE }, float = true, silent = true, shadow = true})}}
                                        }},
                                        {n = G.UIT.R, config = {align = "tr", padding = 0.02}, nodes = {
                                            ygg_create_text_input({w = 3, prompt_text = G.GAME["YggSearchOption"], id = "ygg_search_option", extended_corpus = true, ref_table = G.GAME, ref_value = 'YggSearchOptionInput',
                                                callback = function(_)
                                                    G.GAME["YggSearchOption"] = G.GAME["YggSearchOptionInput"]
                                                    G.FUNCS.ygg_open_inventory()
                                                end
                                            }),
                                            {n = G.UIT.C, config = {align = "tr", minw = 0.5, minh = 0.5, padding = 0.1, r = 0.1, hover = true, colour = G.C.RED, shadow = true, button = "ygg_clear_text"}, nodes = {
                                                {n = G.UIT.R, config = { align = "cm", padding = 0.05 }, nodes = {
                                                    {n = G.UIT.T, config = {text = localize("ygg_clear"), scale = 0.4, colour = G.C.UI.TEXT_LIGHT}}
                                                    }
                                                },
                                                }
                                            },   
                                        }},
                                        {n = G.UIT.R, config = {align = "tr", padding = 0.02}, nodes = {
                                            {
                                                n = G.UIT.C,
                                                config = {
                                                    align = "tr",
                                                    minw = 0.5,
                                                    minh = 0.5,
                                                    padding = 0.1,
                                                    r = 0.1,
                                                    hover = true,
                                                    colour = G.C.RED,
                                                    shadow = true,
                                                    button = "ygg_switch_sort_type",
                                                    sort_type = "Rarity",
                                                },
                                                nodes = {
                                                    {
                                                        n = G.UIT.R,
                                                        config = { align = "cm", padding = 0.05 },
                                                        nodes = {
                                                            {
                                                                n = G.UIT.T,
                                                                config = {
                                                                    text = localize("ygg_sort_rarity"),
                                                                    scale = 0.3,
                                                                    colour = G.C.UI.TEXT_LIGHT
                                                                }
                                                            }
                                                        }
                                                    },
                                                }
                                            },   
                                            {
                                                n = G.UIT.C,
                                                config = {
                                                    align = "tr",
                                                    minw = 0.5,
                                                    minh = 0.5,
                                                    padding = 0.1,
                                                    r = 0.1,
                                                    hover = true,
                                                    colour = G.C.RED,
                                                    shadow = true,
                                                    button = "ygg_switch_sort_type",
                                                    sort_type = "Date",
                                                },
                                                nodes = {
                                                    {
                                                        n = G.UIT.R,
                                                        config = { align = "cm", padding = 0.05 },
                                                        nodes = {
                                                            {
                                                                n = G.UIT.T,
                                                                config = {
                                                                    text = localize("ygg_sort_date"),
                                                                    scale = 0.3,
                                                                    colour = G.C.UI.TEXT_LIGHT
                                                                }
                                                            }
                                                        }
                                                    },
                                                }
                                            },   
                                        }},
                                        {n = G.UIT.R, config = {align = "tm", padding = cardarea_padding}, nodes = {
                                            {n = G.UIT.O, config = {align = "tm", object = G["ygg_inventory_cardarea1"]}}
                                        }},
                                        {n = G.UIT.R, config = {align = "tm", padding = cardarea_padding}, nodes = {
                                            {n = G.UIT.O, config = {align = "tm", object = G["ygg_inventory_cardarea2"]}}
                                        }},
                                        {n = G.UIT.R, config = {align = "tm", padding = cardarea_padding}, nodes = {
                                            {n = G.UIT.O, config = {align = "tm", object = G["ygg_inventory_cardarea3"]}}
                                        }},
                                        {n = G.UIT.R, config = {align = "cm", padding = 0.02}, nodes = {
                                            {
                                                n = G.UIT.C,
                                                config = {
                                                    align = "cm",
                                                    minw = 0.5,
                                                    minh = 0.5,
                                                    padding = 0.1,
                                                    r = 0.1,
                                                    hover = true,
                                                    colour = G.C.RED,
                                                    shadow = true,
                                                    button = "to_previous_inventory_page",
                                                    page = true_page
                                                },
                                                nodes = {
                                                    {
                                                        n = G.UIT.R,
                                                        config = { align = "cm", padding = 0.05 },
                                                        nodes = {
                                                            {
                                                                n = G.UIT.T,
                                                                config = {
                                                                    text = "<",
                                                                    scale = 0.4,
                                                                    colour = G.C.UI.TEXT_LIGHT
                                                                }
                                                            }
                                                        }
                                                    },
                                                }
                                            },   

                                            {
                                                n = G.UIT.C,
                                                config = {
                                                    align = "cm",
                                                    minw = 1,
                                                    minh = 0.5,
                                                    padding = 0.1,
                                                    r = 0.1,
                                                    hover = true,
                                                    colour = G.C.RED,
                                                    shadow = true,
                                                },
                                                nodes = {
                                                    {
                                                        n = G.UIT.R,
                                                        config = { align = "cm", padding = 0.05 },
                                                        nodes = {
                                                            {
                                                                n = G.UIT.T,
                                                                config = {
                                                                    text = localize("ygg_page").." "..(G.GAME.ygg_inven_page or 1).."/"..(true_page or math.max(math.ceil(#(G.PROFILES[G.SETTINGS.profile]["YggInventory"] or {})/15), 1)),
                                                                    scale = 0.4,
                                                                    colour = G.C.UI.TEXT_LIGHT
                                                                }
                                                            }
                                                        }
                                                    },
                                                }
                                            },   

                                            {
                                                n = G.UIT.C,
                                                config = {
                                                    align = "cm",
                                                    minw = 0.5,
                                                    minh = 0.5,
                                                    padding = 0.1,
                                                    r = 0.1,
                                                    hover = true,
                                                    colour = G.C.RED,
                                                    shadow = true,
                                                    button = "to_next_inventory_page",
                                                    page = true_page
                                                },
                                                nodes = {
                                                    {
                                                        n = G.UIT.R,
                                                        config = { align = "cm", padding = 0.05 },
                                                        nodes = {
                                                            {
                                                                n = G.UIT.T,
                                                                config = {
                                                                    text = ">",
                                                                    scale = 0.4,
                                                                    colour = G.C.UI.TEXT_LIGHT
                                                                }
                                                            }
                                                        }
                                                    },
                                                }
                                            },   
                                        }},
                                    }
                                },
                                {n=G.UIT.C, config={align = "tm",padding = args.padding or 0.05, r = 0.3, minw = area_minw, minh = area_minh, colour = G.C.BLACK}, nodes= --Second Area
                                    second_area_nodes
                                },

                            }
                        },
                    }
                },
            }},

            {n = G.UIT.R, config = {align = "cm", padding = 0}, nodes = {
                not args.no_back and {n=G.UIT.C, config={id = args.back_id or 'overlay_menu_back_button', align = "cm", minw = 8, button_delay = args.back_delay, padding =0.1, r = 0.1, hover = true, colour = args.back_colour or G.C.ORANGE, button = back_func, shadow = true, focus_args = {nav = 'wide', button = 'b', snap_to = args.snap_back}}, nodes={
                    {n=G.UIT.R, config={align = "cm", padding = 0, no_fill = true}, nodes={
                        {n=G.UIT.T, config={id = args.back_id or nil, text = args.back_label or localize('b_back'), scale = 0.5, colour = G.C.UI.TEXT_LIGHT, shadow = true, func = not args.no_pip and 'set_button_pip' or nil, focus_args =  not args.no_pip and {button = args.back_button or 'b'} or nil}}
                    }}
                }} or nil
            }},
        }},
      }},
    }}
end

function create_inventory_menu()   
    G.E_MANAGER:add_event(Event({
        blockable = false,
        func = function()
            G.REFRESH_ALERTS = true
            return true
        end
    }))
  
    local t = create_inventory_UI()
    return t
end

G.FUNCS.ygg_open_inventory = function()
    --G.SETTINGS.paused = true
    Yggdrasil.cleanup_dead_elements(G, "MOVEABLES")
    
    G.FUNCS.overlay_menu{
        definition = create_inventory_menu(),
    }
end

local hookTo = Game.update
function Game:update(dt)
    local ret = hookTo(self, dt)

    if G["ygg_crafting_show"] and G["ygg_crafting_show"].cards then
        local available_crafting_recipes = {}

        for _, card_info in pairs(YggCraftingRecipes) do
            local card_key = card_info.card_key
            local recipe_valid = true
            if card_info.config and card_info.config.no_order then
                local needed_mats = {}
                for _, recipe in ipairs(card_info.recipe) do
                    for _, recipe_id in ipairs(recipe) do
                        if not needed_mats[recipe_id] then needed_mats[recipe_id] = 0 end
                        needed_mats[recipe_id] = needed_mats[recipe_id] + 1
                    end
                end

                for i = 1,3 do
                    for _,mat in ipairs(G["ygg_crafting_cardarea"..i].cards or {}) do
                        local true_key = Yggdrasil.get_true_key(mat)
                        local craft_key = Yggdrasil.get_craft_key(true_key)

                        if needed_mats[true_key] or needed_mats[craft_key] then
                            if needed_mats[true_key] then
                                needed_mats[true_key] = needed_mats[true_key] - 1
                                if needed_mats[true_key] <= 0 then needed_mats[true_key] = nil end
                            elseif needed_mats[craft_key] then
                                needed_mats[craft_key] = needed_mats[craft_key] - 1
                                if needed_mats[craft_key] <= 0 then needed_mats[craft_key] = nil end
                            end
                        end
                    end
                end

                if Yggdrasil.get_table_length(needed_mats) > 0 then
                    recipe_valid = false
                end
            else
                for num, recipe in ipairs(card_info.recipe) do
                    local valid = true
                    for recipe_num, recipe_id in ipairs(recipe) do
                        local use_craft_id = false
                        for _,rarity in pairs(YggMaterialList) do
                            if use_craft_id then break end
                            for _,material in ipairs(rarity) do
                                if material.craft_id and material.craft_id == recipe_id then
                                    use_craft_id = true
                                    break
                                end
                            end
                        end

                        if use_craft_id then
                            if G["ygg_crafting_cardarea"..num] and G["ygg_crafting_cardarea"..num].cards and G["ygg_crafting_cardarea"..num].cards[recipe_num] then
                                local true_key = Yggdrasil.get_true_key(G["ygg_crafting_cardarea"..num].cards[recipe_num])
                                local craft_key = Yggdrasil.get_craft_key(true_key)

                                if craft_key and craft_key == recipe_id then
                                else
                                    valid = false; break
                                end
                            else
                                valid = false; break
                            end
                        else
                            if G["ygg_crafting_cardarea"..num] and G["ygg_crafting_cardarea"..num].cards and G["ygg_crafting_cardarea"..num].cards[recipe_num] and Yggdrasil.get_true_key(G["ygg_crafting_cardarea"..num].cards[recipe_num]) == recipe_id then
                            else
                                valid = false; break
                            end
                        end
                    end
                    if not valid then recipe_valid = false; break end
                end
            end

            if recipe_valid then
                available_crafting_recipes[#available_crafting_recipes+1] = card_key
            end
        end

        for _,card_key in ipairs(available_crafting_recipes) do
            local exists = false
            for _,v in ipairs(G["ygg_crafting_show"].cards or {}) do
                if v.config.center.key == card_key then exists = true break end
            end
            if not exists and G["ygg_crafting_show"] and G["ygg_crafting_show"].cards then
                local card = SMODS.add_card({key = card_key, no_edition = true, area = G["ygg_crafting_show"]})
                card.ability.is_material = true
            end
        end

        for _,v in ipairs(G["ygg_crafting_show"].cards or {}) do
            local exists = false
            for _,card_key in ipairs(available_crafting_recipes) do
                if card_key == v.config.center.key then exists = true break end
            end
            if not exists then
                G["ygg_crafting_show"]:remove_card(v)
                v:remove()
            end
        end
    end

    return ret
end


--believe me when i say idk what im doing
local hookTo = SMODS.calculate_context
function SMODS.calculate_context(context, return_table)
    local gains_multi = {
        mult = 1, chips = 1, xchips = 1, xmult = 1
    }
    local retrigger_times = 0
    local function ygg_calculate_multi()
        gains_multi = {mult = 1, chips = 1, xchips = 1, xmult = 1}
        retrigger_times = 0

        for relic_key, relic_config in pairs(YggRelicEffects) do
            if Yggdrasil.have_item(relic_key) then
                for _ = 1, Yggdrasil.amt_item_inv(relic_key) do
                    for gain_type,_ in pairs(gains_multi) do
                        if relic_config.config[gain_type.."_multi"] then
                            gains_multi[gain_type] = gains_multi[gain_type] + (relic_config.config[gain_type.."_multi"] - 1)
                        end
                    end
                    if relic_config.config["retrigger_times"] then
                        retrigger_times = retrigger_times + relic_config.config["retrigger_times"]
                    end
                end
            end
        end
    end

    if context.mat_joker_main then
        for key,config in pairs(YggRelicEffects) do
            for _,v in ipairs(G.PROFILES[G.SETTINGS.profile]["YggInventory"] or {}) do
                if v.id == key then
                    local gains = {
                        mult = 0, chips = 0, xchips = 1, xmult = 1
                    }
                    
                    if config.config and config.config.has_disable then
                        if not G.GAME["ygg_"..key.."_disabled"] then
                            for gain_type, gain in pairs(config.config or {}) do
                                if gains[gain_type] then gains[gain_type] = gains[gain_type] + gain end
                            end
                        end
                    else
                        for gain_type, gain in pairs(config.config or {}) do
                            if gains[gain_type] then gains[gain_type] = gains[gain_type] + gain end
                        end
                    end

                    ygg_calculate_multi()

                    for gain_type, gain in pairs(gains) do
                        if gain_type ~= "xmult" and gain_type ~= "xchips" then
                            gains[gain_type] = gains[gain_type] * gains_multi[gain_type]
                        elseif gain ~= 1 then
                            gains[gain_type] = gains[gain_type] * gains_multi[gain_type]
                        end
                    end

                    SMODS.calculate_effect({mult = gains["mult"], chips = gains["chips"], xmult = gains["xmult"], xchips = gains["xchips"]}, G.deck)

                    if retrigger_times > 0 then
                        for _ = 1, retrigger_times do
                            SMODS.calculate_effect({message = localize("k_again_ex")}, G.deck)
                            SMODS.calculate_effect({mult = gains["mult"], chips = gains["chips"], xmult = gains["xmult"], xchips = gains["xchips"]}, G.deck)
                        end
                    end
                end
            end
        end

        if Yggdrasil.have_item("misprinted_talisman") then
            for _ = 1, Yggdrasil.amt_item_inv("misprinted_talisman") do
                local function func()
                    SMODS.calculate_effect({xmult = (1 + (pseudorandom("ygg_misprinted_talisman", -1, 5) * 0.1)) * gains_multi["xmult"]}, G.deck)
                end
                func()
                if retrigger_times > 0 then
                    for _ = 1, retrigger_times do
                        SMODS.calculate_effect({message = localize("k_again_ex")}, G.deck)
                        func()
                    end
                end
            end
        end
    end
    
    if context.mat_end_of_round then
        if pseudorandom("ygg_gros_michel_roll") <= 1/5 and not G.GAME["ygg_gros_michel_disabled"] and Yggdrasil.have_item("gros_michel") then
            G.GAME["ygg_gros_michel_disabled"] = true
            SMODS.calculate_effect({message = localize("ygg_disabled")}, G.deck)
        end

        if pseudorandom("ygg_cavendish_roll") <= 1/100 and not G.GAME["ygg_cavendish_disabled"] and Yggdrasil.have_item("cavendish") then
            G.GAME["ygg_cavendish_disabled"] = true
            SMODS.calculate_effect({message = localize("ygg_disabled")}, G.deck)
        end
    end

    if context.mat_individual and context.cardarea == G.play then
        ygg_calculate_multi()

        if Yggdrasil.have_item("sharp_spear") then
            for _ = 1, Yggdrasil.amt_item_inv("sharp_spear") do
                if context.other_card:is_suit("Spades") then
                    SMODS.calculate_effect({chips = 15 * gains_multi["mult"]}, context.other_card)
                    if retrigger_times > 0 then
                        for _ = 1, retrigger_times do
                            SMODS.calculate_effect({message = localize("k_again_ex")}, context.other_card)
                            SMODS.calculate_effect({chips = 15 * gains_multi["mult"]}, context.other_card)
                        end
                    end
                end 
            end
        end

        if Yggdrasil.have_item("cupid_bow") then
            for _ = 1, Yggdrasil.amt_item_inv("cupid_bow") do
                if context.other_card:is_suit("Hearts") then
                    SMODS.calculate_effect({xmult = 1.1 * gains_multi["xmult"]}, context.other_card)
                    if retrigger_times > 0 then
                        for _ = 1, retrigger_times do
                            SMODS.calculate_effect({message = localize("k_again_ex")}, context.other_card)
                            SMODS.calculate_effect({xmult = 1.1 * gains_multi["xmult"]}, context.other_card)
                        end
                    end
                end 
            end
        end

        if Yggdrasil.have_item("clover_talisman") then
            for _ = 1, Yggdrasil.amt_item_inv("sharp_spear") do
                if context.other_card:is_suit("Clubs") then
                    SMODS.calculate_effect({mult = 2 * gains_multi["mult"]}, context.other_card)
                    if retrigger_times > 0 then
                        for _ = 1, retrigger_times do
                            SMODS.calculate_effect({message = localize("k_again_ex")}, context.other_card)
                            SMODS.calculate_effect({mult = 2 * gains_multi["mult"]}, context.other_card)
                        end
                    end
                end 
            end
        end

        if Yggdrasil.have_item("diamond_staff") then
            for _ = 1, Yggdrasil.amt_item_inv("sharp_spear") do
                if context.other_card:is_suit("Diamonds") then
                    SMODS.calculate_effect({dollars = 0.5}, context.other_card)
                    if retrigger_times > 0 then
                        for _ = 1, retrigger_times do
                            SMODS.calculate_effect({message = localize("k_again_ex")}, context.other_card)
                            SMODS.calculate_effect({dollars = 0.5}, context.other_card)
                        end
                    end
                end 
            end
        end

        if Yggdrasil.have_item("rainbow_element") then
            for _ = 1, Yggdrasil.amt_item_inv("rainbow_element") do
                if context.other_card:is_suit("Diamonds") then
                    local amt = 5
                    for _,v in ipairs(context.scoring_hand) do
                        if v:is_suit("Diamonds") and v ~= context.other_card then amt = amt + 1 end
                    end
                    local function func() 
                        SMODS.calculate_effect({dollars = amt}, context.other_card)
                    end
                    
                    func()
                    if retrigger_times > 0 then
                        for _ = 1, retrigger_times do
                            SMODS.calculate_effect({message = localize("k_again_ex")}, context.other_card)
                            func()
                        end
                    end
                end 

                if context.other_card:is_suit("Clubs") then
                    local amt = 25
                    for _,v in ipairs(context.scoring_hand) do
                        if v:is_suit("Diamonds") and v ~= context.other_card then amt = amt + 5 end
                    end
                    local function func() 
                        SMODS.calculate_effect({mult = amt * gains_multi["mult"]}, context.other_card)
                    end
                    
                    func()
                    if retrigger_times > 0 then
                        for _ = 1, retrigger_times do
                            SMODS.calculate_effect({message = localize("k_again_ex")}, context.other_card)
                            func()
                        end
                    end
                end

                if context.other_card:is_suit("Spades") then
                    local amt = 2
                    for _,v in ipairs(context.scoring_hand) do
                        if v:is_suit("Spades") and v ~= context.other_card then amt = amt + 0.2 end
                    end
                    local function func() 
                        SMODS.calculate_effect({xchips = amt * gains_multi["xchips"]}, context.other_card)
                    end
                    
                    func()
                    if retrigger_times > 0 then
                        for _ = 1, retrigger_times do
                            SMODS.calculate_effect({message = localize("k_again_ex")}, context.other_card)
                            func()
                        end
                    end
                end

                if context.other_card:is_suit("Hearts") then
                    local amt = 2
                    for _,v in ipairs(context.scoring_hand) do
                        if v:is_suit("Hearts") and v ~= context.other_card then amt = amt + 0.2 end
                    end
                    local function func() 
                        SMODS.calculate_effect({xmult = amt * gains_multi["xchips"]}, context.other_card)
                    end
                    
                    func()
                    if retrigger_times > 0 then
                        for _ = 1, retrigger_times do
                            SMODS.calculate_effect({message = localize("k_again_ex")}, context.other_card)
                            func()
                        end
                    end
                end
            end


        end
    end

    --[[if context.mat_repetition then  (Might be better to handle these in the dummy joker instead.)
        if context.cardarea == G.play then
            if Yggdrasil.have_item("rainbow_element") then
                for _ = 1, Yggdrasil.amt_item_inv("rainbow_element") do
                    if context.other_card:is_suit("Hearts") and context.other_card:is_suit("Spades") and context.other_card:is_suit("Clubs") and context.other_card:is_suit("Diamonds") then
                        SMODS.calculate_effect({repetitions = 1, card = context.other_card}, context.other_card)
                    end
                end
            end
        end
    end]]

    if context.mat_other_consumeable then
        ygg_calculate_multi()

        if Yggdrasil.have_item("astronaut_helmet") then
            for _ = 1, Yggdrasil.amt_item_inv("astronaut_helmet") do
                if context.mat_other_consumeable.ability.set == "Planet" then
                    SMODS.calculate_effect({mult = 10 * gains_multi["mult"]}, context.mat_other_consumeable)
                    for _ = 1, retrigger_times do
                        SMODS.calculate_effect({message = localize("k_again_ex")}, context.mat_other_consumeable)
                        SMODS.calculate_effect({mult = 10 * gains_multi["mult"]}, context.mat_other_consumeable)
                    end
                end
            end
        end
    end

    if context.mat_other_joker then
        ygg_calculate_multi()

        if Yggdrasil.have_item("chains_of_eternity") then
            for i = 1, Yggdrasil.amt_item_inv("chains_of_eternity") do
                if context.mat_other_joker.ability and context.mat_other_joker.ability.eternal then
                    SMODS.calculate_effect({xmult = 2 * gains_multi["xmult"]}, context.mat_other_joker)
                    if retrigger_times > 0 then
                        for _ = 1, retrigger_times do
                            SMODS.calculate_effect({message = localize("k_again_ex")}, context.mat_other_joker)
                            SMODS.calculate_effect({xmult = 2 * gains_multi["xmult"]}, context.mat_other_joker)
                        end
                    end
                end 
            end
        end
    end

    return hookTo(context, return_table)
end