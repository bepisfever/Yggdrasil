--Be alerted: This is my FIRST mod. I actually planned this to be more of a practice project, but it seems everyone is now expecting for it to be released so here comes nothing.

Yggdrasil = SMODS.current_mod
SMODS.current_mod.optional_features = { retrigger_joker = true, cardareas = {deck = true}}

local allFolders = {
    "none", "code"
} --Detects in order, going from left to right.

local allFiles = {
    ["none"] = {},
    ["code"] = {"bepismodded", "bepis_shenanigans", "keybinds", "level", "skill_tree_ui", "jokers"},
} --Same goes with this.

to_big = to_big or function(x) return x end

--I truly love JoyousSpring (part 1)
local hookTo = SMODS.calculate_context
function SMODS.calculate_context(context, return_table)
    -- i hope this prevents the crashes :sob:
    if G.ygg_sp_area and not G.ygg_sp_area.cards then return {} end
    return hookTo(context, return_table)
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
