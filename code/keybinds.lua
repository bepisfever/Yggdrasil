SMODS.Keybind{
    key_pressed = "h", 
    event = 'pressed',
    action = function(self)
        if G and G.GAME and G.jokers then
            if G.ygg_xp_bar then
                G.ygg_xp_bar:remove()
                G.ygg_xp_bar = nil
            else
                local setPadding = 0.02
                local ygg_xp_bar_text = {n = G.UIT.O, config = {object = DynaText({scale = 0.5, string = {{ref_table = ygg_to_refer_level_bar, ref_value = "text"}}, maxw = 9, colours = { G.C.WHITE }, float = true, shadow = true, silent = true})}}
        
                G.ygg_xp_bar = UIBox {
                    definition = {
                        n = G.UIT.ROOT,
                        config = {
                            align = "cm",
                            padding = setPadding,
                            colour = G.C.CLEAR,
                        },
                        nodes = {
                            {
                                n = G.UIT.C,
                                config = {align = "cr", padding = 0.05},
                                nodes = {
                                    {n = G.UIT.R, config = {align = "cm", padding = setPadding}, nodes = {
                                        create_progress_bar({reverse_fill = false, bar_rotation = "Horizontal", w = 10, h = 0.25, ref_table = G.GAME, ref_value = 'ygg_current_xp', min = 0, max = 100})
                                    }},
                                    {n = G.UIT.R, config = {align = "tm", padding = setPadding}, nodes = {
                                        ygg_xp_bar_text
                                    }},
                                }
                            },
                        }
                    },
                    config = {
                        align = "tr",
                        offset = { x = -9, y = 3.85},
                        major = G.jokers,
                        bond = 'Strong'
                    }
                }
                G.ygg_xp_bar.states.hover.can = false
                G.ygg_xp_bar.states.click.can = false
            end
        end
    end
}
