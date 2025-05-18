--Be alerted: This is my FIRST mod. I actually planned this to be more of a practice project, but it seems everyone is now expecting for it to be released so here comes nothing.

Yggdrasil = SMODS.current_mod
SMODS.current_mod.optional_features = { retrigger_joker = true, cardareas = {deck = true}}

local allFolders = {
    "none", "code"
} --Detects in order, going from left to right.

local allFiles = {
    ["none"] = {},
    ["code"] = {"bepismodded", "bepis_shenanigans", "keybinds", "level", "skill_tree_ui", "loot_system", "materials", "jokers"},
} --Same goes with this.

to_big = to_big or function(x) return x end

--I truly love JoyousSpring
local hookTo = SMODS.calculate_context
function SMODS.calculate_context(context, return_table)
    -- i hope this prevents the crashes :sob:
    if G.ygg_sp_area and not G.ygg_sp_area.cards then return {} end
    Yggdrasil.calculate_context(context)
    return hookTo(context, return_table)
end

local hookTo = end_round
function end_round()
    SMODS.calculate_context({ygg_edition_upgrade = true})
    local ret = hookTo()
    return ret
end

Yggdrasil.calculate_context = function(context)
    -- Edition upgrades
    if context.ygg_edition_upgrade then
        --print("hii wave wave :3 im going insane")
    end
end

G.C.ygg_colors = {
    ygg_red = HEX("FF0000")
}

G.C.ygg_red = HEX("FF0000")
G.C.ygg_common = HEX("FFFFFF")
G.C.ygg_uncommon = HEX("4BC292")
G.C.ygg_rare = HEX('FE5F55')
G.C.ygg_legendary = {0,0,0,1}

--[[SMODS.Gradient({ keeping blud hostage until i need to add gradients :3
    key = "PENDULUM_NORMAL",
    colours = { G.C.JOY.SPELL, G.C.JOY.NORMAL },
    cycle = 7.5,
})]]

local loc_colour_ref = loc_colour
function loc_colour(_c, _default)
    if not G.ARGS.LOC_COLOURS then
        loc_colour_ref()
    end

    for i,v in pairs(G.C.ygg_colors) do
        G.ARGS.LOC_COLOURS[i] = v
    end

    return loc_colour_ref(_c, _default)
end

for i = 1,#allFolders do
    if allFolders[i] == "none" then
        for i2 = 1,#allFiles[allFolders[i]] do
            assert(SMODS.load_file(allFiles[allFolders[i]][i2]..'.lua'))()
        end
    else
        for i2 = 1,#allFiles[allFolders[i]] do
            assert(SMODS.load_file(allFolders[i].."/"..allFiles[allFolders[i]][i2]..'.lua'))()
        end
    end
end