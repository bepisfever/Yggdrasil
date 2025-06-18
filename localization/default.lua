local ret = { --remind me to work on this
    descriptions = {
        Enhanced = {
            m_glass_u = {
                name = "Glass Card",
                text = {
                    "{X:mult,C:white}X#1#{} Mult",
                    "{C:green}#2# in #3#{} chance to",
                    "destroy card, and give a random",
                    "card in hand {X:mult,C:white}X0.2{} Mult",
                    "{s:0.2} ",
                    "{C:inactive}({}{C:dark_edition}Overhauled{}{C:inactive} Effect){}",
                }
            },
            m_stone_u = {
                name = "Stone Card",
                text = {
                    "{C:chips}#1#{} Chips",
                    "Increase {C:chips}Chips{} by {C:chips}+25{}",
                    "when scored, and a random card's",
                    "{C:chips}Chips{} in hand by {C:chips}+10{}",
                    "{s:0.2} ",
                    "{C:inactive}({}{C:dark_edition}Overhauled{}{C:inactive} Effect){}",
                }
            },
            m_steel_u = {
                name = "Steel Card",
                text = {
                    "{X:mult,C:white}X#1#{} Mult while this",
                    "card stays in hand",
                    "Increases {X:mult,C:white}XMult{} by {X:mult,C:white}X0.2{}",
                    "when {C:attention}scored{}",
                    "{s:0.2} ",
                    "{C:inactive}({}{C:dark_edition}Overhauled{}{C:inactive} Effect){}",
                }
            },
            m_gold_u = {
                name = "Gold Card",
                text = {
                    "{C:money}#1#{} if this card is held",
                    "in hand at end of round",
                    "{s:0.15} ",
                    "Increases by {C:money}$1{} for each",
                    "{C:gold}Gold{} card {C:attention}scored{} this round",
                    "{s:0.2} ",
                    "{C:inactive}({}{C:dark_edition}Overhauled{}{C:inactive} Effect){}",
                }
            },
        },
        UIPopUp = {
            ygg_rstb_name = {
                name = "Placeholder",
                text = {
                    "Information"
                },
            },
            ygg_rstb = {
                name = "Placeholder",
                text = {
                    "You can only {C:attention}reset{}",
                    "when {C:attention}Round{} is below",
                    "or equal {C:attention}0{}",
                },
            },
            ygg_yso_name = {
                name = "Placeholder",
                text = {
                    "Information"
                },
            },
            ygg_yso = {
                name = "Placeholder",
                text = {
                    "- (type={C:inactive}x{}) to {C:attention}filter{}",
                    "a specific {C:attention}Item Type{}",
                    "- (rarity={C:inactive}x{}) to {C:attention}filter{}",
                    "a specific {C:attention}Rarity{}",
                    "{s:0.15} ",
                    "{C:inactive}(Location, capitalization",
                    "{C:inactive}and space do not matter)",
                },
            },
            ygg_yad_name = {
                name = "Placeholder",
                text = {
                    "Information"
                },
            },
            ygg_yad = {
                name = "Placeholder",
                text = {
                    "Type in {C:attention}rarity{} names to {C:attention}auto-delete{}",
                    "all obtained {C:attention}items{} with that {C:attention}rarity{}",
                    "Use \",\" to separate different rarities",
                    "{C:inactive}(Example: common,uncommon)",
                    "{s:0.15} ",
                    "{C:inactive}(Location, capitalization",
                    "{C:inactive}and space do not matter)",
                },
            },
        },
        YggItem = {
            ygg_mat_ygg_card_scrap = {
                name = "Card Scrap",
                text = {
                    "{C:inactive}(Rarity: Common){}",
                    "{s:0.15} ",
                    "{C:inactive}Pieces of cards that were torn and",
                    "{C:inactive}thrown in the trash",
                }
            },
            ygg_mat_ygg_half_a_chip = {
                name = "Half a Chip",
                text = {
                    "{C:inactive}(Rarity: Common){}",
                    "{s:0.15} ",
                    "{C:inactive}Legends said that someone asked for 3",
                    "{C:inactive}and a half{} {C:chips}Chips{}{C:inactive}, and the other half",
                    "{C:inactive}remained unused"
                }
            },
            ygg_mat_ygg_broken_spade = {
                name = "Broken Spade",
                text = {
                    "{C:inactive}(Rarity: {}{V:1}Uncommon{}{C:inactive}){}",
                    "{s:0.15} ",
                    "{C:inactive}An arrow head which seems to have",
                    "{C:inactive}been discarded for the more favored",
                    "{C:inactive}suits"
                }
            },
            ygg_mat_ygg_dead_clover = {
                name = "Dead Clover",
                text = {
                    "{C:inactive}(Rarity: {}{V:1}Uncommon{}{C:inactive}){}",
                    "{s:0.15} ",
                    "{C:inactive}Representative of Clubs, it seems to have",
                    "{C:inactive}died after receiving no sunlight since",
                    "{C:inactive}forever"
                }
            },
            ygg_mat_ygg_fractured_diamond = {
                name = "Fractured Diamond",
                text = {
                    "{C:inactive}(Rarity: {}{V:1}Uncommon{}{C:inactive}){}",
                    "{s:0.15} ",
                    "{C:inactive}Once a beautiful diamond, proudfully",
                    "{C:inactive}shining under the sunlight, now dusty",
                    "{C:inactive}and cracked after years of mistreat"
                }
            },
            ygg_mat_ygg_shattered_heart = {
                name = "Shattered Heart",
                text = {
                    "{C:inactive}(Rarity: {}{V:1}Uncommon{}{C:inactive}){}",
                    "{s:0.15} ",
                    "{C:inactive}It is said that someone's heart was",
                    "{C:inactive}broken during Valentine's Day specifically,",
                    "{C:inactive}leading to this",
                    "{C:inactive,s:0.7}(rip)"
                }
            },
            ygg_mat_ygg_harmony_core = {
                name = "Harmony Core",
                text = {
                    "{C:inactive}(Rarity: {}{V:1}Uncommon{}{C:inactive}){}",
                    "{s:0.15} ",
                    "{C:inactive}A battery with perfectly balanced",
                    "{C:inactive}power flow, suitable for stabilizing",
                    "{C:inactive}Relics"
                }
            },
            ygg_mat_ygg_potassium = {
                name = "Potassium",
                text = {
                    "{C:inactive}(Rarity: {}{V:1}Uncommon{}{C:inactive}){}",
                    "{s:0.15} ",
                    "{C:inactive}potassium.",
                    "{C:inactive}You know exactly what this is used",
                    "{C:inactive}for"
                }

            },
            ygg_mat_ygg_misprinted_essence = {
                name = "Misprinted Essence",
                text = {
                    "{C:inactive}(Rarity: {}{V:1}Rare{}{C:inactive}){}",
                    "{s:0.15} ",
                    "{C:inactive}Essences of what was once a Joker,",
                    "{C:inactive}now no more than dust of flickering",
                    "{C:inactive}data",
                }
            },
            ygg_mat_ygg_potassium_overload = {
                name = "Potassium Overload",
                text = {
                    "{C:inactive}(Rarity: {}{V:1}Rare{}{C:inactive}){}",
                    "{s:0.15} ",
                    "{C:inactive}Too much potassium condensed into",
                    "{C:inactive}a small vial. Perhaps it can be used to",
                    "{C:inactive}upgrade a certain banana",
                }
            },
            ygg_mat_ygg_gold_ingot = {
                name = "Gold Ingot",
                text = {
                    "{C:inactive}(Rarity: {}{V:1}Rare{}{C:inactive}){}",
                    "{s:0.15} ",
                    "{C:inactive}an entire bar of gold.",
                }
            },
            ygg_mat_ygg_soul_fragment = {
                name = "Soul Fragment",
                text = {
                    "{C:inactive}(Rarity: {}{V:1}Legendary{}{C:inactive}){}",
                    "{s:0.15} ",
                    "{C:inactive}Shards of what seemed to come from a prison",
                    "{C:inactive}holding spirits with immense power",
                }
            },
            ygg_mat_ygg_bismuth = {
                name = "Bismuth",
                text = {
                    "{C:inactive}(Rarity: {}{V:1}Legendary{}{C:inactive}){}",
                    "{s:0.15} ",
                    "{C:inactive}Rare rainbow-like metal that contains energy",
                    "{C:inactive}enough to power up an entire city for decades",
                }
            },
            ygg_mat_ygg_wither_catalyst = {
                name = "Wither Catalyst",
                text = {
                    "{C:inactive}(Rarity: {}{V:1}Legendary{}{C:inactive}){}",
                    "{s:0.15} ",
                    "{C:inactive}wither skeleton reference",
                }
            },
            ygg_mat_ygg_vial_of_rainbow = {
                name = "Vial of Rainbow",
                text = {
                    "{C:inactive}(Rarity: {}{V:1}Exotic{}{C:inactive}){}",
                    "{s:0.15} ",
                    "{C:inactive}A small vial containing the very essence",
                    "{C:inactive}of rainbows themselves, used to power up",
                    "{C:inactive}Relics that demand harmony of multiple elements"
                }
            },
            ygg_mat_ygg_necron_handle = {
                name = "Necron\'s Handle",
                text = {
                    "{C:inactive}(Rarity: {}{V:1}Exotic{}{C:inactive}){}",
                    "{s:0.15} ",
                    "{C:inactive}The handle to create a tremendously",
                    "{C:inactive}powerful blade, just itself is enough",
                    "{C:inactive}to strike fear in enemies"
                }
            },
            ygg_mat_ygg_necron_scroll = {
                name = "Necron\'s Scroll",
                text = {
                    "{C:inactive}(Rarity: {}{V:1}Exotic{}{C:inactive}){}",
                    "{s:0.15} ",
                    "{C:inactive}The scrolls containing the deepest",
                    "{C:inactive}secrets of the universe",
                }
            },
            ygg_mat_ygg_fixed_joker = {
                name = "Fixed Joker",
                text = {
                    "{C:inactive}(Rarity: Common){}",
                    "{s:0.15} ",
                    "While {C:attention}Equipped{},",
                    "{C:mult}+3{} Mult",
                    "{s:0.15} ",
                    "{C:inactive}A replica of the infamous Jimbo,",
                    "{C:inactive}almost perfect except for the face",
                    "{s:0.15} ",
                    "{C:inactive}(Only one copy can exist)",
                }
            },
            ygg_mat_ygg_fixed_blue_joker = {
                name = "Fixed Blue Joker",
                text = {
                    "{C:inactive}(Rarity: Common){}",
                    "{s:0.15} ",
                    "While {C:attention}Equipped{},",
                    "{C:chips}+20{} Chips",
                    "{s:0.15} ",
                    "{C:inactive}cue the blue da ba de de",
                    "{C:inactive}song or something idk",
                    "{s:0.15} ",
                    "{C:inactive}(Only one copy can exist)",
                }
            },
            ygg_mat_ygg_philosopher_quill = {
                name = "Philosopher's Quill",
                text = {
                    "{C:inactive}(Rarity: Common){}",
                    "{s:0.15} ",
                    "While {C:attention}Equipped{},",
                    "{C:attention}+20%{} XP",
                    "{s:0.15} ",
                    "{C:inactive}The quill often used by philosophers",
                    "{C:inactive}back in the day, just holding it",
                    "{C:inactive}makes you question your life",
                    "{s:0.15} ",
                    "{C:inactive}(Only one copy can exist)",
                }
            },
            ygg_mat_ygg_gros_michel = {
                name = "Gros Michel",
                text = {
                    "{C:inactive}(Rarity: {}{V:1}Uncommon{}{C:inactive}){}",
                    "{s:0.15} ",
                    "While {C:attention}Equipped{},",
                    "{C:mult}+10{} Mult, {C:green}20%{} to {C:attention}disable{}",
                    "at the end of round",
                    "{C:inactive}(Currently: #1#)",
                    "{s:0.15} ",
                    "{C:inactive}A fresh banana out of a tree, its potential",
                    "{C:inactive}has yet to be fully released",
                    "{s:0.15} ",
                    "{C:inactive}(Only one copy can exist)",
                }
            },
            ygg_mat_ygg_harmony_joker = {
                name = "Harmony Joker",
                text = {
                    "{C:inactive}(Rarity: {}{V:1}Uncommon{}{C:inactive}){}",
                    "{s:0.15} ",
                    "While {C:attention}Equipped{},",
                    "{C:chips}+20{} Chips, {C:mult}+5{} Mult",
                    "{s:0.15} ",
                    "{C:inactive}A perfect harmony of {}{C:chips}Blue{}{C:inactive} and",
                    "{C:mult}Red{}{C:inactive}, morphed into a Joker",
                    "{s:0.15} ",
                    "{C:inactive}(Only one copy can exist)",
                }
            },
            ygg_mat_ygg_tome_of_knowledge = {
                name = "Tome of Knowledge",
                text = {
                    "{C:inactive}(Rarity: {}{V:1}Uncommon{}{C:inactive}){}",
                    "{s:0.15} ",
                    "While {C:attention}Equipped{},",
                    "{C:attention}+10%{} XP, increases by",
                    "{C:attention}+5%{} for each {C:attention}100{}",
                    "Levels you have",
                    "{s:0.15} ",
                    "{C:inactive}Taken from a nearby local library,",
                    "{C:inactive}its effectiveness depends on whether",
                    "{C:inactive}you are smart enough or not",
                    "{s:0.15} ",
                    "{C:inactive}(Only one copy can exist)",
                }
            },
            ygg_mat_ygg_digging_shovel = {
                name = "Digging Shovel",
                text = {
                    "{C:inactive}(Rarity: {}{V:1}Uncommon{}{C:inactive}){}",
                    "{s:0.15} ",
                    "While {C:attention}Equipped{},",
                    "{C:green}#1# in 8{} to create a random {C:attention}Joker{}",
                    "when a card is {C:attention}scored{}",
                    "{C:inactive}(Must have room)",
                    "{s:0.15} ",
                    "{C:inactive}More than just a tool for digging,",
                    "{C:inactive}this worn blade has unearthed secrets,",
                    "{C:inactive}treasure, and trouble alike",
                    "{s:0.15} ",
                    "{C:inactive}(Only one copy can exist)",
                }
            },
            ygg_mat_ygg_golden_shovel = {
                name = "Golden Shovel",
                text = {
                    "{C:inactive}(Rarity: {}{V:1}Rare{}{C:inactive}){}",
                    "{s:0.15} ",
                    "While {C:attention}Equipped{},",
                    "{C:green}#1# in 4{} to create a random {C:attention}Joker{}",
                    "when a card is {C:attention}scored{}",
                    "While {C:attention}Unequipped{},",
                    "{C:green}+10%{} Loot Luck",
                    "{C:inactive}(Must have room)",
                    "{s:0.15} ",
                    "{C:inactive}Forged for prestige, not labor,",
                    "{C:inactive}this has become an icon for",
                    "{C:inactive}hard work and dedication",
                    "{s:0.15} ",
                    "{C:inactive}(Only one copy can exist)",
                }
            },
            ygg_mat_ygg_cavendish = {
                name = "Cavendish",
                text = {
                    "{C:inactive}(Rarity: {}{V:1}Rare{}{C:inactive}){}",
                    "{s:0.15} ",
                    "While {C:attention}Equipped{},",
                    "{X:mult,C:white}X1.5{} Mult, {C:green}1%{} to {C:attention}disable{}",
                    "at the end of round",
                    "{C:inactive}(Currently: #1#)",
                    "{s:0.15} ",
                    "{C:inactive}The ultimate form of bananas, all hail",
                    "{C:inactive}Cavendish",
                    "{s:0.15} ",
                    "{C:inactive}(Only one copy can exist)",
                }
            },
            ygg_mat_ygg_misprinted_talisman = {
                name = "Misprinted Talisman",
                text = {
                    "{C:inactive}(Rarity: {}{V:1}Rare{}{C:inactive}){}",
                    "{s:0.15} ",
                    "While {C:attention}Equipped{}, randomly give from",
                    "{X:mult,C:white}X0.9{} Mult to {X:mult,C:white}X1.5{} Mult",
                    "{C:inactive}(Currently: #1#)",
                    "{s:0.15} ",
                    "{C:inactive}mis    // :3   print",
                    "{C:inactive}print...?",
                    "{s:0.15} ",
                    "{C:inactive}(Only one copy can exist)",
                }
            },
            ygg_mat_ygg_enchanted_book = {
                name = "Enchanted Book",
                text = {
                    "{C:inactive}(Rarity: {}{V:1}Rare{}{C:inactive}){}",
                    "{s:0.15} ",
                    "While {C:attention}Equipped{},",
                    "{C:green}+20%{} Loot Luck, {C:attention}+50%{} XP,",
                    "increases by {C:attention}+10%{} for each",
                    "{C:attention}10{} Levels you have",
                    "{s:0.15} ",
                    "{C:inactive}uhh enchanted book, sharpness 5",
                    "{s:0.15} ",
                    "{C:inactive}(Only one copy can exist)",
                }
            },
            ygg_mat_ygg_soul_engine = {
                name = "Soul Engine",
                text = {
                    "{C:inactive}(Rarity: {}{V:1}Legendary{}{C:inactive}){}",
                    "{s:0.15} ",
                    "While {C:attention}Equipped{},",
                    "all {C:attention}Relics{} give {C:mult}X1.5{}",
                    "more {C:mult}+Mult{}",
                    "{s:0.15} ",
                    "{C:inactive}An ancient engine running on the souls of",
                    "{C:inactive}the condemned, boosting the performance",
                    "{C:inactive}of various Relics",
                    "{s:0.15} ",
                    "{C:inactive}(Only one copy can exist)",
                }
            },
            ygg_mat_ygg_chains_of_eternity = {
                name = "Chains of Eternity",
                text = {
                    "{C:inactive}(Rarity: {}{V:1}Legendary{}{C:inactive}){}",
                    "{s:0.15} ",
                    "While {C:attention}Equipped{},",
                    "{C:attention}Eternal{} Jokers give",
                    "{X:mult,C:white}X2{} Mult",
                    "{s:0.15} ",
                    "{C:inactive}Chains used to bound monsters capable",
                    "{C:inactive}of wrecking havoc on the universe,",
                    "{C:inactive}its material is indestructible",
                    "{s:0.15} ",
                    "{C:inactive}(Only one copy can exist)",
                }
            },
            ygg_mat_ygg_astronaut_helmet = {
                name = "Astronaut Helmet",
                text = {
                    "{C:inactive}(Rarity: {}{V:1}Uncommon{}{C:inactive}){}",
                    "{s:0.15} ",
                    "While {C:attention}Equipped{},",
                    "{C:planet}Planet{} cards held give",
                    "{C:mult}+10{} Mult",
                    "{s:0.15} ",
                    "{C:inactive}The first ever jester to step on the moon,",
                    "{C:inactive}Jimeil Armstrong, has left his helmet",
                    "{C:inactive}on there to forever mark the first step of jesters",
                    "{s:0.15} ",
                    "{C:inactive}(Only one copy can exist)",
                }
            },
            ygg_mat_ygg_sharp_spear = {
                name = "Sharp Spear",
                text = {
                    "{C:inactive}(Rarity: {}{V:1}Uncommon{}{C:inactive}){}",
                    "{s:0.15} ",
                    "While {C:attention}Equipped{},",
                    "scored {C:spades}Spade{} cards give",
                    "{C:chips}+15{} Chips",
                    "{s:0.15} ",
                    "{C:inactive}A repaired spear head, once used during",
                    "{C:inactive}the ancient battles of Balala",
                    "{s:0.15} ",
                    "{C:inactive}(Only one copy can exist)",
                }
            },
            ygg_mat_ygg_cupid_bow = {
                name = "Cupid Bow",
                text = {
                    "{C:inactive}(Rarity: {}{V:1}Uncommon{}{C:inactive}){}",
                    "{s:0.15} ",
                    "While {C:attention}Equipped{},",
                    "scored {C:hearts}Hearts{} cards give",
                    "{X:mult,C:white}X1.1{} Mult",
                    "{s:0.15} ",
                    "{C:inactive}Forged from the desires for a faithful love,",
                    "{C:inactive}this bow will bring happiness to dead worlds",
                    "{s:0.15} ",
                    "{C:inactive}(Only one copy can exist)",
                }
            },
            ygg_mat_ygg_diamond_staff = {
                name = "Diamond Staff",
                text = {
                    "{C:inactive}(Rarity: {}{V:1}Uncommon{}{C:inactive}){}",
                    "{s:0.15} ",
                    "While {C:attention}Equipped{},",
                    "scored {C:diamonds}Diamonds{} cards give",
                    "{C:money}+$0.5{}",
                    "{s:0.15} ",
                    "{C:inactive}A staff made out of pure diamond,",
                    "{C:inactive}basking in its former glory once again",
                    "{s:0.15} ",
                    "{C:inactive}(Only one copy can exist)",
                }
            },
            ygg_mat_ygg_clover_talisman = {
                name = "Clover Talisman",
                text = {
                    "{C:inactive}(Rarity: {}{V:1}Uncommon{}{C:inactive}){}",
                    "{s:0.15} ",
                    "While {C:attention}Equipped{},",
                    "scored {C:clubs}Clubs{} cards give",
                    "{C:mult}+2{} Mult",
                    "{s:0.15} ",
                    "{C:inactive}A talisman in shape of a clover,",
                    "{C:inactive}promising to give whoever wears it",
                    "{C:inactive}eternal{} {C:green}Luck{}",
                    "{s:0.15} ",
                    "{C:inactive}(Only one copy can exist)",
                }
            },
            ygg_mat_ygg_four_leaf_clover = {
                name = "Four-Leaf Clover",
                text = {
                    "{C:inactive}(Rarity: {}{V:1}Uncommon{}{C:inactive}){}",
                    "{s:0.15} ",
                    "While {C:attention}Equipped{},",
                    "{X:mult,C:white}X0.8{} Mult, {C:green}+20%{} Loot Luck",
                    "{s:0.15} ",
                    "{C:inactive}The good ol' symbol of luck, though",
                    "{C:inactive}it does take a toll on your",
                    "{C:inactive}power",
                    "{s:0.15} ",
                    "{C:inactive}(Only one copy can exist)",
                }
            },
            ygg_mat_ygg_rainbow_element = {
                name = "Monochrome Element",
                text = {
                    "{C:inactive}(Rarity: {}{V:1}Exotic{}{C:inactive}){}",
                    "{s:0.15} ",
                    "While {C:attention}Equipped{}, scored cards give",
                    "different buffs depending on their {C:attention}suit{}:",
                    "{s:0.15} ",
                    "-{C:hearts}Hearts{}: {X:mult,C:white}X1{} Mult, increases by {X:mult,C:white}X0.1{} Mult",
                    "for each other scored {C:hearts}Hearts{} card",
                    "-{C:spades}Spades{}: {X:chips,C:white}X1{} Chips, increases by {X:chips,C:white}X0.1{} Chips",
                    "for each other scored {C:spades}Spades{} card",
                    "-{C:clubs}Clubs{}: {C:mult}+5{} Mult, increases by {C:mult}+1{} Mult",
                    "for each other scored {C:clubs}Clubs{} card",
                    "-{C:diamonds}Diamonds{}: {C:money}+$1{}, increases by {C:money}+$0.2{}",
                    "for each other scored {C:diamonds}Diamonds{} card",
                    "{s:0.15} ",
                    "{C:inactive}The dead, empty core of an once omniponent tool.",
                    "{C:inactive}Perhaps you will need to power it back up",
                    "{s:0.15} ",
                    "{C:inactive}(Only one copy can exist)",
                }
            },
            ygg_mat_ygg_necron_blade = {
                name = "Necron's Blade",
                text = {
                    "{C:inactive}(Rarity: {}{V:1}Exotic{}{C:inactive}){}",
                    "{s:0.15} ",
                    "While {C:attention}Equipped{}, scored cards",
                    "give {C:dark_edition}+1{} Wither Essence",
                    "When {C:dark_edition}Wither Essence{} reaches {C:dark_edition}10{},",
                    "reduces {C:dark_edition}Wither Essence{} by {C:dark_edition}10{}, and",
                    "give {X:mult,C:white}X1.25{} Mult",
                    "{C:inactive}(Wither Essence: {}{C:dark_edition}#1#{}{C:inactive})",
                    "{s:0.15} ",
                    "{C:inactive}A blade that's yet to be refined,",
                    "{C:inactive}its full potential is locked behind",
                    "{C:inactive}ancient scrolls",
                    "{s:0.15} ",
                    "{C:inactive}(Only one copy can exist)",
                }
            },
            ygg_mat_ygg_hyperion = {
                name = "Hyperion",
                text = {
                    "{C:inactive}(Rarity: {}{V:1}Exotic{}{C:inactive}){}",
                    "{s:0.15} ",
                    "While {C:attention}Equipped{}, scored cards",
                    "give {C:dark_edition}+1{} Wither Essence",
                    "Resets at {C:dark_edition}5{} Wither Essence, and",
                    "each card in hand with {C:attention}rank{} not",
                    "in {C:attention}played hand{} gives {X:mult,C:white}X2{} Mult",
                    "{C:inactive}(Wither Essence: {}{C:dark_edition}#1#{}{C:inactive})",
                    "",
                    "{s:0.15} ",
                    "{C:inactive}holy fuck is this hypixel skyblock",
                    "{C:inactive}reference??????",
                    "{s:0.15} ",
                    "{C:inactive}(Only one copy can exist)",
                }
            },
            ygg_mat_ygg_alkov_blade = {
                name = "Alkov's Blade",
                text = {
                    "{C:inactive}(Rarity: {}{V:1}Exotic{}{C:inactive}){}",
                    "{s:0.15} ",
                    "While {C:attention}Equipped{}, when hand is {C:attention}played{},",
                    "destroy {C:attention}half{} of the {C:attention}cards in hand{}",
                    "and give {X:mult,C:white}X2{} Mult for each",
                    "While {C:attention}Unequipped{}, if {C:attention}full deck{}",
                    "has below {C:attention}25{} cards, {C:green}+50%{} Loot Luck,",
                    "{X:attention,C:white}X1.5{} XP",
                    "{s:0.15} ",
                    "{C:inactive}A blade once held by the infamous devil",
                    "{C:inactive}Alkov. Having slained a thousand dragons in",
                    "{C:inactive}the past, this demonic sword can destroy anything",
                    "{C:inactive}on its path",
                    "{s:0.15} ",
                    "{C:inactive}(Only one copy can exist)",
                }
            },
            ygg_mat_ygg_react_rainbow_element = {
                name = "Rainbow Element",
                text = {
                    "{C:inactive}(Rarity: {}{V:1}Exotic{}{C:inactive}){}",
                    "{s:0.15} ",
                    "While {C:attention}Equipped{}, scored cards give",
                    "different buffs depending on their {C:attention}suit{}:",
                    "{s:0.15} ",
                    "-{C:hearts}Hearts{}: {X:mult,C:white}X2{} Mult, increases by {X:mult,C:white}X0.2{} Mult",
                    "for each other scored {C:hearts}Hearts{} card",
                    "-{C:spades}Spades{}: {X:chips,C:white}X2{} Chips, increases by {X:chips,C:white}X0.2{} Chips",
                    "for each other scored {C:spades}Spades{} card",
                    "-{C:clubs}Clubs{}: {C:mult}+25{} Mult, increases by {C:mult}+5{} Mult",
                    "for each other scored {C:clubs}Clubs{} card",
                    "-{C:diamonds}Diamonds{}: {C:money}+$5{}, increases by {C:money}+$1{}",
                    "for each other scored {C:diamonds}Diamonds{} card",
                    "{s:0.15} ",
                    "If scored card counts as {C:attention}all{} suits, {C:attention}retrigger{} it {C:attention}once{}",
                    "{s:0.15} ",
                    "{C:inactive}The core of all and everything, the staple of",
                    "{C:inactive}the existence of many, now materialized into",
                    "{C:inactive}an orb wieldable for immense strength",
                    "{s:0.15} ",
                    "{C:inactive}(Only one copy can exist)",
                }
            },
        },
        Other = {
            lobc_queen_of_hatred_u_info1 = {
                name = "PERMISSION REJECTED",
                text = {
                    "{C:red}Cannot{} be sold"
                }
            },

            ygg_test = {
                name = "Placeholder",
                text = {
                    "X{C:attention}#1#{} #2#",
                    "{C:white}(Rarity: {}{V:1}#3#{}{C:white})",
                },
            },
            ygg_locked_test = {
                name = "Placeholder",
                text = {
                    "?"
                },
            },
            ygg_test_name = {
                name = "Placeholder",
                text = {
                    "Awaiting Loot"
                },
            },
        },
        Joker = {
            j_lobc_apocalypse_bird_u = {
                name = "Apocalypse Bird",
                text = {
                    "{s:1.5}:3{}"
                }
            },

            dis_j_lobc_scorched_girl_1_u = {
                name = "Scorched Girl",
                text = {
                    "{C:attention}(#2#/2){} ...",
                    "{C:attention}(#3#/?){} ...",
                    "{s:0.2} ",
                    "{C:inactive}({}{C:dark_edition}Overhauled{}{C:inactive} Effect){}",
                }
            },  
            dis_j_lobc_scorched_girl_2_u = {
                name = "Scorched Girl",
                text = {
                    "{C:dark_edition}+1{} Joker Slot",
                    "When {C:attention}Blind{} is selected,",
                    "{C:attention}-#1#%{} Blind Size",
                    "{C:attention}(#3#/?){} ...",
                    "{s:0.2} ",
                    "{C:inactive}({}{C:dark_edition}Overhauled{}{C:inactive} Effect){}",
                }
            },  


            j_lobc_scorched_girl_u = {
                name = "Scorched Girl",
                text = {
                    "{C:dark_edition}+1{} Joker Slot",
                    "When {C:attention}Blind{} is selected,",
                    "{C:attention}-#1#%{} Blind Size",
                    "{s:0.15} {}",
                    "{C:red}Debuffs{} first hand drawn,",
                    "and a random {C:attention}Joker{}",
                    "when entering {C:attention}Blind{}",
                    "{s:0.2} ",
                    "{C:inactive}({}{C:dark_edition}Overhauled{}{C:inactive} Effect){}",
                }
            },  
            dis_j_lobc_one_sin_1_u = {
                name = "One Sin and Hundreds of Good Deeds",
                text = {
                    "{C:attention}(#2#/2){} ...",
                    "{C:attention}(#3#/?){} ...",
                    "{s:0.2} ",
                    "{C:inactive}({}{C:dark_edition}Overhauled{}{C:inactive} Effect){}",
                }
            },  
            dis_j_lobc_one_sin_2_u = {
                name = "One Sin and Hundreds of Good Deeds",
                text = {
                    "Played cards give {C:mult}+#1#{} Mult,",
                    "and permenantly gain {C:mult}+2{} Mult when scored",
                    "{C:attention}(#3#/?){} ...",
                    "{s:0.2} ",
                    "{C:inactive}({}{C:dark_edition}Overhauled{}{C:inactive} Effect){}",
                }
            },  
            j_lobc_one_sin_u = {
                name = "One Sin and Hundreds of Good Deeds",
                text = {
                    "Played cards give {C:mult}+#1#{} Mult,",
                    "and permenantly gain {C:mult}+2{} Mult when scored",
                    "{s:0.15} {}",
                    "Punishment shall begin to",
                    "rain down {C:attention}WhiteNight{}.",
                    "{s:0.2} ",
                    "{C:inactive}({}{C:dark_edition}Overhauled{}{C:inactive} Effect){}",
                }
            },  

            dis_j_lobc_queen_of_hatred_1_u = {
                name = "O-01-04",
                text = {
                    "{C:attention}(#2#/2){} ...",
                    "{C:attention}(#3#/3){} ...",
                    "{C:attention}(#4#/7){} ...",
                    "{s:0.2} ",
                    "{C:inactive}({}{C:dark_edition}Overhauled{}{C:inactive} Effect){}",
                }
            },
            dis_j_lobc_queen_of_hatred_2_u = {
                name = "O-01-04",
                text = {
                    "{X:mult,C:white} X#1# {} Mult",
                    "{C:attention}(#3#/3){} ...",
                    "{C:attention}(#4#/7){} ...",
                    "{s:0.2} ",
                    "{C:inactive}({}{C:dark_edition}Overhauled{}{C:inactive} Effect){}",
                }
            },
            dis_j_lobc_queen_of_hatred_3_u = {
                name = "O-01-04",
                text = {
                    "{X:mult,C:white} X#1# {} Mult",
                    "{s:0.15} {}",
                    "If score is at least {X:mult,C:white} X10 {} {C:attention}Blind Size{},",
                    "this Abnormality enters {C:attention}Hysteria{}",
                    "{C:attention}(#4#/7){} ...",
                    "{s:0.2} ",
                    "{C:inactive}({}{C:dark_edition}Overhauled{}{C:inactive} Effect){}",
                }
            },
            j_lobc_queen_of_hatred_u = {
                name = "The Queen of Hatred",
                text = {
                    "{X:mult,C:white} X#1# {} Mult, increases by {X:mult,C:white} X0.5 {}",
                    "Mult at {C:attention}end of round{} if",
                    "not in {C:attention}Hysteria{}",
                    "{s:0.15} {}",
                    "If score is at least {X:mult,C:white} X10 {} {C:attention}Blind Size{},",
                    "this Abnormality enters {C:attention}Hysteria{}",
                    "{s:0.15} {}",
                    "At {X:mult,C:white} X1 {} Mult,",
                    "this Abnormality {C:attention}breaches{} and {C:red}destroys{}",
                    "a random {C:attention}Joker{}",
                    "{s:0.2} ",
                    "{C:inactive}({}{C:dark_edition}Overhauled{}{C:inactive} Effect){}",
                }
            },  
        },
        Edition = {
            e_foil_u={
                name="Foil",
                text={
                    "{C:chips}+#1#{} Chips, {C:attention}retrigger{} once",
                    "At {C:attention}end of round{}, increases",
                    "edition's {C:chips}Chips{} by {C:chips}X1.2{}",
                    "{s:0.2} ",
                    "{C:inactive}({}{C:dark_edition}Overhauled{}{C:inactive} Effect){}",
                },
            },
            e_holo_u={
                name="Holographic",
                text={
                    "{C:mult}+#1#{} Mult, {C:attention}retrigger{} once",
                    "for each {C:mult}+30{} Mult",
                    "At {C:attention}end of round{}, increases",
                    "edition's {C:mult}Mult{} by {C:mult}+5{}",
                    "{s:0.2} ",
                    "{C:inactive}({}{C:dark_edition}Overhauled{}{C:inactive} Effect){}",
                },
            },
            e_polychrome_u={
                name="Polychrome",
                text={
                    "{X:mult,C:white}X#1#{} Mult",
                    "At {C:attention}end of round{}, fixed",
                    "{C:green}50%{} to convert {C:attention}adjacent{}",
                    "cards to {C:dark_edition}Polychrome{},",
                    "then gains {X:mult,C:white}X0.2{} Mult",
                    "{s:0.2} ",
                    "{C:inactive}({}{C:dark_edition}Overhauled{}{C:inactive} Effect){}",
                },
            },
            e_negative_u={
                name="Negative",
                text={
                    "{C:dark_edition}+#1#{} Joker slot",
                    "{C:attention}Selling{} a {C:dark_edition}Negative{} Joker has fixed",
                    "{C:green}50%{} to increase {C:attention}Joker slot{} by {C:attention}+1{}",
                    "{s:0.2} ",
                    "{C:inactive}({}{C:dark_edition}Overhauled{}{C:inactive} Effect){}",
                },
            },
        },
        Spectral = {
            c_aura={
                name="Aura",
                text={
                    "Add {C:dark_edition}Foil{}, {C:dark_edition}Holographic{},",
                    "or {C:dark_edition}Polychrome{} effect to",
                    "{C:attention}#1#{} selected card in hand",
                },
            },
            c_ankh_u={
                name="Ankh",
                text={
                    "Randomly {C:attention}destroys{} leftmost",
                    "or rightmost Joker, then",
                    "{C:attention}duplicates{} the other",
                    "{s:0.2} ",
                    "{C:inactive}({}{C:dark_edition}Overhauled{}{C:inactive} Effect){}",
                },
            },
            c_hex_u={
                name="Hex",
                text={
                    "{C:attention}Destroys{} selected Joker,",
                    "then adds {C:dark_edition}Polychrome{} to",
                    "a random {C:attention}Joker{}",
                    "{s:0.2} ",
                    "{C:inactive}({}{C:dark_edition}Overhauled{}{C:inactive} Effect){}",
                },
            },
        },
        SkillPerks = {
            sp_ygg_cost = {
                name = "Cost",
                text = {
                    "Cost: {C:red}#1#{} Skill Point",
                }
            },
            sp_ygg_lock_first_round = {
                name = "Cost",
                text = {
                    "Can only be {C:attention}purchased{} on {C:attention}<={}Round {C:attention}0{}",
                }
            },

            sp_ygg_trailblaze = {
                name = "Trailblaze",
                text = {
                    "Increases all Jokers' {C:attention}SPD{} by 1",
                    "{C:inactive}(#1#/25)",
                }
            },
            sp_ygg_trailblaze_name = {
                name = "Trailblaze",
                text = {
                    "Trailblaze",
                }
            },
            sp_ygg_hunt_speed = {
                name = "The Hunt's Swiftness",
                text = {
                    "Increases all Jokers' {C:attention}SPD{} by 1",
                    "{C:inactive}(#1#/25)",
                }
            },
            sp_ygg_hunt_speed_name = {
                name = "The Hunt's Swiftness",
                text = {
                    "The Hunt's Swiftness",
                }
            },
            sp_ygg_lan_blessing = {
                name = "Lan's Blessing",
                text = {
                    "Increases all Jokers' {C:attention}SPD{} by 15",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_lan_blessing_name = {
                name = "The Hunt's Swiftness",
                text = {
                    "Lan's Blessing",
                }
            },
            sp_ygg_calm = {
                name = "Lan's Blessing",
                text = {
                    "Decreases all Jokers' {C:attention}SPD{} by 10",
                    "Increases all Jokers' {C:attention}All-Type Element Multiplier{} by 10%",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_calm_name = {
                name = "The Hunt's Swiftness",
                text = {
                    "Take a Breath",
                }
            },
            sp_ygg_godspeed = {
                name = "Lan's Blessing",
                text = {
                    "Increases all Jokers' {C:attention}SPD{} by 20",
                    "Decreases all Jokers' {C:attention}BEE{} by 5%",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_godspeed_name = {
                name = "The Hunt's Swiftness",
                text = {
                    "Godspeed",
                }
            },
            sp_ygg_destructive = {
                name = "Placeholder",
                text = {
                    "Increases all Jokers' {C:attention}ATK{} by 0.1%",
                    "{C:inactive}(#1#/10)",
                }
            },
            sp_ygg_destructive_name = {
                name = "Placeholder",
                text = {
                    "Destructive Energy",
                }
            },
            sp_ygg_destruction_strength = {
                name = "Placeholder",
                text = {
                    "Increases all Jokers' {C:attention}ATK{} by 0.1%",
                    "{C:inactive}(#1#/10)",
                }
            },
            sp_ygg_destruction_strength_name = {
                name = "Placeholder",
                text = {
                    "Destruction's Strength",
                }
            },
            sp_ygg_nanook_blessing = {
                name = "Placeholder",
                text = {
                    "Increases all Jokers' {C:attention}ATK{} by 20%",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_nanook_blessing_name = {
                name = "Placeholder",
                text = {
                    "Nanook's Blessing",
                }
            },
            sp_ygg_wrath = {
                name = "Placeholder",
                text = {
                    "Increases all Jokers' {C:attention}ATK{} by 20%",
                    "Increases all Jokers' {C:attention}BEE{} by 10%",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_wrath_name = {
                name = "Placeholder",
                text = {
                    "{C:ygg_fire}Wrath{}",
                }
            },
            sp_ygg_titan_wrath = {
                name = "Placeholder",
                text = {
                    "Increases all Jokers' {C:attention}ATK{} by 1%",
                    "Increases all Jokers' {C:attention}BEE{} by 0.5%",
                    "Decreases all Jokers' {C:attention}SPD{} by 1",
                    "{C:inactive}(#1#/10)",
                }
            },
            sp_ygg_titan_wrath_name = {
                name = "Placeholder",
                text = {
                    "Titan's Wrath",
                }
            },

            sp_ygg_special_light = {
                name = "Placeholder",
                text = {
                    "Increases {C:chips}Chips{} of played cards by {C:chips}+5{}",
                    "If played card's {C:chips}Chips{} is more than (or equal) {C:chips}100{},",
                    "increases its {X:mult,C:white}XMult{} by {X:mult,C:white}X1.05{}",
                    "{C:inactive}(#1#/1)",
                    "{s:0.7,C:inactive}(Name Credit: N')",
                }
            },
            sp_ygg_special_light_name = {
                name = "Placeholder",
                text = {
                    "The Whereabouts of Light",
                }
            },

            sp_ygg_mult1 = {
                name = "Mult, please!",
                text = {
                    "{C:mult}+0.5{} Mult",
                    "{C:inactive}(#1#/25)",
                }
            },
            sp_ygg_mult1_name = {
                name = "Mult, please!",
                text = {
                    "Mult, please!",
                }
            },
            sp_ygg_mult2 = {
                name = "Even MORE Mult!",
                text = {
                    "{C:mult}+0.5{} Mult",
                    "{C:inactive}(#1#/25)",
                }
            },
            sp_ygg_mult2_name = {
                name = "Even MORE Mult!",
                text = {
                    "Even MORE Mult!",
                }
            },
            sp_ygg_mult3 = {
                name = "Not Enough Mult",
                text = {
                    "Each {C:mult}+10{} Mult from {C:attention}Skill Tree{} additionally gives",
                    "{X:mult,C:white}X1.005{} Mult",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_mult3_name = {
                name = "Not Enough Mult",
                text = {
                    "Not Enough {C:mult}Mult{}",
                }
            },
            sp_ygg_mult4 = {
                name = "Placeholder",
                text = {
                    "{X:chips,C:white}X0.95{} Chips, {C:mult}+20{} Mult",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_mult4_name = {
                name = "Placeholder",
                text = {
                    "Mult is good, Mult is life",
                }
            },
            sp_ygg_mult5 = {
                name = "Placeholder",
                text = {
                    "{C:mult}+1{} Mult",
                    "{C:inactive}(#1#/20)",
                }
            },
            sp_ygg_mult5_name = {
                name = "Placeholder",
                text = {
                    "Back to the Basics",
                }
            },
            sp_ygg_mult6 = {
                name = "Placeholder",
                text = {
                    "{C:mult}+Mult{} from {C:attention}Skill Tree{} increases by {X:mult,C:white}X1.2{}",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_mult6_name = {
                name = "Placeholder",
                text = {
                    "Reinforced Mult Basics",
                }
            },
            sp_ygg_mult7 = {
                name = "Placeholder",
                text = {
                    "{C:mult}+Mult{} from {C:attention}Skill Tree{} is triggered {C:attention}twice{}",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_mult7_name = {
                name = "Placeholder",
                text = {
                    "Mult Expertise",
                }
            },
            sp_ygg_mult8 = {
                name = "Placeholder",
                text = {
                    "{C:mult}+5{} Mult for each {C:attention}face{} card",
                    "in the deck",
                    "{C:inactive}(#1#/1)",
                    "{s:0.7,C:inactive}(Name Credit: Ice)",
                }
            },
            sp_ygg_mult8_name = {
                name = "Placeholder",
                text = {
                    "{C:mult}Mult{}erior {C:mult}Mult{}ives",
                }
            },
            sp_ygg_mult9 = {
                name = "Placeholder",
                text = {
                    "Increases played cards' {C:mult}Mult{} by {C:mult}+5{}",
                    "{C:inactive}(#1#/1)",
                    "{s:0.7,C:inactive}(Name Credit: Ice)",
                }
            },
            sp_ygg_mult9_name = {
                name = "Placeholder",
                text = {
                    "{C:mult}Mult{}imate",
                }
            },
            sp_ygg_mult10 = {
                name = "Placeholder",
                text = {
                    "Each {C:mult}+100{} Mult from {C:attention}Skill Tree{}",
                    "increases {C:attention}hand size{} by +1",
                    "{C:inactive}(#1#/1)",
                    "{s:0.7,C:inactive}(Name Credit: notmario)",
                }
            },
            sp_ygg_mult10_name = {
                name = "Placeholder",
                text = {
                    "{C:mult}Mult{}drifter",
                }
            },
            sp_ygg_mult11 = {
                name = "Placeholder",
                text = {
                    "When a card is destroyed, increases {C:mult}Mult{}",
                    "by {C:mult}+5{} this run",
                    "{C:inactive}(#1#/1)",
                    "{s:0.7,C:inactive}(Why do we have a Yu-Gi-Oh card here??)",
                    "{s:0.7,C:inactive}(Name Credit: N')",
                }
            },
            sp_ygg_mult11_name = {
                name = "Placeholder",
                text = {
                    "Altergeist {C:mult}Mult{}ifaker",
                }
            },
            sp_ygg_mult12 = {
                name = "Placeholder",
                text = {
                    "During {C:attention}first{} hand of round, {C:mult}+87{} Mult",
                    "if there is less than 19 {C:attention}Jokers{}",
                    "{C:inactive}(#1#/1)",
                    "{s:0.7,C:inactive}(He fits in so seamlessly.)",
                    "{s:0.7,C:inactive}(Name Credit: aikoyori)",
                }
            },
            sp_ygg_mult12_name = {
                name = "Placeholder",
                text = {
                    "markiplier.",
                    "{s:0.7}IS THAT THE BITE OF 87???{}",
                }
            },
            sp_ygg_mult_add1 = {
                name = "Placeholder",
                text = {
                    "During {C:attention}first{} hand of round, {C:mult}+87{} Mult",
                    "if there is less than 19 {C:attention}Jokers{}",
                    "{C:inactive}(#1#/1)",
                    "{s:0.7,C:inactive}(He fits in so seamlessly.)",
                    "{s:0.7,C:inactive}(Name Credit: aikoyori)",
                }
            },
            sp_ygg_mult_add1_name = {
                name = "Placeholder",
                text = {
                    "Vodka {C:mult}Mult{}ini",
                }
            },

            sp_ygg_chips1 = {
                name = "Placeholder",
                text = {
                    "{C:chips}+1{} Chips",
                    "{C:inactive}(#1#/25)",
                    "{s:0.7,C:inactive}(Name Credit: aikoyori)",
                }
            },
            sp_ygg_chips1_name = {
                name = "Placeholder",
                text = {
                    "Chippy Gaming",
                }
            },
            sp_ygg_chips2 = {
                name = "Placeholder",
                text = {
                    "{C:chips}+1{} Chips",
                    "{C:inactive}(#1#/25)",
                    "{s:0.7,C:inactive}(Name Credit: aikoyori)",
                }
            },
            sp_ygg_chips2_name = {
                name = "Placeholder",
                text = {
                    "Chipflake",
                }
            },
            sp_ygg_chips3 = {
                name = "Placeholder",
                text = {
                    "{C:chips}+100{} Chips",
                    "{X:mult,C:white}X0.95{} Mult",
                    "{C:inactive}(#1#/1)",
                    "{s:0.7,C:inactive}(Name Credit: notmario)",
                }
            },
            sp_ygg_chips3_name = {
                name = "Placeholder",
                text = {
                    "Chip's Challenge",
                }
            },
            sp_ygg_chips4 = {
                name = "Placeholder",
                text = {
                    "{C:chips}+50{} Chips",
                    "{X:chips,C:white}X1.02{} Chips",
                    "{C:inactive}(#1#/1)",
                    "{s:0.7,C:inactive}(Name Credit: notmario)",
                }
            },
            sp_ygg_chips4_name = {
                name = "Placeholder",
                text = {
                    "Cheap as Chips",
                }
            },
            sp_ygg_chips5 = {
                name = "Placeholder",
                text = {
                    "{X:chips,C:white}XChips{} from {C:attention}Skill Tree{} is never",
                    "lower than {X:chips,C:white}X1.1{}",
                    "{C:inactive}(#1#/1)",
                    "{s:0.7,C:inactive}(Name Credit: Mini)",
                }
            },
            sp_ygg_chips5_name = {
                name = "Placeholder",
                text = {
                    "{C:chips}Chips{} Ahoy",
                }
            },
            sp_ygg_chips6 = {
                name = "Placeholder",
                text = {
                    "{C:green}75%{} to give {C:chips}+25{} Chips,",
                    "{C:attention}repeats{} until {C:red}failure{}",
                    "{C:inactive}(#1#/1)",
                    "{s:0.7,C:inactive}(Name Credit: aikoyori)",
                }
            },
            sp_ygg_chips6_name = {
                name = "Placeholder",
                text = {
                    "{C:chips}Chip{}py {C:chips}Chip{}py Chapa Chapa",
                }
            },
            sp_ygg_chips7 = {
                name = "Placeholder",
                text = {
                    "{C:chips}+(x/10){} Chips",
                    "{C:inactive}(x = Mult from Skill Tree)",
                    "{C:inactive}(#1#/1)",
                    "{s:0.7,C:inactive}(Name Credit: aikoyori)",
                }
            },
            sp_ygg_chips7_name = {
                name = "Placeholder",
                text = {
                    "{C:chips}Chip{}ment Ready",
                }
            },
            sp_ygg_chips8 = {
                name = "Placeholder",
                text = {
                    "If {C:attention}remaining hands{} is 1, {X:chips,C:white}X1.5{} Chips",
                    "{C:inactive}(#1#/1)",
                    "{s:0.7,C:inactive}(Name Credit: Nxkoo)",
                }
            },
            sp_ygg_chips8_name = {
                name = "Placeholder",
                text = {
                    "Overtime Wage",
                }
            },
            sp_ygg_chips9 = {
                name = "Placeholder",
                text = {
                    "{C:chips}-100{} Chips",
                    "{X:chips,C:white}X1.2{} Chips",
                    "{C:inactive}(#1#/1)",
                    "{s:0.7,C:inactive}(Name Credit: aikoyori)",
                }
            },
            sp_ygg_chips9_name = {
                name = "Placeholder",
                text = {
                    "{C:chips}Chip{}otle",
                }
            },
            sp_ygg_chips10 = {
                name = "Placeholder",
                text = {
                    "{C:green}50%{} to give {X:chips,C:white}X1.5{} Chips",
                    "On {C:red}failure{}, {C:chips}-50{} Chips",
                    "{C:inactive}(#1#/1)",
                    "{s:0.7,C:inactive}(Name Credit: Nxkoo)",
                }
            },
            sp_ygg_chips10_name = {
                name = "Placeholder",
                text = {
                    "All on {C:chips}Chips{}",
                }
            },

            --Fortune Believers
            sp_ygg_hermit_upgrade = {
                name = "Placeholder",
                text = {
                    "{C:attention}Money cap{} of {C:attention}The Hermit{}",
                    "increases by {C:money}$20{}",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_hermit_upgrade_name = {
                name = "Placeholder",
                text = {
                    "The Hermit, but {C:green}better{}",
                }
            },
            sp_ygg_temperance_upgrade = {
                name = "Placeholder",
                text = {
                    "{C:attention}Money cap{} of {C:attention}Temperance{}",
                    "increases by {C:money}$50{}",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_temperance_upgrade_name = {
                name = "Placeholder",
                text = {
                    "Temperance, but {C:green}better{}",
                }
            },
            sp_ygg_wof_upgrade = {
                name = "Placeholder",
                text = {
                    "{C:attention}Base chance{} of {C:attention}Wheel of Fortune{}",
                    "increases to {C:green}1 in 2{}",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_wof_upgrade_name = {
                name = "Placeholder",
                text = {
                    "Wheel of Fortune, but {C:green}better{}",
                }
            },
            sp_ygg_empress_upgrade = {
                name = "Placeholder",
                text = {
                    "{C:attention}The Empress{} permenantly increases",
                    "selected cards' {C:mult}Mult{} by {C:mult}+5{}",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_empress_upgrade_name = {
                name = "Placeholder",
                text = {
                    "The Empress, but {C:green}better{}",
                }
            },
            sp_ygg_hierophant_upgrade = {
                name = "Placeholder",
                text = {
                    "{C:attention}The Heirophant{} permenantly increases",
                    "selected cards' {C:chips}Chips{} by {C:chips}+20{}",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_hierophant_upgrade_name = {
                name = "Placeholder",
                text = {
                    "The Heirophant, but {C:green}better{}",
                }
            },
            sp_ygg_lovers_upgrade = {
                name = "Placeholder",
                text = {
                    "{C:attention}Wild{} cards cannot",
                    "be debuffed {s:0.7,C:inactive}(most of the time)",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_lovers_upgrade_name = {
                name = "Placeholder",
                text = {
                    "The Lovers, but {C:green}better{}",
                }
            },
            sp_ygg_magician_upgrade = {
                name = "Placeholder",
                text = {
                    "{C:attention}Lucky{} cards give",
                    "{C:attention}10%{} of their {C:mult}Mult{}/{C:money}Cash{} if",
                    "their {C:green}probabilities{} fail",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_magician_upgrade_name = {
                name = "Placeholder",
                text = {
                    "The Magician, but {C:green}better{}",
                }
            },
            sp_ygg_priestess_upgrade = {
                name = "Placeholder",
                text = {
                    "{C:attention}The High Priestess{} also",
                    "creates a {C:dark_edition}Negative{} {C:planet}Planet{} card",
                    "of most played {C:attention}poker hand{}",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_priestess_upgrade_name = {
                name = "Placeholder",
                text = {
                    "The High Priestess, but {C:green}better{}",
                }
            },
            sp_ygg_emperor_upgrade = {
                name = "Placeholder",
                text = {
                    "{C:attention}The Emperor{} also",
                    "creates a {C:dark_edition}Negative{} {C:tarot}Tarot{} card",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_emperor_upgrade_name = {
                name = "Placeholder",
                text = {
                    "The Emperor, but {C:green}better{}",
                }
            },
            sp_ygg_fool_upgrade = {
                name = "Placeholder",
                text = {
                    "{C:attention}The Fool{}'s created card",
                    "becomes {C:dark_edition}Negative{}",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_fool_upgrade_name = {
                name = "Placeholder",
                text = {
                    "The Fool, but {C:green}better{}",
                }
            },
            sp_ygg_chariot_upgrade = {
                name = "Placeholder",
                text = {
                    "{C:attention}The Chariot{}'s selection cap",
                    "increases by {C:attention}1{}",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_chariot_upgrade_name = {
                name = "Placeholder",
                text = {
                    "The Chariot, but {C:green}better{}",
                }
            },
            sp_ygg_justice_upgrade = {
                name = "Placeholder",
                text = {
                    "{C:attention}The Justice{}'s selection cap",
                    "increases by {C:attention}1{}",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_justice_upgrade_name = {
                name = "Placeholder",
                text = {
                    "The Justice, but {C:green}better{}",
                }
            },
            sp_ygg_devil_upgrade = {
                name = "Placeholder",
                text = {
                    "{C:attention}The Devil{}'s selection cap",
                    "increases by {C:attention}1{}",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_devil_upgrade_name = {
                name = "Placeholder",
                text = {
                    "The Devil, but {C:green}better{}",
                }
            },
            sp_ygg_death_upgrade = {
                name = "Placeholder",
                text = {
                    "{C:attention}Death{} also converts a {C:attention}random{}",
                    "card into the {C:attention}right{} card",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_death_upgrade_name = {
                name = "Placeholder",
                text = {
                    "Death, but {C:green}better{}",
                }
            },
            sp_ygg_world_upgrade = {
                name = "Placeholder",
                text = {
                    "{C:attention}The World{}'s selection cap",
                    "increases by {C:attention}2{}",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_world_upgrade_name = {
                name = "Placeholder",
                text = {
                    "The World, but {C:green}better{}",
                }
            },
            sp_ygg_sun_upgrade = {
                name = "Placeholder",
                text = {
                    "{C:attention}The Sun{}'s selection cap",
                    "increases by {C:attention}2{}",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_sun_upgrade_name = {
                name = "Placeholder",
                text = {
                    "The Sun, but {C:green}better{}",
                }
            },
            sp_ygg_moon_upgrade = {
                name = "Placeholder",
                text = {
                    "{C:attention}The Moon{}'s selection cap",
                    "increases by {C:attention}2{}",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_moon_upgrade_name = {
                name = "Placeholder",
                text = {
                    "The Moon, but {C:green}better{}",
                }
            },
            sp_ygg_star_upgrade = {
                name = "Placeholder",
                text = {
                    "{C:attention}The Star{}'s selection cap",
                    "increases by {C:attention}2{}",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_star_upgrade_name = {
                name = "Placeholder",
                text = {
                    "The Star, but {C:green}better{}",
                }
            },
            sp_ygg_judgement_upgrade = {
                name = "Placeholder",
                text = {
                    "{C:attention}Judgement{} creates random",
                    "{C:attention}Joker{} cards until Joker slots are full",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_judgement_upgrade_name = {
                name = "Placeholder",
                text = {
                    "Judgement, but {C:green}better{}",
                }
            },
            sp_ygg_strength_upgrade = {
                name = "Placeholder",
                text = {
                    "{C:attention}Strength{}'s selection cap",
                    "increases by {C:attention}3{}",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_strength_upgrade_name = {
                name = "Placeholder",
                text = {
                    "Strength, but {C:green}better{}",
                }
            },
            sp_ygg_hanged_man_upgrade = {
                name = "Placeholder",
                text = {
                    "{C:attention}The Hanged Man{}'s selection cap",
                    "increases by {C:attention}1{}",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_hanged_man_upgrade_name = {
                name = "Placeholder",
                text = {
                    "The Hanged Man, but {C:green}better{}",
                }
            },
            sp_ygg_tower_upgrade = {
                name = "Placeholder",
                text = {
                    "{C:attention}The Tower{}'s selection cap",
                    "increases by {C:attention}4{}",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_tower_upgrade_name = {
                name = "Placeholder",
                text = {
                    "The Tower, but {C:green}better{}",
                }
            },
            sp_ygg_glass_upgrade = {
                name = "Placeholder",
                text = {
                    "{C:attention}Glass Card{}'s effect is {C:dark_edition}Overhauled{}",
                    "{s:0.3} ",
                    "{X:mult,C:white}X2{} Mult",
                    "{C:green}1 in 4{} chance to",
                    "destroy card, and give a random",
                    "card in hand {X:mult,C:white}X0.2{} Mult",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_glass_upgrade_name = {
                name = "Placeholder",
                text = {
                    "Fly, Broken Wings",
                }
            },
            sp_ygg_stone_upgrade = {
                name = "Placeholder",
                text = {
                    "{C:attention}Stone Card{}'s effect is {C:dark_edition}Overhauled{}",
                    "{s:0.3} ",
                    "{C:chips}+50{} Chips",
                    "Increase {C:chips}Chips{} by {C:chips}+25{}",
                    "when scored, and a random card's {C:chips}Chips{}",
                    "in hand by {C:chips}+10{}",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_stone_upgrade_name = {
                name = "Placeholder",
                text = {
                    "Thrown Stones",
                }
            },
            sp_ygg_steel_upgrade = {
                name = "Placeholder",
                text = {
                    "{C:attention}Steel Card{}'s effect is {C:dark_edition}Overhauled{}",
                    "{s:0.3} ",
                    "{X:mult,C:white}X1.5{} Mult while this",
                    "card stays in hand",
                    "Increases {X:mult,C:white}XMult{} by {X:mult,C:white}X0.2{}",
                    "when {C:attention}scored{}",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_steel_upgrade_name = {
                name = "Placeholder",
                text = {
                    "Reinforcing Steel",
                }
            },
            sp_ygg_gold_upgrade = {
                name = "Placeholder",
                text = {
                    "{C:attention}Gold Card{}'s effect is {C:dark_edition}Overhauled{}",
                    "{s:0.3} ",
                    "{C:money}$3{} if this card is held",
                    "in hand at end of round",
                    "{s:0.15} ",
                    "Increases by {C:money}$1{} for each",
                    "{C:gold}Gold{} card {C:attention}scored{} this round",
                    "{C:inactive}(#1#/1)",
                    "{s:0.7,C:inactive}(Idea Credit: Ice)",
                }
            },
            sp_ygg_gold_upgrade_name = {
                name = "Placeholder",
                text = {
                    "Gold Gold Gold",
                }
            },
            sp_ygg_familiar_upgrade = {
                name = "Placeholder",
                text = {
                    "{C:attention}Familiar{}'s created cards have",
                    "random {C:attention}editions{} and {C:attention}seals{}",
                    "{C:inactive}(#1#/1)",
                    "{s:0.7,C:inactive}(Idea Credit: N')",
                }
            },
            sp_ygg_familiar_upgrade_name = {
                name = "Placeholder",
                text = {
                    "Familiar, but {C:green}better{}",
                }
            },
            sp_ygg_grim_upgrade = {
                name = "Placeholder",
                text = {
                    "{C:attention}Grim{}'s created cards have",
                    "random {C:attention}editions{} and {C:attention}seals{}",
                    "{C:inactive}(#1#/1)",
                    "{s:0.7,C:inactive}(Idea Credit: N')",
                }
            },
            sp_ygg_grim_upgrade_name = {
                name = "Placeholder",
                text = {
                    "Grim, but {C:green}better{}",
                }
            },
            sp_ygg_incantation_upgrade = {
                name = "Placeholder",
                text = {
                    "{C:attention}Incantation{}'s created cards have",
                    "random {C:attention}editions{} and {C:attention}seals{}",
                    "{C:inactive}(#1#/1)",
                    "{s:0.7,C:inactive}(Idea Credit: N')",
                }
            },
            sp_ygg_incantation_upgrade_name = {
                name = "Placeholder",
                text = {
                    "Incantation, but {C:green}better{}",
                }
            },
            sp_ygg_talisman_upgrade = {
                name = "Placeholder",
                text = {
                    "{C:attention}Gold Seal{} gives extra {C:money}$1{}",
                    "for each played card that has {C:attention}Gold Seal{}",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_talisman_upgrade_name = {
                name = "Placeholder",
                text = {
                    "Talisman, but {C:green}better{}",
                }
            },
            sp_ygg_aura_upgrade = {
                name = "Placeholder",
                text = {
                    "{C:attention}Aura{}'s selection cap",
                    "increases by {C:attention}2{}",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_aura_upgrade_name = {
                name = "Placeholder",
                text = {
                    "Aura, but {C:green}better{}",
                }
            },
            sp_ygg_wraith_upgrade = {
                name = "Placeholder",
                text = {
                    "{C:attention}Wraith{} only takes {C:attention}half{}",
                    "of your money",
                    "{C:inactive}(Sets money to $0 if in debt){}",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_wraith_upgrade_name = {
                name = "Placeholder",
                text = {
                    "Wraith, but {C:green}better{}",
                }
            },
            sp_ygg_ouija_upgrade = {
                name = "Placeholder",
                text = {
                    "{C:attention}Ouija{} no longer reduces",
                    "{C:attention}Hand Size{}",
                    "{s:0.3} ",
                    "{C:attention}Ouija{} also {C:attention}enhances{}",
                    "all cards in hand",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_ouija_upgrade_name = {
                name = "Placeholder",
                text = {
                    "Ouija, but {C:green}better{}",
                }
            },
            sp_ygg_ankh_upgrade = {
                name = "Placeholder",
                text = {
                    "{C:attention}Ankh{}'s effect is {C:dark_edition}Overhauled{}",
                    "{s:0.3} ",
                    "",
                    "Randomly {C:attention}destroys{} leftmost",
                    "or rightmost Joker, then",
                    "{C:attention}duplicates{} the other",
                    "{s:0.7,C:inactive}(Idea Credit: Victin)",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_ankh_upgrade_name = {
                name = "Placeholder",
                text = {
                    "Ankh, but...?",
                }
            },
            sp_ygg_hex_upgrade = {
                name = "Placeholder",
                text = {
                    "{C:attention}Hex{}'s effect is {C:dark_edition}Overhauled{}",
                    "{s:0.3} ",
                    "",
                    "{C:attention}Destroys{} selected Joker,",
                    "then adds {C:dark_edition}Polychrome{} to",
                    "a random {C:attention}Joker{}",
                    "{s:0.7,C:inactive}(Idea Credit: Velocity)",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_hex_upgrade_name = {
                name = "Placeholder",
                text = {
                    "Hex, but...?",
                }
            },

            sp_ygg_spec1_upgrade = {
                name = "Placeholder",
                text = {
                    "At {C:attention}end of round{}, destroys",
                    "a {C:attention}Tarot{} card held, then creates",
                    "a {C:dark_edition}Spectral{} card",
                    "{C:inactive}(Must have room)",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_spec1_upgrade_name = {
                name = "Placeholder",
                text = {
                    "Catching {C:dark_edition}Ghosts{}",
                }
            },
            sp_ygg_spec2_upgrade = {
                name = "Placeholder",
                text = {
                    "{C:dark_edition}Spectral{} card created",
                    "from {C:attention}Catching Ghosts{}",
                    "is {C:dark_edition}Negative{}",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_spec2_upgrade_name = {
                name = "Placeholder",
                text = {
                    "That's a big {C:dark_edition}Ghost{}!",
                }
            },
            sp_ygg_spec3_upgrade = {
                name = "Placeholder",
                text = {
                    "Using a {C:dark_edition}Spectral{} card",
                    "creates a {C:attention}Tarot{} card",
                    "{C:inactive}(Must have room)",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_spec3_upgrade_name = {
                name = "Placeholder",
                text = {
                    "{C:dark_edition}Ghost{} of Fortune",
                }
            },
            sp_ygg_spec4_upgrade = {
                name = "Placeholder",
                text = {
                    "After using {C:attention}5{}",
                    "{C:planet}Planet{} cards, creates a",
                    "{C:dark_edition}Spectral{} card",
                    "{C:inactive}(Must have room)",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_spec4_upgrade_name = {
                name = "Placeholder",
                text = {
                    "{C:dark_edition}Ghostly{} Planets",
                }
            },
            --All That Glitter
            sp_ygg_foil_upgrade = {
                name = "Placeholder",
                text = {
                    "{C:attention}Foil{}'s effect is {C:dark_edition}Overhauled{}",
                    "{s:0.3} ",
                    "{C:chips}+50{} Chips, {C:attention}retrigger{} once",
                    "At {C:attention}end of round{}, increases",
                    "edition's {C:chips}Chips{} by {C:chips}X1.2{}",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_foil_upgrade_name = {
                name = "Placeholder",
                text = {
                    "Foiled Again",
                }
            },
            sp_ygg_foil_2_upgrade = {
                name = "Placeholder",
                text = {
                    "{C:attention}Foil{}'s effect is {C:dark_edition}Overhauled{}",
                    "{s:0.3} ",
                    "{C:chips}+50{} Chips, {C:attention}retrigger{} once",
                    "At {C:attention}end of round{}, increases",
                    "edition's {C:chips}Chips{} by {C:chips}X1.2{}",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_foil_2_upgrade_name = {
                name = "Placeholder",
                text = {
                    "Foil something",
                }
            },
            sp_ygg_holo_upgrade = {
                name = "Placeholder",
                text = {
                    "{C:attention}Holographic{}'s effect is {C:dark_edition}Overhauled{}",
                    "{s:0.3} ",
                    "{C:mult}+10{} Mult, {C:attention}retrigger{} once",
                    "for each {C:mult}+30{} Mult",
                    "At {C:attention}end of round{}, increases",
                    "edition's {C:mult}Mult{} by {C:mult}+5{}",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_holo_upgrade_name = {
                name = "Placeholder",
                text = {
                    "Hololivin'",
                }
            },
            sp_ygg_polychrome_upgrade = {
                name = "Placeholder",
                text = {
                    "{C:attention}Polychrome{}'s effect is {C:dark_edition}Overhauled{}",
                    "{s:0.3} ",
                    "{X:mult,C:white}X1.5{} Mult",
                    "At {C:attention}end of round{}, fixed",
                    "{C:green}50%{} to convert {C:attention}adjacent{}",
                    "cards to {C:dark_edition}Polychrome{},",
                    "then gains {X:mult,C:white}X0.2{} Mult",
                    "{C:inactive}(#1#/1)",
                    "{s:0.7,C:inactive}(Name Credit: Nxkoo)",
                }
            },
            sp_ygg_polychrome_upgrade_name = {
                name = "Placeholder",
                text = {
                    "Taste the Rainbow",
                }
            },
            sp_ygg_negative_upgrade = {
                name = "Placeholder",
                text = {
                    "{C:attention}Negative{}'s effect is {C:dark_edition}Overhauled{}",
                    "{s:0.3} ",
                    "{C:dark_edition}+1{} Joker slot",
                    "{C:attention}Selling{} a {C:dark_edition}Negative{} Joker has fixed",
                    "{C:green}50%{} to increase edition's {C:attention}Joker slot{}",
                    "by {C:attention}+1{}",
                    "{C:inactive}(#1#/1)",
                    "{s:0.7,C:inactive}(Name Credit: Ice)",
                }
            },
            sp_ygg_negative_upgrade_name = {
                name = "Placeholder",
                text = {
                    "{C:dark_edition}Absolute Zero",
                }
            },
            --Difficulty Skills
            sp_ygg_diff1 = {
                name = "Placeholder",
                text = {
                    "Increases {C:attention}Ante{} needed",
                    "to win by {C:attention}2{}",
                    "{s:0.2} ",
                    "{C:attention}+25%{} XP Gain",
                    "{C:inactive}(#1#/4)",
                    "{s:0.7,C:inactive}(Idea Credit: Nri)",
                }
            },
            sp_ygg_diff1_name = {
                name = "Placeholder",
                text = {
                    "Delayed Victory",
                }
            },
            sp_ygg_diff2 = {
                name = "Placeholder",
                text = {
                    "{C:attention}-1{} hand size",
                    "{s:0.2} ",
                    "{C:attention}+10%{} XP Gain",
                    "{C:inactive}(#1#/3)",
                }
            },
            sp_ygg_diff2_name = {
                name = "Placeholder",
                text = {
                    "Wee Hands",
                }
            },
            sp_ygg_diff3 = {
                name = "Placeholder",
                text = {
                    "Each {C:attention}4{} Antes,",
                    "{C:attention}Boss Blinds{} become",
                    "{C:attention}Showdown Blinds{}",
                    "{s:0.2} ",
                    "{C:attention}+20%{} XP Gain",
                    "{C:inactive}(#1#/1)",
                    "{s:0.7,C:inactive}(Idea Credit: Ice)",
                }
            },
            sp_ygg_diff3_name = {
                name = "Placeholder",
                text = {
                    "The Dragon",
                }
            },
            sp_ygg_diff4 = {
                name = "Placeholder",
                text = {
                    "{C:attention}Big Blinds{} become",
                    "{C:attention}Boss Blinds{}",
                    "{s:0.2} ",
                    "{C:attention}+30%{} XP Gain",
                    "{C:inactive}(#1#/1)",
                    "{s:0.7,C:inactive}(Idea Credit: Ice)",
                }
            },
            sp_ygg_diff4_name = {
                name = "Placeholder",
                text = {
                    "Blind Promotion",
                }
            },
            sp_ygg_diff4_add = {
                name = "Placeholder",
                text = {
                    "{C:attention}Small Blinds{} become",
                    "{C:attention}Boss Blinds{}",
                    "{s:0.2} ",
                    "{C:attention}+30%{} XP Gain",
                    "{C:inactive}(#1#/1)",
                    "{s:0.7,C:inactive}(Idea Credit: Ice)",
                }
            },
            sp_ygg_diff4_add_name = {
                name = "Placeholder",
                text = {
                    "The Rise of The Small",
                }
            },
            sp_ygg_diff5 = {
                name = "Placeholder",
                text = {
                    "{C:attention}Reroll Cost{} only resets",
                    "after each {C:attention}Ante{}",
                    "{s:0.2} ",
                    "{C:attention}+20%{} XP Gain",
                    "{C:inactive}(#1#/1)",
                    "{s:0.7,C:inactive}(Idea Credit: Ice)",
                }
            },
            sp_ygg_diff5_name = {
                name = "Placeholder",
                text = {
                    "Unstable Market",
                }
            },
            sp_ygg_diff6 = {
                name = "Placeholder",
                text = {
                    "Defeating a {C:attention}Blind{}",
                    "only restores {C:attention}2{} hands",
                    "at most",
                    "{s:0.2} ",
                    "{C:attention}+20%{} XP Gain",
                    "{C:inactive}(#1#/1)",
                    "{s:0.7,C:inactive}(Idea Credit: Ice)",
                }
            },
            sp_ygg_diff6_name = {
                name = "Placeholder",
                text = {
                    "Failed Restoration",
                }
            },
            sp_ygg_diff7 = {
                name = "Placeholder",
                text = {
                    "Earns {C:attention}interest{} per",
                    "{C:money}$10{} instead of {C:money}$5{}",
                    "{s:0.2} ",
                    "{C:attention}+10%{} XP Gain",
                    "{C:inactive}(#1#/1)",
                    "{s:0.7,C:inactive}(Idea Credit: Ice)",
                }
            },
            sp_ygg_diff7_name = {
                name = "Placeholder",
                text = {
                    "Unknown Fees",
                }
            },

            --Shenanigans
            sp_ygg_chicot = {
                name = "Chicot",
                text = {
                    "Disables effect of every {C:attention}Boss Blind",
                    "{C:inactive}(#1#/1)",
                    "{s:0.7,C:inactive}(Might crash your game 99% of the time instead)",
                }
            },
            sp_ygg_chicot_name = {
                name = "Not Enough Mult",
                text = {
                    "Chicot",
                }
            },
            sp_ygg_mult_bruh = {
                name = "Chicot",
                text = {
                    "{C:mult}-1{} Mult",
                    "{C:inactive}(#1#/1.6e308)",
                    "{s:0.7,C:inactive}(Name Credit: Myst)",
                }
            },
            sp_ygg_mult_bruh_name = {
                name = "Not Enough Mult",
                text = {
                    "De{C:mult}mult{}ed",
                }
            },

            --Aikoyori's Shenanigans
            sp_ygg_AKYRS_1 = {
                name = "Placeholder",
                text = {
                    "Each {C:attention}character{} in",
                    "all {C:attention}Jokers' descriptions{}",
                    "gives {C:chips}+0.5{} Chips",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_AKYRS_1_name = {
                name = "Placeholder",
                text = {
                    "tl;dr nightmare.",
                }
            },
            sp_ygg_AKYRS_2 = {
                name = "Placeholder",
                text = {
                    "Scored {C:attention}Ys{} give",
                    "{X:mult,C:white}X2.99999999999999998{}",
                    "Mult",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_AKYRS_2_name = {
                name = "Placeholder",
                text = {
                    "\"why\"",
                }
            },
            sp_ygg_AKYRS_3 = {
                name = "Placeholder",
                text = {
                    "{X:mult,C:white}X1{} Mult",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_AKYRS_3_name = {
                name = "Placeholder",
                text = {
                    "\"i am sorry\"",
                }
            },
            sp_ygg_AKYRS_4 = {
                name = "Placeholder",
                text = {
                    "{X:mult,C:white}X1{} Mult,",
                    "increases by {X:mult,C:white}X0.5{}",
                    "for each {C:attention}FPS{} below {C:attention}40{}",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_AKYRS_4_name = {
                name = "Placeholder",
                text = {
                    "\"i seriously dont know why the game is laggy\"",
                }
            },
            --Grim
            sp_ygg_GRM_1 = {
                name = "Placeholder",
                text = {
                    "All sources of {C:purple}XP{}",
                    "in {C:attention}Grim{} also give",
                    "{C:purple}+20{} XP",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_GRM_1_name = {
                name = "Placeholder",
                text = {
                    "Knowledge of an Another World",
                }
            },
            sp_ygg_GRM_2 = {
                name = "Placeholder",
                text = {
                    "{C:attention}Grim{} receives {C:purple}XP{}",
                    "equal to {C:attention}10%{} of",
                    "{C:attention}XP{} earned in this",
                    "{C:attention}Skill Tree{}",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_GRM_2_name = {
                name = "Placeholder",
                text = {
                    "Expertise of Both Worlds",
                }
            },
            sp_ygg_GRM_3 = {
                name = "Placeholder",
                text = {
                    "{C:attention}Upgrade 1{} gives",
                    "{C:purple}+50{} XP instead,",
                    "scales with {C:attention}XP Gain{}",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_GRM_3_name = {
                name = "Placeholder",
                text = {
                    "{C:purple}XP{}, XP, and {C:attention}XP{}",
                }
            },
            sp_ygg_GRM_4 = {
                name = "Placeholder",
                text = {
                    "{C:purple}XP{} gained from {C:attention}Grim",
                    "has a fixed {C:green}75%{} to increase",
                    "{C:attention}XP{} by {C:attention}+25{}",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_GRM_4_name = {
                name = "Placeholder",
                text = {
                    "Wormhole {C:attention}X{}{C:purple}P{}",
                }
            },
            --Lobcorp
            undis_sp_ygg_scorched_girl_upgrade = {
                name = "Placeholder",
                text = {
                    "{C:attention}Scorched Girl{}'s effect is",
                    "{C:dark_edition}Overhauled{}",
                    "{s:0.3} ",
                    "{C:red,s:1.5}[REDACTED]",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_scorched_girl_upgrade = {
                name = "Placeholder",
                text = {
                    "{C:attention}Scorched Girl{}'s effect is",
                    "{C:dark_edition}Overhauled{}",
                    "{s:0.3} ",
                    "{C:dark_edition}+1{} Joker Slot",
                    "When {C:attention}Blind{} is selected,",
                    "{C:attention}-30%{} Blind Size",
                    "{s:0.15} {}",
                    "{C:red}Debuffs{} first hand drawn,",
                    "and a random {C:attention}Joker{}",
                    "when entering {C:attention}Blind{}",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_scorched_girl_upgrade_name = {
                name = "Placeholder",
                text = {
                    "{s:0.8}How To Suppress 101{}",
                    "Scorched Girl",
                }
            },
            undis_sp_ygg_one_sin_upgrade = {
                name = "Placeholder",
                text = {
                    "{C:attention}One Sin and Hundreds of Good Deeds{}'s effect is",
                    "{C:dark_edition}Overhauled{}",
                    "{s:0.3} ",
                    "{C:red,s:1.5}[REDACTED]",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_one_sin_upgrade = {
                name = "Placeholder",
                text = {
                    "{C:attention}One Sin and Hundreds of Good Deeds{}'s effect is",
                    "{C:dark_edition}Overhauled{}",
                    "{s:0.3} ",
                    "Played cards give {C:mult}+3{} Mult,",
                    "and permenantly gain {C:mult}+2{} Mult when scored",
                    "{s:0.15} {}",
                    "Punishment shall begin to",
                    "rain down {C:attention}WhiteNight{}.",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_one_sin_upgrade_name = {
                name = "Placeholder",
                text = {
                    "{s:0.8}How To Suppress 101{}",
                    "One Sin and Hundreds of Good Deeds",
                }
            },
            undis_sp_ygg_queen_of_hatred_upgrade = {
                name = "Placeholder",
                text = {
                    "{C:attention}The Queen of Hatred{}'s effect is",
                    "{C:dark_edition}Overhauled{}",
                    "{s:0.3} ",
                    "{C:red,s:1.5}[REDACTED]",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_queen_of_hatred_upgrade = {
                name = "Placeholder",
                text = {
                    "{C:attention}The Queen of Hatred{}'s effect is",
                    "{C:dark_edition}Overhauled{}",
                    "{s:0.3} ",
                    "{X:mult,C:white} X3 {} Mult, increases by {X:mult,C:white} X0.5 {}",
                    "Mult at {C:attention}end of round{} if",
                    "not in {C:attention}Hysteria{}",
                    "{s:0.15} {}",
                    "If score is at least {X:mult,C:white} X10 {} {C:attention}Blind Size{},",
                    "this Abnormality enters {C:attention}Hysteria{}",
                    "{s:0.15} {}",
                    "At {X:mult,C:white} X1 {} Mult,",
                    "this Abnormality {C:attention}breaches{} and {C:red}destroys{}",
                    "a random {C:attention}Joker{}",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_queen_of_hatred_upgrade_name = {
                name = "Placeholder",
                text = {
                    "{s:0.8}How To Suppress 101{}",
                    "The Queen of Hatred",
                }
            },
            --MoreFluff
            sp_ygg_MoreFluff_1 = {
                name = "Placeholder",
                text = {
                    "{C:colourcard}Colour{} cards' {C:attention}round{}",
                    "increases by {C:attention}1{} for each {C:colourcard}Colour",
                    "card held except itself at {C:attention}end of round{}",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_MoreFluff_1_name = {
                name = "Placeholder",
                text = {
                    "Goethe's {C:colourcard}Colour{} Wheel",
                }
            },
            sp_ygg_MoreFluff_2 = {
                name = "Placeholder",
                text = {
                    "Each {C:attention}unique{} {C:colourcard}Colour{} card held",
                    "increases {C:attention}hand size{} by {C:attention}1{}",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_MoreFluff_2_name = {
                name = "Placeholder",
                text = {
                    "{C:colourcard}Rainbow{} Road",
                }
            },
            sp_ygg_MoreFluff_3 = {
                name = "Placeholder",
                text = {
                    "All {C:attention}Boss Blinds{}",
                    "become {C:attention}DX Boss Blinds{}",
                    "{s:0.2} ",
                    "Reduces {C:mult}Mult{} and {C:chips}Chips{}",
                    "from {C:attention}Skill Tree{} by {C:red}50%{}",
                    "{s:0.2} ",
                    "{C:attention}+100%{} XP Gain",
                    "{C:inactive}(#1#/1)",
                }
            },
            sp_ygg_MoreFluff_3_name = {
                name = "Placeholder",
                text = {
                    "{C:inactive}Pale{} Forest",
                    "{s:0.8,C:red}good luck.{}",
                }
            },
        },
        dictionary = {
            ygg_xp_scale_desc = {
                name = "",
                text = {
                    "{s:inactive}If enabled, XP requirement of levels will increase.{}",
                    "{s:inactive}Automatically enabled when Cryptid is installed.{}",
                },
            },
        }
    },
    misc={
        dictionary = {
            ygg_skill_tree_text = "Skill Tree",
            ygg_inventory_text = "Inventory",
            ygg_equip_area_text = "Equip Area",
            ygg_crafting_area_text = "Crafting Area",
            ygg_delete_area_text = "Delete Area",
            ygg_recipe_area_text = "Recipes Area",

            ygg_delete_text = "Delete",
            ygg_craft_text = "Craft",
            ygg_recipes_text = "Recipes",
            ygg_equip_text = "Equip",

            ygg_skill_tree_sec1 = "Need for Stats", --Balatro: Star Rail
            ygg_skill_tree_sec2 = "I'm Multin' it",
            ygg_skill_tree_sec3 = "Fortune Believers",
            ygg_skill_tree_sec4 = "Jimbobusters",
            ygg_skill_tree_sec5 = "All That Glitter", --credit to Aikoyori for this name. why tf they keep coming up with cool names though
            ygg_skill_tree_diff = "ULTRALATRO",

            ygg_skill_tree_sec_sec = "Shenaniganing", --:3
            ygg_skill_tree_AKYRS = "aikoyori.", --Aikoyori's Shenanigans
            ygg_skill_tree_GRM = "Grafting", --Grim
            ygg_skill_tree_MoreFluff = "Double Rainbow", --MoreFluff
            ygg_skill_tree_lcorp = "Mirror Dungeon", --Lobotomy Corporation

            ygg_reset_skill_tree = "RESET SKILL TREE",
            ygg_page = "PAGE",

            ygg_raw_cost = "Cost: {C:red}#1#{} Skill Point",

            --Material Stuffs
            k_YggMaterial_text = "Material",
            k_YggRelic_text = "Relic",

            ygg_sort_rarity = "Sort by Rarity",
            ygg_sort_date = "Sort by Date",

            ygg_common = "Common",
            ygg_uncommon = "Uncommon",
            ygg_rare = "Rare",
            ygg_legendary = "Legendary",
            ygg_exotic = "Exotic",

            ygg_craft_guide = "DRAG TO INVENTORY TO CRAFT",
            ygg_equip_guide = "DRAG TO AREA TO EQUIP",

            --Others
            ygg_active = "Active",
            ygg_inactive = "Inactive",

            ygg_disabled = "Disabled!",
            ygg_enabled = "Enabled!",
            ygg_upgraded = "Upgraded!",
            ygg_dug = "Dug!",

            ygg_clear = "Clear",

            ygg_wither_impact = "Wither Impact!",
            --Credits
            ygg_credit1 = "Art by Tachonky (@mr.cr33ps)",
            ygg_credit2 = "Art by Th30ne (@th30ne)",
            --Config
            ygg_xp_scale_enable = "XP Scale",
        },
    },
}

for key, stuff in pairs(ret.descriptions.YggItem) do
    local cut_off_key = string.sub(key,9,#key)
    if not ret.misc.dictionary[cut_off_key] then
        ret.misc.dictionary[cut_off_key] = stuff.name
    end
end

return ret