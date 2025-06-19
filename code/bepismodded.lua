--surprise surprise :3
function G.FUNCS.progress_bar_h(e)
    local c = e.children[1]
    if not c then return end
    local rt = c.config.ref_table
    if rt.max_ref then rt.max = G.GAME[rt.max_ref] or 1 end
    local neww = (rt.ref_table[rt.ref_value] - rt.min)/(rt.max - rt.min)*rt.w
    if neww <= 0 then
        c.states.visible = false
    else
        c.states.visible = true
    end
    c.T.w = neww
    c.config.w = c.T.w

    if e.config.ui_degree ~= 0 then
        e.T.r = math.rad(e.config.ui_degree or 0)
    end

    if rt.callback then G.FUNCS[rt.callback](rt) end 
end

function G.FUNCS.progress_bar_v(e)
    local c = e.children[1]
    if not c then return end
    local rt = c.config.ref_table
    if rt.max_ref then rt.max = G.GAME[rt.max_ref] or 1 end
    local newh = (rt.ref_table[rt.ref_value] - rt.min)/(rt.max - rt.min)*rt.h
    
    if newh <= 0 then
        c.states.visible = false
    else
        c.states.visible = true
    end
    c.T.h = newh
    c.config.h = c.T.h

    if e.config.ui_degree ~= 0 then
        e.T.r = math.rad(e.config.ui_degree or 0)
    end

    if rt.callback then G.FUNCS[rt.callback](rt) end 
end

function G.FUNCS.pb_rotate_ui(e)
    e.T.r = math.rad(e.config.degree or 0)
end

function create_progress_bar(args)
    args = args or {}
    args.colour = args.colour or G.C.RED
    args.bg_colour = args.bg_colour or G.C.BLACK
    args.label_scale = args.label_scale or 0.5
    args.label_padding = args.label_padding or 0.1
    args.label_minh = args.label_minh or 1
    args.label_minw = args.label_minw or 1
    args.label_vert = args.label_vert or nil
    args.label_position = args.label_position or "Top" --Can be "Left", "Right", "Top", "Bottom"
    args.min = args.min or 0
    args.max = args.max or 1
    args.tooltip = args.tooltip or nil

    args.reverse_fill = args.reverse_fill or false

    args.bar_rotation = args.bar_rotation or "Horizontal" --Can be "Horizontal", "Vertical"
    args.w = args.w or ((args.bar_rotation == "Horizontal" and 1) or (args.bar_rotation == "Vertical" and 0.5))
    args.h = args.h or ((args.bar_rotation == "Horizontal" and 0.5) or (args.bar_rotation == "Vertical" and 1))

    args.label_degree = args.label_degree or 0
    args.ui_degree = args.ui_degree or 0

    args.detailed_tooltip = args.detailed_tooltip or nil
    if not args.detailed_tooltip and args.detailed_tooltip_k then
        args.detailed_tooltip = {key = args.detailed_tooltip_k, set = args.detailed_tooltip_s or nil}
    end

    local t = nil
    if args.bar_rotation == "Horizontal" then
        local startval = 0
        t = 
        {n=G.UIT.C, config={align = "cm", minw = args.w, minh = args.h, padding = 0.1, r = 0.1, colour = G.C.CLEAR, focus_args = {type = 'progress_bar'}}, nodes={
            {n=G.UIT.C, config={align = (args.reverse_fill and "cr") or "cl", ui_degree = args.ui_degree, detailed_tooltip = args.detailed_tooltip, tooltip = args.tooltip, minw = args.w, r = 0.1,minh = args.h, colour = args.bg_colour,emboss = 0.05,func = 'progress_bar_h', refresh_movement = true}, nodes={
              {n=G.UIT.B, config={w=startval,h=args.h, r = 0.1, colour = args.colour, ref_table = args, refresh_movement = true}},
            }},
        }}
    elseif args.bar_rotation == "Vertical" then
        local startval = 0
        t = 
        {n=G.UIT.C, config={align = "cm", minw = args.w, minh = args.h, padding = 0.1, r = 0.1, colour = G.C.CLEAR, focus_args = {type = 'progress_bar'}}, nodes={
            {n=G.UIT.C, config={align = (args.reverse_fill and "tm") or "bm", ui_degree = args.ui_degree, detailed_tooltip = args.detailed_tooltip, tooltip = args.tooltip, minw = args.w, r = 0.1,minh = args.h, colour = args.bg_colour,emboss = 0.05,func = 'progress_bar_v', refresh_movement = true}, nodes={
              {n=G.UIT.B, config={w=args.w,h=startval, r = 0.1, colour = args.colour, ref_table = args, refresh_movement = true}},
            }},
        }}
    end

    if args.label then 
        if args.label_position == "Top" then
            local label_node = {n=G.UIT.R, config={align = "cm", padding = 0}, nodes={
                {n=G.UIT.T, config={func = 'pb_rotate_ui', degree = args.label_degree, text = args.label, scale = args.label_scale, colour = G.C.UI.TEXT_LIGHT, vert = args.label_vert}}
            }} 

            t = 
            {n=G.UIT.R, config={align = "cm", minh = args.label_minh, minw = args.label_minw, padding = args.label_padding * args.label_scale, colour = G.C.CLEAR}, nodes={
                label_node,
                {n=G.UIT.R, config={align = "cm", padding = 0}, nodes={
                    t
                }}
            }}
        elseif args.label_position == "Bottom" then
            local label_node = {n=G.UIT.R, config={align = "cm", padding = 0}, nodes={
                {n=G.UIT.T, config={func = 'pb_rotate_ui', degree = args.label_degree, text = args.label, scale = args.label_scale, colour = G.C.UI.TEXT_LIGHT, vert = args.label_vert}}
            }} 

            t = 
            {n=G.UIT.R, config={align = "cm", minh = args.label_minh, minw = args.label_minw, padding = args.label_padding * args.label_scale, colour = G.C.CLEAR}, nodes={
                {n=G.UIT.R, config={align = "cm", padding = 0}, nodes={
                    t
                }},
                label_node,
            }}
        elseif args.label_position == "Left" then
            local label_node = {n=G.UIT.C, config={align = "cm", padding = 0}, nodes={
                {n=G.UIT.T, config={func = 'pb_rotate_ui', degree = args.label_degree, text = args.label, scale = args.label_scale, colour = G.C.UI.TEXT_LIGHT, vert = args.label_vert}}
            }} 

            t = 
            {n=G.UIT.C, config={align = "cm", minh = args.label_minh, minw = args.label_minw, padding = args.label_padding * args.label_scale, colour = G.C.CLEAR}, nodes={
                label_node,
                {n=G.UIT.C, config={align = "cm", padding = 0}, nodes={
                    t
                }},
            }}
        elseif args.label_position == "Right" then
            local label_node = {n=G.UIT.C, config={align = "cm", padding = 0}, nodes={
                {n=G.UIT.T, config={func = 'pb_rotate_ui', degree = args.label_degree, text = args.label, scale = args.label_scale, colour = G.C.UI.TEXT_LIGHT, vert = args.label_vert}}
            }} 

            t = 
            {n=G.UIT.C, config={align = "cm", minh = args.label_minh, minw = args.label_minw, padding = args.label_padding * args.label_scale, colour = G.C.CLEAR}, nodes={
                {n=G.UIT.C, config={align = "cm", padding = 0}, nodes={
                    t
                }},
                label_node,
            }}
        end
    end

    return t
end