SkillTreePerks = {
    --[[Format:
    section_id = {
        { --Everything in here will be in one line.
            {text = "text_to_show_on_button", perk_id = "perk_id", max_cap = 1 --Default is 1, requirement = {"perk_id2, perk_id3"} --Perk is not unlockable if requirements are not met, cost = 1}
        }
    }

    {text = "M3", perk_id = "BLANK"}, --This allows you to add blank
    
    Additional configs that can be added to automate some effects:
    - buff = {j_speed = x, j_atkMulti = y, j_mult = z,...} <- Scales on cap. Adds the stat to all jokers. B:SR exclusive thing.

    - cash (num) <- Gives money at the end of round.
    - chips (num) <- Gives Chips at context.joker_main timing. Priority is 1
    - mult (num) <- Gives Mult at context.joker_main timing. Priority is 2.
    - xchips (num) <- Gives XChips at context.joker_main timing. Priority is 3.
    - xmult (num) <- Gives XMult at context.joker_main timing. Priority is 4.
    - played_...^ (num) <- Gives (?) at context.individual, context.cardarea == G.play timing. (NOT YET IMPLEMENTED)
    - hand_...^ (num) <- Gives (?) at context.individual, context.cardarea == G.hand timing. (NOT YET IMPLEMENTED)
    - hand_size (num) <- Increases/Decreases hand size.
    - xp_gain (num) <- Increases/Decreases XP Multiplier.
    - ante_scaling (num) <- Increases/Decreases Ante needed to win.

    - showdown_ante_decrease (num) <- Decreases/Increases Ante when Showdown Blinds appear.
    - force_showdown_ante_decrease (num) <- showdown_ante_decrease scales on win ante, because fuck you :3

    - config (table) <- Just something that you (or I) can use for code to read.
    
    - multMulti (num) <- Reduces total Skill Tree's Mult and XMult.
    - chipsMulti (num) <- Reduces total Skill Tree's Chips and XChips.

    - cost (num) <- Skill Point cost of the skill.
    - item_cost (table) <- The skill will also cost those items.
    EX:
        item_cost = {{item_id = "card_scrap", amt = 2}} --Without inputing amt, amt is 1 by default.

    Button configs, yipee:
    - lock_first_round (boolean): Makes it so the buffs can only be purchased during round 0.
    - exclude_with_skills (table, string): If any of the skills listed in here are obtained, disables the skill button.
    - func (function): Function that runs when the skill is purchased. Should be stored in G.FUNCS[func].

    1. How do you add your own skills and sections?
    EX:
    (I believe both me and you will figure this out :3)
    local game_start_run_ref = Game.start_run
    function Game:start_run(args)
        game_start_run_ref(self, args)

        if next(SMODS.find_mod("aikoyorisshenanigans")) then
            local new_sec = "ygg_skill_tree_AKYRS"
            if not check_if_section_exist(new_sec) then
                SkillTreePerks[new_sec] = {
                    {
                        {text = "AIKO1", perk_id = "ygg_AKYRS_1", max_cap = 1, cost = 10},
                        {text = "AIKO2", perk_id = "ygg_AKYRS_2", max_cap = 1, cost = 30},
                        {text = "AIKO3", perk_id = "ygg_AKYRS_3", max_cap = 1, xmult = 0, cost = 0},
                        {text = "AIKO4", perk_id = "ygg_AKYRS_4", max_cap = 1, cost = 10},
                    },
                }
                add_new_section(new_sec) 
            end
        end
        [...]
    end
    ]]

    --Each branch should have at most 12 skills.
    

    ygg_skill_tree_sec1 = {
        {
            {text = "T", perk_id = "ygg_trailblaze", max_cap = 25, cost = 1, buff = {j_speed = 1}},
            {text = "T.H", perk_id = "ygg_hunt_speed", max_cap = 25, cost = 2, buff = {j_speed = 1}, requirement = {"ygg_trailblaze"}},
            {text = "LAN", perk_id = "ygg_lan_blessing", max_cap = 1, cost = 10, buff = {j_speed = 15}, requirement = {"ygg_hunt_speed"}},
            {text = "C.M", perk_id = "ygg_calm", max_cap = 1, cost = 20, buff = {j_speed = -10, j_elementMulti = 0.1}, requirement = {"ygg_lan_blessing"}},
            {text = "GS", perk_id = "ygg_godspeed", max_cap = 1, cost = 20, buff = {j_speed = 20, j_bee = -0.05}, requirement = {"ygg_calm"}},
        },
        {
            {text = "D.P", perk_id = "ygg_destructive", max_cap = 10, cost = 1, buff = {j_atkMulti = 0.01}},
            {text = "D.S", perk_id = "ygg_destruction_strength", max_cap = 10, cost = 2, buff = {j_atkMulti = 0.01}, requirement = {"ygg_destructive"}},
            {text = "NAN", perk_id = "ygg_nanook_blessing", max_cap = 1, cost = 10, buff = {j_atkMulti = 0.2}, requirement = {"ygg_destruction_strength"}},
            {text = "WR", perk_id = "ygg_wrath", max_cap = 1, cost = 20, buff = {j_atkMulti = 0.2, j_bee = 0.1}, requirement = {"ygg_nanook_blessing"}},
            {text = "T.W", perk_id = "ygg_titan_wrath", max_cap = 10, cost = 2, buff = {j_atkMulti = 0.01, j_bee = 0.005, j_speed = -1}, requirement = {"ygg_wrath"}},
        },
    },
    ygg_skill_tree_sec2 = {
        {
            {text = "M1", perk_id = "ygg_mult1", max_cap = 25, cost = 1, mult = 0.5},
            {text = "M2", perk_id = "ygg_mult2", max_cap = 25, cost = 2, mult = 0.5, requirement = {"ygg_mult1"}},
            {text = "M3", perk_id = "ygg_mult3", max_cap = 1, cost = 10, config = {xmult = 0.005}, requirement = {"ygg_mult2"}},
            {text = "M4", perk_id = "ygg_mult4", max_cap = 1, cost = 15, mult = 20, xchips = -0.05, requirement = {"ygg_mult3"}},
            {text = "M5", perk_id = "ygg_mult5", max_cap = 20, cost = 3, mult = 1, requirement = {"ygg_mult4"}},
            {text = "M6", perk_id = "ygg_mult6", max_cap = 1, cost = 30, requirement = {"ygg_mult5"}},
            {text = "M7", perk_id = "ygg_mult7", max_cap = 1, cost = 30, requirement = {"ygg_mult6"}},
            {text = "M8", perk_id = "ygg_mult8", max_cap = 1, cost = 20, requirement = {"ygg_mult7"}},
            {text = "M9", perk_id = "ygg_mult9", max_cap = 1, cost = 20, requirement = {"ygg_mult8"}},
            {text = "M10", perk_id = "ygg_mult10", max_cap = 1, cost = 20, requirement = {"ygg_mult9"}},
            {text = "M11", perk_id = "ygg_mult11", max_cap = 1, cost = 20, requirement = {"ygg_mult10"}},
            {text = "M12", perk_id = "ygg_mult12", max_cap = 1, cost = 50, requirement = {"ygg_mult11"}},
        },
        {
            {text = "C1", perk_id = "ygg_chips1", max_cap = 25, cost = 1, chips = 1},
            {text = "C2", perk_id = "ygg_chips2", max_cap = 25, cost = 2, chips = 1, requirement = {"ygg_chips1"}},
            {text = "C3", perk_id = "ygg_chips3", max_cap = 1, cost = 10, chips = 100, xmult = -0.05, requirement = {"ygg_chips2"}},
            {text = "C4", perk_id = "ygg_chips4", max_cap = 1, cost = 15, chips = 50, xchips = 0.02, requirement = {"ygg_chips3"}},
            {text = "C5", perk_id = "ygg_chips5", max_cap = 1, cost = 25, requirement = {"ygg_chips4"}},
            {text = "C6", perk_id = "ygg_chips6", max_cap = 1, cost = 25, requirement = {"ygg_chips5"}},
            {text = "C7", perk_id = "ygg_chips7", max_cap = 1, cost = 10, requirement = {"ygg_chips6"}},
            {text = "C8", perk_id = "ygg_chips8", max_cap = 1, cost = 20, requirement = {"ygg_chips7"}},
            {text = "C9", perk_id = "ygg_chips9", max_cap = 1, cost = 20, chips = -100, xchips = 0.2, requirement = {"ygg_chips8"}},
            {text = "C10", perk_id = "ygg_chips10", max_cap = 1, cost = 20, requirement = {"ygg_chips9"}},
        },
        {
            {text = "LIGHT", perk_id = "ygg_special_light", max_cap = 1, cost = 100},
        },
    },
    ygg_skill_tree_sec3 = {
        {
            {text = "T.F", perk_id = "ygg_fool_upgrade", max_cap = 1, cost = 50},
            {text = "T.M", perk_id = "ygg_magician_upgrade", max_cap = 1, cost = 50},
            {text = "T.P", perk_id = "ygg_priestess_upgrade", max_cap = 1, cost = 50},
            {text = "T.E", perk_id = "ygg_empress_upgrade", max_cap = 1, cost = 30},
            {text = "T.E", perk_id = "ygg_emperor_upgrade", max_cap = 1, cost = 50},
            {text = "T.H", perk_id = "ygg_hierophant_upgrade", max_cap = 1, cost = 30},
            {text = "T.L", perk_id = "ygg_lovers_upgrade", max_cap = 1, cost = 50},
            {text = "T.C", perk_id = "ygg_chariot_upgrade", max_cap = 1, cost = 50},
            {text = "T.J", perk_id = "ygg_justice_upgrade", max_cap = 1, cost = 50},
            {text = "T.H", perk_id = "ygg_hermit_upgrade", max_cap = 1, cost = 50},
            {text = "WOF", perk_id = "ygg_wof_upgrade", max_cap = 1, cost = 50},
            {text = "T.S", perk_id = "ygg_strength_upgrade", max_cap = 1, cost = 20},
        },
        {
            {text = "THM", perk_id = "ygg_hanged_man_upgrade", max_cap = 1, cost = 50},
            {text = "D", perk_id = "ygg_death_upgrade", max_cap = 1, cost = 30},
            {text = "TEMP", perk_id = "ygg_temperance_upgrade", max_cap = 1, cost = 50},
            {text = "T.D", perk_id = "ygg_devil_upgrade", max_cap = 1, cost = 50},
            {text = "TOWER", perk_id = "ygg_tower_upgrade", max_cap = 1, cost = 25},
            {text = "T.ST", perk_id = "ygg_star_upgrade", max_cap = 1, cost = 20},
            {text = "T.MO", perk_id = "ygg_moon_upgrade", max_cap = 1, cost = 20},
            {text = "T.SU", perk_id = "ygg_sun_upgrade", max_cap = 1, cost = 20},
            {text = "T.JU", perk_id = "ygg_judgement_upgrade", max_cap = 1, cost = 75},
            {text = "T.W", perk_id = "ygg_world_upgrade", max_cap = 1, cost = 20},
        },
        {
            {text = "GLASS", perk_id = "ygg_glass_upgrade", max_cap = 1, cost = 30},
            {text = "STONE", perk_id = "ygg_stone_upgrade", max_cap = 1, cost = 30},
            {text = "STEEL", perk_id = "ygg_steel_upgrade", max_cap = 1, cost = 30},
            {text = "GOLD", perk_id = "ygg_gold_upgrade", max_cap = 1, cost = 30},
        },
    },
    ygg_skill_tree_sec4 = {
        {
            {text = "FA", perk_id = "ygg_familiar_upgrade", max_cap = 1, cost = 30},
            {text = "GR", perk_id = "ygg_grim_upgrade", max_cap = 1, cost = 30},
            {text = "IN", perk_id = "ygg_incantation_upgrade", max_cap = 1, cost = 30},
            {text = "TA", perk_id = "ygg_talisman_upgrade", max_cap = 1, cost = 30},
            {text = "AU", perk_id = "ygg_aura_upgrade", max_cap = 1, cost = 60},
            {text = "WR", perk_id = "ygg_wraith_upgrade", max_cap = 1, cost = 50},
            {text = "OU", perk_id = "ygg_ouija_upgrade", max_cap = 1, cost = 50},
            {text = "AN", perk_id = "ygg_ankh_upgrade", max_cap = 1, cost = 70},
            {text = "HEX", perk_id = "ygg_hex_upgrade", max_cap = 1, cost = 70},
        },
        {
            {text = "SPEC1", perk_id = "ygg_spec1_upgrade", max_cap = 1, cost = 50},
            {text = "SPEC2", perk_id = "ygg_spec2_upgrade", max_cap = 1, cost = 80, requirement = {"ygg_spec1_upgrade"}},
            {text = "SPEC3", perk_id = "ygg_spec3_upgrade", max_cap = 1, cost = 50, requirement = {"ygg_spec2_upgrade"}},
            {text = "SPEC4", perk_id = "ygg_spec4_upgrade", max_cap = 1, cost = 30, requirement = {"ygg_spec3_upgrade"}},
        },
    },
    ygg_skill_tree_sec5 = {
        {
            {text = "FOIL", perk_id = "ygg_foil_upgrade", max_cap = 1, cost = 75, item_cost = {{item_id = "half_a_chip", amt = 500}}},
            {text = "HOLO", perk_id = "ygg_holo_upgrade", max_cap = 1, cost = 75, item_cost = {{item_id = "chains_of_eternity"}, {item_id = "soul_engine"}, {item_id = "harmony_joker"}}},
            {text = "POLY", perk_id = "ygg_polychrome_upgrade", max_cap = 1, cost = 75, item_cost = {{item_id = "bismuth", amt = 9}}},
            {text = "NEG", perk_id = "ygg_negative_upgrade", max_cap = 1, cost = 300, item_cost = {{item_id = "alkov_blade"}}},
        },
    },
    ygg_skill_tree_diff = {
        {
            {text = "D1", perk_id = "ygg_diff1", max_cap = 4, ante_scaling = 2, lock_first_round = true, xp_gain = 25, cost = 0},
            {text = "D2", perk_id = "ygg_diff2", max_cap = 3, hand_size = -1, lock_first_round = true, xp_gain = 10, cost = 0},
            {text = "D3", perk_id = "ygg_diff3", max_cap = 1, lock_first_round = true, xp_gain = 20, showdown_ante_decrease = 4, force_showdown_ante_decrease = true, cost = 0},
            {text = "D4", perk_id = "ygg_diff4", max_cap = 1, lock_first_round = true, xp_gain = 30, cost = 0},
            {text = "D4!", perk_id = "ygg_diff4_add", max_cap = 1, lock_first_round = true, xp_gain = 30, cost = 0},
            {text = "D5", perk_id = "ygg_diff5", max_cap = 1, lock_first_round = true, xp_gain = 20, cost = 0},
            {text = "D6", perk_id = "ygg_diff6", max_cap = 1, lock_first_round = true, xp_gain = 20, cost = 0},
            {text = "D7", perk_id = "ygg_diff7", max_cap = 1, lock_first_round = true, xp_gain = 10, cost = 0},
        },
    },
    ygg_skill_tree_sec_sec = {
        {
            {text = "C", perk_id = "ygg_chicot", max_cap = 1, cost = 100^100},
        },
        {
            {text = ":)", perk_id = "ygg_mult_bruh", max_cap = 1.6 * (10 ^ 308), cost = 0, mult = -1},
        },
    },
}

SkillTreeSections = {
    {
        "ygg_skill_tree_diff","ygg_skill_tree_sec2", "ygg_skill_tree_sec3", "ygg_skill_tree_sec4",
    },
    {
        "ygg_skill_tree_sec5", "ygg_skill_tree_sec_sec"
    },
}

DisabledSkills = {
    
}
YggdrasilDefaultButton = true
YggdrasilDebugMode = false
YggdrasilDebugCraftingMode = false

YggdrasilSkillTreeText = {
    text = ""
}

function check_if_section_exist(sec)
    for _,v in ipairs(SkillTreeSections) do
        for _,v2 in ipairs(v) do
            if v2 == sec then return true end
        end
    end
    return false
end

Yggdrasil.give_skill_points = function(n, temp)
    if not temp then
        G.PROFILES[G.SETTINGS.profile].ygg_skill_points = (G.PROFILES[G.SETTINGS.profile].ygg_skill_points or 0) + n
    else
        G.GAME.ygg_skill_points = (G.GAME.ygg_skill_points or 0) + n
    end
end

Yggdrasil.reset_skill = function(key)
    for i,v in pairs(G.PROFILES[G.SETTINGS.profile].skill_perks or {}) do
        if i == key then 
            Yggdrasil.give_skill_points(get_skill_cost(key) * v)
            G.PROFILES[G.SETTINGS.profile].skill_perks[key] = nil 
        end
    end

    for i,v in pairs(G.GAME.skill_perks or {}) do
        if i == key then 
            Yggdrasil.give_skill_points(get_skill_cost(key) * v, true)
            G.GAME.skill_perks[key] = nil 
        end
    end
end

function add_new_section(sec)
    if check_if_section_exist(sec) then return true end
    for i,v in ipairs(SkillTreeSections) do
        if #v < 4 then
            v[#v+1] = sec
            return true
        end
    end

    SkillTreeSections[#SkillTreeSections+1] = {sec}
end

function ret_skill_tree()
    return SkillTreePerks
end

function get_skill_info(key)
    for _,v2 in pairs(ret_skill_tree()) do
        for _,v3 in pairs(v2) do
            for _,v4 in pairs(v3) do
                if v4["perk_id"] == key then
                    return v4
                end
            end
         end
    end

    return {}
end

function get_skill_cost(key)
    for _,v in pairs(SkillTreePerks) do
        for _,v2 in pairs(v) do
            for _,v3 in pairs(v2) do
                if v3["perk_id"] == key then return v3["cost"] end
            end
        end    
    end

    return 0
end

function if_skill_obtained(key)
    if ((G.PROFILES[G.SETTINGS.profile].skill_perks or {})[key] or (G.GAME.skill_perks or {})[key]) and not DisabledSkills[key] then
        return(((G.PROFILES[G.SETTINGS.profile].skill_perks or {})[key] or 0) + ((G.GAME.skill_perks or {})[key] or 0))
    else
        return false
    end
end

function check_if_conflict(key)
    local skill_info = get_skill_info(key)
    if skill_info.exclude_with_skills then
        for _,v in pairs(skill_info.exclude_with_skills) do
            if (((G.PROFILES[G.SETTINGS.profile].skill_perks or {})[v]) or nil) or (((G.GAME.skill_perks or {})[v]) or nil) then
                return true
            end
        end
    end
    return false
end

function if_skill_cost_unlocked(key)
    return (get_skill_info(key).temp_item_upgrade and false) or (not not (G.PROFILES[G.SETTINGS.profile]["YggSkillUnlocked"] or {})[key])
end
--Skill Tree UI

function create_skill_perk_desc(key, perk_info, specific)
    local nodes = {}

    if specific == "reset_skill_tree_button" then
        nodes[#nodes+1] = {}
        local loc_vars = {scale = 1.5}
        localize({type = 'descriptions', key = "ygg_rstb_name", set = 'UIPopUp', nodes = nodes[#nodes], vars = loc_vars.vars, scale = loc_vars.scale, text_colour = G.C.WHITE, shadow = true, float = true})
        nodes[#nodes] = desc_from_rows(nodes[#nodes])
        nodes[#nodes].config.colour = G.C.CLEAR
        nodes[#nodes].config.minh = loc_vars.minh or 0.2
        nodes[#nodes].config.align = "bm"

        nodes[#nodes+1] = {}
        local loc_vars = {scale = 0.925}
        localize({type = 'descriptions', key = "ygg_rstb", set = 'UIPopUp', nodes = nodes[#nodes], vars = loc_vars.vars, scale = loc_vars.scale, text_colour = loc_vars.text_colour, shadow = loc_vars.shadow})
        nodes[#nodes] = desc_from_rows(nodes[#nodes])
        nodes[#nodes].config.colour = loc_vars.background_colour or nodes[#nodes].config.colour
    elseif specific == "ygg_search_option" then
        nodes[#nodes+1] = {}
        local loc_vars = {scale = 1.5}
        localize({type = 'descriptions', key = "ygg_yso_name", set = 'UIPopUp', nodes = nodes[#nodes], vars = loc_vars.vars, scale = loc_vars.scale, text_colour = G.C.WHITE, shadow = true, float = true})
        nodes[#nodes] = desc_from_rows(nodes[#nodes])
        nodes[#nodes].config.colour = G.C.CLEAR
        nodes[#nodes].config.minh = loc_vars.minh or 0.2
        nodes[#nodes].config.align = "bm"

        nodes[#nodes+1] = {}
        local loc_vars = {scale = 0.925}
        localize({type = 'descriptions', key = "ygg_yso", set = 'UIPopUp', nodes = nodes[#nodes], vars = loc_vars.vars, scale = loc_vars.scale, text_colour = loc_vars.text_colour, shadow = loc_vars.shadow})
        nodes[#nodes] = desc_from_rows(nodes[#nodes])
        nodes[#nodes].config.colour = loc_vars.background_colour or nodes[#nodes].config.colour
    elseif specific == "ygg_auto_delete" then
        nodes[#nodes+1] = {}
        local loc_vars = {scale = 1.5}
        localize({type = 'descriptions', key = "ygg_yad_name", set = 'UIPopUp', nodes = nodes[#nodes], vars = loc_vars.vars, scale = loc_vars.scale, text_colour = G.C.WHITE, shadow = true, float = true})
        nodes[#nodes] = desc_from_rows(nodes[#nodes])
        nodes[#nodes].config.colour = G.C.CLEAR
        nodes[#nodes].config.minh = loc_vars.minh or 0.2
        nodes[#nodes].config.align = "bm"

        nodes[#nodes+1] = {}
        local loc_vars = {scale = 0.925}
        localize({type = 'descriptions', key = "ygg_yad", set = 'UIPopUp', nodes = nodes[#nodes], vars = loc_vars.vars, scale = loc_vars.scale, text_colour = loc_vars.text_colour, shadow = loc_vars.shadow})
        nodes[#nodes] = desc_from_rows(nodes[#nodes])
        nodes[#nodes].config.colour = loc_vars.background_colour or nodes[#nodes].config.colour
    else
        nodes[#nodes+1] = {}
        local loc_vars = {scale = 1.5}
        localize({type = 'descriptions', key = key.."_name", set = 'SkillPerks', nodes = nodes[#nodes], vars = loc_vars.vars, scale = loc_vars.scale, text_colour = G.C.WHITE, shadow = true, float = true})
        nodes[#nodes] = desc_from_rows(nodes[#nodes])
        nodes[#nodes].config.colour = G.C.CLEAR
        nodes[#nodes].config.minh = loc_vars.minh or 0.2
        nodes[#nodes].config.align = "bm"

        nodes[#nodes+1] = {}
        local loc_vars = {scale = 0.925, vars = {(((G.PROFILES[G.SETTINGS.profile].skill_perks or {})[string.sub(key,4,#key)] or 0) + ((G.GAME.skill_perks or {})[string.sub(key,4,#key)] or 0))}}
        if perk_info.config and perk_info.config.lcorp_joker_id then
            local selectedKey = key
            for _,v in ipairs(perk_info.config.lcorp_desc_check or {}) do
                if lobc_get_usage_count(perk_info.config.lcorp_joker_id) < v then selectedKey = "undis_"..key break end
            end

            if perk_info.config.lcorp_joker_id == "j_lobc_one_sin" and not G.P_BLINDS["bl_lobc_whitenight"].discovered then
                selectedKey = "undis_"..key
            end
            localize({type = 'descriptions', key = selectedKey, set = 'SkillPerks', nodes = nodes[#nodes], vars = loc_vars.vars, scale = loc_vars.scale, text_colour = loc_vars.text_colour, shadow = loc_vars.shadow})
        else
            localize({type = 'descriptions', key = key, set = 'SkillPerks', nodes = nodes[#nodes], vars = loc_vars.vars, scale = loc_vars.scale, text_colour = loc_vars.text_colour, shadow = loc_vars.shadow})
        end
        nodes[#nodes] = desc_from_rows(nodes[#nodes])
        nodes[#nodes].config.colour = loc_vars.background_colour or nodes[#nodes].config.colour

        if perk_info.lock_first_round then
            nodes[#nodes+1] = {}
            local loc_vars = {scale = 0.925, vars = {perk_info.cost}}
            localize({type = 'descriptions', key = "sp_ygg_lock_first_round", set = 'SkillPerks', nodes = nodes[#nodes], vars = loc_vars.vars, scale = loc_vars.scale, text_colour = loc_vars.text_colour})
            nodes[#nodes] = desc_from_rows(nodes[#nodes])
            nodes[#nodes].config.colour = G.C.WHITE
            nodes[#nodes].config.minh = loc_vars.minh or 0.1
        end

        --we want to change G.localization.descriptions.SkillPerks
        local new_key = "sp_ygg_newcost"
        if not perk_info.item_cost then
            nodes[#nodes+1] = {}
            local loc_vars = {scale = 0.925, vars = {perk_info.cost}}
            localize({type = 'descriptions', key = "sp_ygg_cost", set = 'SkillPerks', nodes = nodes[#nodes], vars = loc_vars.vars, scale = loc_vars.scale, text_colour = loc_vars.text_colour})
            nodes[#nodes] = desc_from_rows(nodes[#nodes])
            nodes[#nodes].config.colour = G.C.WHITE
            nodes[#nodes].config.minh = loc_vars.minh or 0.1
        else
            local raw_desc = localize("ygg_raw_cost")
            local lines = 1
            local first_line_input = false
            local items = 0
            local items_each_line = 3
            local loc_num = 1
            local item_unlocked = if_skill_cost_unlocked(perk_info.perk_id)
            for _,_ in pairs(perk_info.item_cost) do
                items = items + 1
            end
            if items >= 1 then
                lines = lines + 1
                items = items - 1
                first_line_input = true

                lines = lines + math.max(math.ceil(items/items_each_line),0)
            end
            lines = lines - 1

            if first_line_input then
                loc_num = loc_num + 1
                raw_desc = raw_desc..((not item_unlocked and ", {C:red}#") or (item_unlocked and ", {C:green}#"))..loc_num.."#{} #"..(loc_num+1).."#,"
                if lines == 1 then raw_desc = string.sub(raw_desc,1,(#raw_desc-1)) end
            end

            local new_lines = {}
            local calc_items = 0 --i want to check this with uhh items
            if lines > 1 then
                for _ = 1, (lines - 1) do
                    local new_text = ""
                    for i = 1,items_each_line do
                        if calc_items < items then
                            calc_items = calc_items + 1
                            loc_num = loc_num + 2
                            new_text = new_text..((not item_unlocked and "{C:red}#") or (item_unlocked and "{C:green}#"))..loc_num.."#{} #"..(loc_num+1).."#, "
                            if calc_items >= items then
                                new_text = string.sub(new_text, 1, (#new_text - 2))
                                break
                            end 
                            if i == items_each_line then
                                new_text = string.sub(new_text, 1, (#new_text - 1))
                            end
                        end
                    end
                    new_lines[#new_lines+1] = new_text
                end
            end

            local text_table = {
                raw_desc
            }
            for _,v in ipairs(new_lines) do
                text_table[#text_table+1] = v
            end
            G.localization.descriptions.SkillPerks[new_key] = {
                text_parsed = {},
                name = "Placeholder",
                text = text_table
            }

            for _,line in ipairs(G.localization.descriptions.SkillPerks[new_key].text) do
                G.localization.descriptions.SkillPerks[new_key].text_parsed[#G.localization.descriptions.SkillPerks[new_key].text_parsed + 1] = loc_parse_string(line)
            end

            local ret_vars = {perk_info.cost}
            for _,v in ipairs(perk_info.item_cost) do
                ret_vars[#ret_vars+1] = v.amt or 1
                ret_vars[#ret_vars+1] = localize("ygg_"..v.item_id)
            end

            nodes[#nodes+1] = {}
            local loc_vars = {scale = 0.925, vars = ret_vars}
            localize({type = 'descriptions', key = new_key, set = 'SkillPerks', nodes = nodes[#nodes], vars = loc_vars.vars, scale = loc_vars.scale, text_colour = loc_vars.text_colour})
            nodes[#nodes] = desc_from_rows(nodes[#nodes])
            nodes[#nodes].config.colour = G.C.WHITE
            nodes[#nodes].config.minh = loc_vars.minh or 0.1
        end
    end

    return
        {n = G.UIT.ROOT, 
        config = {
            r = 0.1,
            align = "cm", 
            padding = 0.08,
            colour = G.C.L_BLACK,
            outline = 1,
            outline_colour = G.C.GRAY,
        }, 
        --[[nodes = {
            {n=G.UIT.R, config={align = "tm", padding = 0.12, emboss = 0.1, colour = G.C.L_BLACK, r = 0.1}, nodes={
                simple_text_container('ygg_introduction',{colour = G.C.UI.TEXT_LIGHT, scale = 0.3}),
                },
            },
            {n=G.UIT.R, config={align = "tm", padding = 0.12, emboss = 0.1, colour = G.C.L_BLACK, r = 0.1}, nodes={
                simple_text_container('ygg_introduction1',{colour = G.C.UI.TEXT_LIGHT, scale = 0.3}),
                },
            },
        }]]
        nodes = nodes
    }
end

function sp_check_if_unlocked(e)
    if check_if_conflict(e.config.perk_info.perk_id) then return false end

    for _,v in ipairs(e.config.perk_info.requirement or {}) do
        if not (G.PROFILES[G.SETTINGS.profile].skill_perks or {})[v] and not (G.GAME.skill_perks or {})[v] then
            return false
        else
            if ((G.PROFILES[G.SETTINGS.profile].skill_perks or {})[v] or 0) + ((G.GAME.skill_perks or {})[v] or 0) < (get_skill_info(v).max_cap or 1) then
                return false
            end
        end
    end

    if e.config.perk_info.lock_first_round and G.GAME.round ~= 0 then
        return false
    end

    return true
end

local hookTo = UIElement.hover
function UIElement:hover() 
    G.GAME.hovered_ui = self

    if self.config.juice_on_hover and sp_check_if_unlocked(self) then
        self:juice_up(0.3,0.2)    
    end

    if self.config.loc_tooltip then
        self.config.h_popup = create_skill_perk_desc(self.config.loc_tooltip, self.config.perk_info)
        self.config.h_popup_config = {align="tm", offset = {x=0,y=-0.1}, parent = self}
    end

    if self.config and self.config.id and self.config.id == "reset_skill_tree_button" then
        self.config.h_popup = create_skill_perk_desc(nil, nil, self.config.id)
        self.config.h_popup_config = {align="tm", offset = {x=0,y=-0.1}, parent = self}
    end

    self.config.is_hovered = true

    hookTo(self)
end

local hookTo = UIElement.stop_hover
function UIElement:stop_hover() 
    self.config.is_hovered = false
    if G.GAME.hovered_ui == self then G.GAME.hovered_ui = nil end

    hookTo(self)
end

function check_valid_item_cost(perk_info)
    if not perk_info.item_cost or if_skill_cost_unlocked(perk_info.perk_id) then return true end
    local items = {}
    local obtained_items = {}
    for _,v in ipairs(perk_info.item_cost) do
        items[v.item_id] = (items[v.item_id] or 0) + (v.amt or 1)
    end

    for _,v in ipairs(G.PROFILES[G.SETTINGS.profile]["YggInventory"] or {}) do
        if items[v.id] then
            obtained_items[v.id] = (obtained_items[v.id] or 0) + 1
        end
    end

    local valid = true
    for i,v in pairs(items) do
        if obtained_items[i] and obtained_items[i] >= v then
        else
            valid = false
            break
        end
    end

    return valid
end

function calculate_item_cost(perk_info, times)
    if not perk_info.item_cost or if_skill_cost_unlocked(perk_info.perk_id) then return times end
    local items = {}
    local obtained_items = {}
    for _,v in ipairs(perk_info.item_cost) do
        items[v.item_id] = (items[v.item_id] or 0) + (v.amt or 1)
    end

    for _,v in ipairs(G.PROFILES[G.SETTINGS.profile]["YggInventory"] or {}) do
        if items[v.id] then
            obtained_items[v.id] = (obtained_items[v.id] or 0) + 1
        end
    end

    local available_upgrade_times = 0
    local can_upgrade = true
    repeat
        local valid = true
        for i,v in pairs(items) do
            if obtained_items[i] and obtained_items[i] >= v then
                obtained_items[i] = obtained_items[i] - v
            else
                valid = false
                break
            end
        end
        if valid then available_upgrade_times = available_upgrade_times + 1 end
        can_upgrade = valid
    until not can_upgrade

    local ret = available_upgrade_times
    if times then ret = math.min(available_upgrade_times, times) end

    return math.min(available_upgrade_times, (times or math.huge))
end

function purchase_item_cost(perk_info, times)
    if not perk_info.item_cost or if_skill_cost_unlocked(perk_info.perk_id) then return end
    local items = {}
    for _,v in ipairs(perk_info.item_cost) do
        items[v.item_id] = (items[v.item_id] or 0) + (v.amt or 1)
    end
    if not perk_info.temp_item_upgrade then times = 1; if not G.PROFILES[G.SETTINGS.profile]["YggSkillUnlocked"] then G.PROFILES[G.SETTINGS.profile]["YggSkillUnlocked"] = {} end; G.PROFILES[G.SETTINGS.profile]["YggSkillUnlocked"][perk_info.perk_id] = true end

    for _ = 1, (times or 1) do
        for i,v in pairs(items) do
            for _ = 1, v do
                for index,item in ipairs(G.PROFILES[G.SETTINGS.profile]["YggInventory"] or {}) do
                    if item.id == i then table.remove(G.PROFILES[G.SETTINGS.profile]["YggInventory"], index) break end
                end
            end
        end
    end
end

G.FUNCS.purchase_skill_perk = function(e)
    if check_if_conflict(e.config.perk_id) then return end
    if not check_valid_item_cost(e.config.perk_info) then return end
    local current_perk_cap = (((G.PROFILES[G.SETTINGS.profile].skill_perks or {})[e.config.perk_id]) or 0) + (((G.GAME.skill_perks or {})[e.config.perk_id]) or 0)
    if current_perk_cap < e.config.perk_info.max_cap then
        if (G.PROFILES[G.SETTINGS.profile].ygg_skill_points or 0) >= e.config.perk_info.cost then
            local set_max = ((G.GAME.current_switch_skill or "1") == "1" and 1) or ((G.GAME.current_switch_skill or "1") == "2" and 5) or ((G.GAME.current_switch_skill or "1") == "3" and 10) or ((G.GAME.current_switch_skill or "1") == "4" and math.huge)
            local upgraded_times = math.min(math.min(math.floor((G.PROFILES[G.SETTINGS.profile].ygg_skill_points or 0)/e.config.perk_info.cost),set_max),e.config.perk_info.max_cap - current_perk_cap)
            upgraded_times = calculate_item_cost(e.config.perk_info, upgraded_times)
            if upgraded_times > 0 then play_sound('gold_seal', 1.2, 0.4); purchase_item_cost(e.config.perk_info, upgraded_times) end

            if not G.PROFILES[G.SETTINGS.profile].skill_perks then G.PROFILES[G.SETTINGS.profile].skill_perks = {} end
            G.PROFILES[G.SETTINGS.profile].skill_perks[e.config.perk_id] = (G.PROFILES[G.SETTINGS.profile].skill_perks[e.config.perk_id] or 0) + upgraded_times
            G.PROFILES[G.SETTINGS.profile].ygg_skill_points = (G.PROFILES[G.SETTINGS.profile].ygg_skill_points or 0) - (e.config.perk_info.cost * upgraded_times)
            if e.config.perk_info.func and G.FUNCS[e.config.perk_info.func] then
                G.FUNCS[e.config.perk_info.func](e)
            end

            e.config.h_popup = nil
            e.config.h_popup = create_skill_perk_desc(e.config.loc_tooltip, e.config.perk_info)
            e.config.h_popup_config = {align="tm", offset = {x=0,y=-0.1}, parent = e}
            
            if e.config.is_hovered then
                Node.stop_hover(e)
                Node.hover(e) 
            end
            SMODS.calculate_context({ ygg_skill_buy = true, ygg_skill_id = e.config.perk_info.perk_id })
            save_run()
        elseif (G.GAME.ygg_skill_points or 0) >= e.config.perk_info.cost then
            local set_max = ((G.GAME.current_switch_skill or "1") == "1" and 1) or ((G.GAME.current_switch_skill or "1") == "2" and 5) or ((G.GAME.current_switch_skill or "1") == "3" and 10) or ((G.GAME.current_switch_skill or "1") == "4" and math.huge)
            local upgraded_times = math.min(math.min(math.floor((G.GAME.ygg_skill_points or 0)/e.config.perk_info.cost),set_max),e.config.perk_info.max_cap - current_perk_cap)
            upgraded_times = calculate_item_cost(e.config.perk_info, upgraded_times)
            if upgraded_times > 0 then play_sound('gold_seal', 1.2, 0.4); purchase_item_cost(e.config.perk_info, upgraded_times) end

            if not G.GAME.skill_perks then G.GAME.skill_perks = {} end
            G.GAME.skill_perks[e.config.perk_id] = (G.GAME.skill_perks[e.config.perk_id] or 0) + upgraded_times
            G.GAME.ygg_skill_points = (G.GAME.ygg_skill_points or 0) - (e.config.perk_info.cost * upgraded_times)
            if e.config.perk_info.func and G.FUNCS[e.config.perk_info.func] then
                G.FUNCS[e.config.perk_info.func](e)
            end

            e.config.h_popup = nil
            e.config.h_popup = create_skill_perk_desc(e.config.loc_tooltip, e.config.perk_info)
            e.config.h_popup_config = {align="tm", offset = {x=0,y=-0.1}, parent = e}
            if e.config.is_hovered then
                Node.stop_hover(e)
                Node.hover(e) 
            end
            SMODS.calculate_context({ ygg_skill_buy = true, ygg_skill_id = e.config.perk_info.perk_id })
            save_run()
        elseif ((G.PROFILES[G.SETTINGS.profile].ygg_skill_points or 0) + (G.GAME.ygg_skill_points or 0)) >= e.config.perk_info.cost then
            local set_max = ((G.GAME.current_switch_skill or "1") == "1" and 1) or ((G.GAME.current_switch_skill or "1") == "2" and 5) or ((G.GAME.current_switch_skill or "1") == "3" and 10) or ((G.GAME.current_switch_skill or "1") == "4" and math.huge)
            local upgraded_times = math.min(math.min(math.floor(((G.GAME.ygg_skill_points or 0) + (G.PROFILES[G.SETTINGS.profile].ygg_skill_points or 0))/e.config.perk_info.cost),set_max),e.config.perk_info.max_cap - current_perk_cap)
            upgraded_times = calculate_item_cost(e.config.perk_info, upgraded_times)
            if upgraded_times > 0 then play_sound('gold_seal', 1.2, 0.4); purchase_item_cost(e.config.perk_info, upgraded_times) end
            
            if not G.GAME.skill_perks then G.GAME.skill_perks = {} end
            if not G.PROFILES[G.SETTINGS.profile].skill_perks then G.PROFILES[G.SETTINGS.profile].skill_perks = {} end

            local cost_skill_points = upgraded_times * e.config.perk_info.cost
            G.PROFILES[G.SETTINGS.profile].ygg_skill_points = (G.PROFILES[G.SETTINGS.profile].ygg_skill_points or 0) + (G.GAME.ygg_skill_points or 0)
            G.GAME.ygg_skill_points = 0
            G.PROFILES[G.SETTINGS.profile].ygg_skill_points = (G.PROFILES[G.SETTINGS.profile].ygg_skill_points or 0) - cost_skill_points

            G.PROFILES[G.SETTINGS.profile].skill_perks[e.config.perk_id] = (G.PROFILES[G.SETTINGS.profile].skill_perks[e.config.perk_id] or 0) + upgraded_times
            if e.config.perk_info.func and G.FUNCS[e.config.perk_info.func] then
                G.FUNCS[e.config.perk_info.func](e)
            end

            e.config.h_popup = nil
            e.config.h_popup = create_skill_perk_desc(e.config.loc_tooltip, e.config.perk_info)
            e.config.h_popup_config = {align="tm", offset = {x=0,y=-0.1}, parent = e}
            if e.config.is_hovered then
                Node.stop_hover(e)
                Node.hover(e) 
            end
            SMODS.calculate_context({ ygg_skill_buy = true, ygg_skill_id = e.config.perk_info.perk_id })
            save_run()
        end 
    end
end 

G.FUNCS.right_click_skill = function(e)
    if ((G.GAME.round or 0) <= 0) or YggdrasilDebugMode then
        local perk_info = e.config.perk_info
        local key = perk_info.perk_id
        Yggdrasil.reset_skill(key)
    end
end

G.FUNCS.sp_check = function(e)
    if not sp_check_if_unlocked(e) then
        e.config.button = nil
    else
        e.config.button = "purchase_skill_perk"
    end
end

function create_skill_perks(name)
    local ret = nil
    local await = {}
    local all_skill_perks = {}

    --[[ Failed attempt to automatically sort skills to a different line.
    local all_skill_perks = {}
    local perk_before_drop = 12
    local drop_times = math.ceil(#(SkillTreePerks[name] or {})/perk_before_drop)

    local await = {}
    local await2 = {}

    for i = 1,drop_times do
        for i2 = 1*i,12*i do
            local v = (SkillTreePerks[name] or {})[i2]
            if v then
                if not await[i] then await[i] = {} end
                await[i][#await[i]+1] = {n = G.UIT.C, config = {align = "cm", padding = 0.1, perk_id = v.perk_id, minh = 1, minw = 1, maxh = 1, maxw = 1, colour = G.C.L_BLACK, r = 0.2, outline = 1, outline_color = G.C.GREY, hover = true, shadow = true, juice = true, button = "purchase_skill_perk"}, nodes = {
                    {n = G.UIT.T, config = {text = v.text, colour = G.C.WHITE, scale = 0.5, align = "cm"}}
                }}
            end
        end
    end

    for _,v in ipairs(await) do
        await2[#await2+1] = {n = G.UIT.R, config = {align = "tl", padding = 0.05}, nodes = {
            v
        }}
    end

    ret = {n = G.UIT.C, config = {align = "tl", padding = 0.05, colour = G.C.BLACK, minh = 7, minw = 14, r = 0.2}, nodes = {
        await2
    }}
    ]]

    --[[ Simple, but didn't handle multi lines.
    for _,v in ipairs(SkillTreePerks[name] or {}) do
        all_skill_perks[#all_skill_perks+1] = 
        {n = G.UIT.C, config = {align = "cm", padding = 0.1, perk_id = v.perk_id, minh = 1, minw = 1, maxh = 1, maxw = 1, colour = G.C.L_BLACK, r = 0.2, outline = 1, outline_color = G.C.GREY, hover = true, shadow = true, juice = true, button = "purchase_skill_perk"}, nodes = {
            {n = G.UIT.T, config = {text = v.text, colour = G.C.WHITE, scale = 0.5, align = "cm"}}
        }}
    end
    ]]

    for i,v2 in ipairs(SkillTreePerks[name] or {}) do
        if not await[i] then await[i] = {} end
        for _,v in ipairs(v2) do
            if v.perk_id == "BLANK" then
                await[i][#await[i]+1] =         
                {n = G.UIT.C, config = {align = "cm", padding = 0.1, minh = 1, minw = 1, maxh = 1, maxw = 1, colour = G.C.CLEAR, r = 0.2}, nodes = {
                    {n = G.UIT.T, config = {colour = G.C.CLEAR, scale = 0.5, align = "cm"}}
                }}
            else
                await[i][#await[i]+1] =         
                {n = G.UIT.C, config = {align = "cm", padding = 0.1, perk_id = v.perk_id, minh = 1, minw = 1, maxh = 1, maxw = 1, colour = G.C.L_BLACK, r = 0.2, outline = 1, outline_color = G.C.GREY, hover = true, shadow = true, juice = true, button = "purchase_skill_perk", r_button = "right_click_skill", func = "sp_check", loc_tooltip = "sp_"..v.perk_id, perk_info = v, juice_on_hover = true}, nodes = {
                    {n = G.UIT.T, config = {text = v.text, colour = G.C.WHITE, scale = 0.5, align = "cm"}}
                }}
            end
        end
    end

    for _,v in ipairs(await) do
        all_skill_perks[#all_skill_perks+1] = 
        {n = G.UIT.R, config = {align = "tl", padding = 0.1}, nodes = 
            v   
        }
    end

    ret = {
        {n = G.UIT.C, config = {align = "tl", padding = 0.1}, nodes = 
            all_skill_perks
        },
    }

    return ret
end

G.FUNCS.ygg_skill_tree_switch = function(e)
    G.GAME.ygg_chosen_skill_tree_sec = e.config.name
    G.FUNCS.ygg_open_skill_tree()
end

G.FUNCS.ygg_switch_skill_increase = function(e)
    G.E_MANAGER:add_event(Event({ --An event is added here beacuse the button's pressed size won't increase back to normal.
        trigger = "after", 
        delay = 0.1, 
        blockable = false,
        func = function() 
            G.GAME.current_switch_skill = e.config.name
            return true 
        end
    }))
end

G.FUNCS.ygg_switch_skill_check = function(e)
    if e.config.name == (G.GAME.current_switch_skill or "1") then
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    else
        e.config.colour = G.C.RED
        e.config.button = "ygg_switch_skill_increase"
    end
end

G.FUNCS.reset_skill_tree = function(e)
    Yggdrasil.reset_skill_tree()
end

G.FUNCS.check_valid_reset = function(e)
    if ((G.GAME.round or 0) <= 0) or YggdrasilDebugMode then
        e.config.colour = G.C.RED
        e.config.button = "reset_skill_tree"
    else
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    end
end

G.FUNCS.to_next_st_page = function(e)
    G.GAME.current_section_page = (G.GAME.current_section_page or 0) + 1
    if G.GAME.current_section_page > #SkillTreeSections then
        G.GAME.current_section_page = 1
    end
    G.FUNCS.ygg_open_skill_tree()
end

G.FUNCS.to_previous_st_page = function(e)
    G.GAME.current_section_page = (G.GAME.current_section_page or 0) - 1
    if G.GAME.current_section_page <= 0 then
        G.GAME.current_section_page = #SkillTreeSections
    end
    G.FUNCS.ygg_open_skill_tree()
end

G.FUNCS.ygg_update_text_color = function(e)
    local dyna = e.config.object
    local colours_to_use = {
        G.C.WHITE, G.C.FILTER
    }
    local ret_colours = {}
    if dyna then
        if YggdrasilSkillTreeText.text then
            local former_half = #(localize('ygg_skill_tree_text').." ")
            local latter_half = #YggdrasilSkillTreeText.text - former_half
            for _ = 1, former_half do
                ret_colours[#ret_colours+1] = colours_to_use[1]
            end
            for _ = 1, latter_half+1 do
                ret_colours[#ret_colours+1] = colours_to_use[2]
            end
            dyna.colours = ret_colours
        end
    end
end

function run_info_create_skill_tree_UI(args)
    args = args or {}
    
    local skill_tree_sections = args.skill_tree_sections or {
        {
            n = G.UIT.C,
            config = {
                align = "cm",
                minw = 2,
                minh = 0.7,
                padding = 0.1,
                r = 0.1,
                hover = true,
                colour = G.C.RED,
                shadow = true,
                button = "ygg_skill_tree_switch",
                name = "ygg_skill_tree_sec1"
            },
            nodes = {
                {
                    n = G.UIT.R,
                    config = { align = "cm", padding = 0.05 },
                    nodes = {
                        {
                            n = G.UIT.T,
                            config = {
                                text = localize('ygg_skill_tree_sec1'),
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
                minw = 2,
                minh = 0.7,
                padding = 0.1,
                r = 0.1,
                hover = true,
                colour = G.C.RED,
                shadow = true,
                button = "ygg_skill_tree_switch",
                name = "ygg_skill_tree_sec2"
            },
            nodes = {
                {
                    n = G.UIT.R,
                    config = { align = "cm", padding = 0.05 },
                    nodes = {
                        {
                            n = G.UIT.T,
                            config = {
                                text = localize('ygg_skill_tree_sec2'),
                                scale = 0.4,
                                colour = G.C.UI.TEXT_LIGHT
                            }
                        }
                    }
                },
            }
        },
    }

    local skill_perks = create_skill_perks(G.GAME.ygg_chosen_skill_tree_sec or 'ygg_skill_tree_sec1')

    return
      {n=G.UIT.R, config={align = "cm", minh = 1,r = 0.3, padding = 0.07, minw = 1, colour = args.outline_colour or G.C.JOKER_GREY, emboss = 0.1}, nodes={
        {n=G.UIT.C, config={align = "cm", minh = 1,r = 0.2, padding = 0.2, minw = 1, colour = args.colour or G.C.L_BLACK}, nodes={
            {n = G.UIT.R, config = {align = "cm", padding = 0}, nodes = {
                {n=G.UIT.C, config={align = "cm",padding = args.padding or 0.05, minw = args.minw or 7}, nodes= 
                    {
                        {n = G.UIT.R, config = {align = "cm", padding = 0.05}, nodes = --Buttons leading to different sections of the Skill Tree.
                            skill_tree_sections
                        },
                        {n = G.UIT.R, config = {align = "cm", padding = 0.2}, nodes = {
                            {n = G.UIT.O, config = {object = DynaText({scale = 0.75, string = localize('ygg_skill_tree_text').." ("..((G.PROFILES[G.SETTINGS.profile].ygg_skill_points or 0) + (G.GAME.ygg_skill_points or 0)).." SP)", maxw = 9, colours = { G.C.WHITE }, float = true, silent = true, shadow = true})}}
                        }},
                        {n = G.UIT.R, config = {align = "tm", padding = 0.02}, nodes = {
                            {n = G.UIT.O, config = {object = DynaText({scale = 0.4, string = localize(G.GAME.ygg_chosen_skill_tree_sec or 'ygg_skill_tree_sec1'), maxw = 9, colours = { G.C.WHITE }, float = true, silent = true})}}
                        }},
                        {n = G.UIT.R, config = {align = "tl", padding = 0.05, colour = G.C.BLACK, minh = 5, minw = 14, r = 0.2}, nodes = 
                            skill_perks
                        },
                    }
                },
            }},
        }},
      }}
end

function create_skill_tree_UI(args)
    args = args or {}
    local back_func = args.back_func or "exit_overlay_menu"
    
    local skill_tree_sections = args.skill_tree_sections
    if not skill_tree_sections then
        G.GAME.current_section_page = (G.GAME.current_section_page or 1)
        skill_tree_sections = {}
        for _,v in ipairs(SkillTreeSections[G.GAME.current_section_page] or {}) do
            skill_tree_sections[#skill_tree_sections+1] = {
                n = G.UIT.C,
                config = {
                    align = "cm",
                    minw = 2,
                    minh = 0.7,
                    padding = 0.1,
                    r = 0.1,
                    hover = true,
                    colour = G.C.RED,
                    shadow = true,
                    button = "ygg_skill_tree_switch",
                    name = v
                },
                nodes = {
                    {
                        n = G.UIT.R,
                        config = { align = "cm", padding = 0.05 },
                        nodes = {
                            {
                                n = G.UIT.T,
                                config = {
                                    text = localize(v),
                                    scale = 0.4,
                                    colour = G.C.UI.TEXT_LIGHT
                                }
                            }
                        }
                    },
                }
            }
        end
    end

    local switch_buttons = args.switch_buttons or {
        {
            n = G.UIT.C,
            config = {
                align = "cm",
                minw = 0.7,
                minh = 0.6,
                padding = 0.1,
                r = 0.1,
                hover = true,
                colour = G.C.RED,
                shadow = true,
                button = "ygg_switch_skill_increase",
                func = "ygg_switch_skill_check",
                name = "1"
            },
            nodes = {
                {
                    n = G.UIT.R,
                    config = { align = "cm", padding = 0.05 },
                    nodes = {
                        {
                            n = G.UIT.T,
                            config = {
                                text = "+1",
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
                minw = 0.7,
                minh = 0.6,
                padding = 0.1,
                r = 0.1,
                hover = true,
                colour = G.C.RED,
                shadow = true,
                button = "ygg_switch_skill_increase",
                func = "ygg_switch_skill_check",
                name = "2"
            },
            nodes = {
                {
                    n = G.UIT.R,
                    config = { align = "cm", padding = 0.05 },
                    nodes = {
                        {
                            n = G.UIT.T,
                            config = {
                                text = "+5",
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
                minw = 0.7,
                minh = 0.6,
                padding = 0.1,
                r = 0.1,
                hover = true,
                colour = G.C.RED,
                shadow = true,
                button = "ygg_switch_skill_increase",
                func = "ygg_switch_skill_check",
                name = "3"
            },
            nodes = {
                {
                    n = G.UIT.R,
                    config = { align = "cm", padding = 0.05 },
                    nodes = {
                        {
                            n = G.UIT.T,
                            config = {
                                text = "+10",
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
                minw = 0.7,
                minh = 0.6,
                padding = 0.1,
                r = 0.1,
                hover = true,
                colour = G.C.RED,
                shadow = true,
                button = "ygg_switch_skill_increase",
                func = "ygg_switch_skill_check",
                name = "4"
            },
            nodes = {
                {
                    n = G.UIT.R,
                    config = { align = "cm", padding = 0.05 },
                    nodes = {
                        {
                            n = G.UIT.T,
                            config = {
                                text = "MAX",
                                scale = 0.4,
                                colour = G.C.UI.TEXT_LIGHT
                            }
                        }
                    }
                },
            }
        },
    }

    local skill_perks = create_skill_perks(G.GAME.ygg_chosen_skill_tree_sec or 'ygg_skill_tree_diff')

    return {n=G.UIT.ROOT, config = {align = "cm", minw = G.ROOM.T.w*5, minh = G.ROOM.T.h*5,padding = 0.1, r = 0.1, colour = args.bg_colour or {G.C.GREY[1], G.C.GREY[2], G.C.GREY[3],0.7}}, nodes={
      {n=G.UIT.R, config={align = "cm", minh = 1,r = 0.3, padding = 0.07, minw = 1, colour = args.outline_colour or G.C.JOKER_GREY, emboss = 0.1}, nodes={
        {n=G.UIT.C, config={align = "cm", minh = 1,r = 0.2, padding = 0.2, minw = 1, colour = args.colour or G.C.L_BLACK}, nodes={
            {n = G.UIT.R, config = {align = "cm", padding = 0}, nodes = {
                {n=G.UIT.C, config={align = "cm",padding = args.padding or 0.05, minw = args.minw or 7}, nodes= 
                    {
                        {n = G.UIT.R, config = {align = "cm", padding = 0.05}, nodes = --Buttons leading to different sections of the Skill Tree.
                            skill_tree_sections
                        },
                        {n = G.UIT.R, config = {align = "cm", padding = 0.02}, nodes = { --Pages for sections.
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
                                    button = "to_previous_st_page"
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
                                                    text = localize("ygg_page").." "..(G.GAME.current_section_page or 1).."/"..#SkillTreeSections,
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
                                    button = "to_next_st_page"
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
                        {n = G.UIT.R, config = {align = "cm", padding = 0.2}, nodes = {
                            {n = G.UIT.O, config = {func = "ygg_update_text_color", object = DynaText({scale = 0.75,  string = {{ref_table = YggdrasilSkillTreeText, ref_value = "text"}}, maxw = 9, colours = { G.C.WHITE }, float = true, silent = true, shadow = true})}}
                        }},
                        {n = G.UIT.R, config = {align = "tm", padding = 0.02}, nodes = {
                            {n = G.UIT.O, config = {object = DynaText({scale = 0.4, string = localize(G.GAME.ygg_chosen_skill_tree_sec or 'ygg_skill_tree_diff'), maxw = 9, colours = { G.C.WHITE }, float = true, silent = true})}}
                        }},
                        {n = G.UIT.R, config = {align = "tr", padding = 0.02}, nodes = { --Reset skill tree button.
                            {
                                n = G.UIT.C,
                                config = {
                                    align = "cm",
                                    minw = 1.5,
                                    minh = 0.7,
                                    padding = 0.1,
                                    r = 0.1,
                                    hover = true,
                                    colour = G.C.RED,
                                    shadow = true,
                                    id = "reset_skill_tree_button",
                                    button = "reset_skill_tree",
                                    func = "check_valid_reset",
                                },
                                nodes = {
                                    {
                                        n = G.UIT.R,
                                        config = { align = "cm", padding = 0.05 },
                                        nodes = {
                                            {
                                                n = G.UIT.T,
                                                config = {
                                                    text = localize("ygg_reset_skill_tree"),
                                                    scale = 0.4,
                                                    colour = G.C.UI.TEXT_LIGHT
                                                }
                                            }
                                        }
                                    },
                                }
                            },   
                        }},
                        {n = G.UIT.R, config = {align = "tr", padding = 0.02}, nodes =
                            switch_buttons
                        },
                        {n = G.UIT.R, config = {align = "tl", padding = 0.05, colour = G.C.BLACK, minh = 7, minw = 14, r = 0.2}, nodes = 
                            skill_perks
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

function create_skill_tree_menu()   
    G.E_MANAGER:add_event(Event({
        blockable = false,
        func = function()
            G.REFRESH_ALERTS = true
            return true
        end
    }))
  
    local t = create_skill_tree_UI()
    return t
end

G.FUNCS.ygg_open_skill_tree = function()
    G.SETTINGS.paused = true
    
    G.FUNCS.overlay_menu{
        definition = create_skill_tree_menu(),
    }
end

function load_cross_mod_content()
    if next(SMODS.find_mod("aikoyorisshenanigans")) then --Aikoyori Shenanigan's cross-mod, from yours truly
        local new_sec = "ygg_skill_tree_AKYRS"
        if not check_if_section_exist(new_sec) then
            SkillTreePerks[new_sec] = {
                {
                    {text = "AIKO1", perk_id = "ygg_AKYRS_1", max_cap = 1, cost = 10},
                    {text = "AIKO2", perk_id = "ygg_AKYRS_2", max_cap = 1, cost = 30},
                    {text = "AIKO3", perk_id = "ygg_AKYRS_3", max_cap = 1, xmult = 0, cost = 0},
                    {text = "AIKO4", perk_id = "ygg_AKYRS_4", max_cap = 1, cost = 10},
                },
            }
            add_new_section(new_sec) 
        end
    end

    if next(SMODS.find_mod("GRM")) then --Grim's cross-mod, skill tree incarnated
        local new_sec = "ygg_skill_tree_GRM"
        if not check_if_section_exist(new_sec) then
            SkillTreePerks[new_sec] = {
                {
                    {text = "GRM1", perk_id = "ygg_GRM_1", max_cap = 1, cost = 30},
                    {text = "GRM2", perk_id = "ygg_GRM_2", max_cap = 1, cost = 50, requirement = {"ygg_GRM_1"}},
                    {text = "GRM3", perk_id = "ygg_GRM_3", max_cap = 1, cost = 50, requirement = {"ygg_GRM_2"}},
                    {text = "GRM4", perk_id = "ygg_GRM_4", max_cap = 1, cost = 75, requirement = {"ygg_GRM_3"}},
                },
            }
            add_new_section(new_sec) 
        end
    end

    if next(SMODS.find_mod("MoreFluff")) then --MoreFluff's cross-mod, colors
        local new_sec = "ygg_skill_tree_MoreFluff"
        if not check_if_section_exist(new_sec) then
            SkillTreePerks[new_sec] = {
                {
                    {text = "MF1", perk_id = "ygg_MoreFluff_1", max_cap = 1, cost = 30},
                    {text = "MF2", perk_id = "ygg_MoreFluff_2", max_cap = 1, cost = 30},
                    {text = "...?", perk_id = "ygg_MoreFluff_3", max_cap = 1, xp_gain = 100, multMulti = -0.5, chipsMulti = -0.5, lock_first_round = true, cost = 0},
                },
            }
            add_new_section(new_sec) 
        end
    end

    if next(SMODS.find_mod("BALATROSTARRAIL")) then --Balatro: Star Rail, my own mod :3
        local new_sec = "ygg_skill_tree_sec1"
        if not check_if_section_exist(new_sec) then
            add_new_section(new_sec) 
        end
    end

    --[[
    if next(SMODS.find_mod("LobotomyCorp")) then --LCorp's cross-mod, holy.
        local new_sec = "ygg_skill_tree_lcorp"
        if not check_if_section_exist(new_sec) then
            SkillTreePerks[new_sec] = {
                {
                    {text = "S.G", perk_id = "ygg_scorched_girl_upgrade", max_cap = 1, config = {lcorp_joker_id = "j_lobc_scorched_girl", lcorp_desc_check = {2,4}}, cost = 20},
                    {text = "O.S", perk_id = "ygg_one_sin_upgrade", max_cap = 1, config = {lcorp_joker_id = "j_lobc_one_sin", lcorp_desc_check = {2}}, cost = 10},
                    {text = "QOH", perk_id = "ygg_queen_of_hatred_upgrade", max_cap = 1, config = {lcorp_joker_id = "j_lobc_queen_of_hatred", lcorp_desc_check = {2,4,7}}, cost = 35},
                },
            }
            add_new_section(new_sec) 
        end
    end
    ]]
end
--Load the new UI buttons.
local game_start_run_ref = Game.start_run
function Game:start_run(args)
    game_start_run_ref(self, args)

    load_cross_mod_content()

    self.ygg_extra_buttons = YggdrasilDefaultButton and UIBox {
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
                    config = {
                        align = "tm",
                        minw = 2,
                        padding = 0.1,
                        r = 0.1,
                        hover = true,
                        colour = G.C.UI.BACKGROUND_DARK,
                        shadow = true,
                        button = "ygg_open_inventory",
                    },
                    nodes = {
                        {
                            n = G.UIT.R,
                            config = { align = "bcm", padding = 0 },
                            nodes = {
                                {
                                    n = G.UIT.T,
                                    config = {
                                        text = localize('ygg_inventory_text'),
                                        scale = 0.35,
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
                        align = "tm",
                        minw = 2,
                        padding = 0.1,
                        r = 0.1,
                        hover = true,
                        colour = G.C.UI.BACKGROUND_DARK,
                        shadow = true,
                        button = "ygg_open_skill_tree",
                    },
                    nodes = {
                        {
                            n = G.UIT.R,
                            config = { align = "bcm", padding = 0 },
                            nodes = {
                                {
                                    n = G.UIT.T,
                                    config = {
                                        text = localize('ygg_skill_tree_text'),
                                        scale = 0.35,
                                        colour = G.C.UI.TEXT_LIGHT
                                    }
                                }
                            }
                        },
                    }
                },
            }
        },
        config = {
            align = "cardarea_add_to_highlighted_ref",
            offset = { x = 5.5, y = -0.75 },
            major = G.jokers,
            bond = 'Weak'
        }
    }
end

local hookTo = Game.update
function Game:update(dt) --SP Text.
    hookTo(self, dt)
    if YggdrasilSkillTreeText and G.GAME then
        YggdrasilSkillTreeText.text = localize('ygg_skill_tree_text').." ("..((G.PROFILES[G.SETTINGS.profile].ygg_skill_points or 0) + (G.GAME.ygg_skill_points or 0)).." SP)"
    end
end

local right_click_ref = Controller.queue_R_cursor_press
function Controller:queue_R_cursor_press(x, y)
    local ret = right_click_ref(self, x , y)

    if G.GAME.hovered_ui and G.GAME.hovered_ui.config then
        if G.GAME.hovered_ui.config.r_button then
            G.FUNCS[G.GAME.hovered_ui.config.r_button](G.GAME.hovered_ui)
        end
    end

    return ret
end
--G.localization.descriptions.Joker <-- then something something here
