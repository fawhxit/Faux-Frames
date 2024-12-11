// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function button_draw(){
	
	#region Params
		
	    var cmp = argument0
		
	#endregion
	
	#region Draw Body
		
	    // BG
	    draw_set_alpha(cmp[?FFk.bga])
	    draw_rectangle_color(cmp[?FFk.xy][0],cmp[?FFk.xy][1],cmp[?FFk.xy][2],cmp[?FFk.xy][3],
	        cmp[?FFk.bgc][0],cmp[?FFk.bgc][1],cmp[?FFk.bgc][2],cmp[?FFk.bgc][3],false)
		
	    // Outline
	    if(!cmp[?FFk.active]) draw_set_alpha(cmp[?FFk.fga]/2)
	    else draw_set_alpha(cmp[?FFk.fga])
	    draw_rectangle_color(cmp[?FFk.xy][0],cmp[?FFk.xy][1],cmp[?FFk.xy][2],cmp[?FFk.xy][3],
	        cmp[?FFk.fgc][0],cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],true)
		
	#endregion
	
	#region Interaction/Hilight Logic
		
	    var in_cmp = true // Used to return if mouse is inside button
	    if(mouse_x-M.FF.surface_xy[0] > cmp[?FFk.xy][0]-M.FF.margin.SM and mouse_x-M.FF.surface_xy[0] < cmp[?FFk.xy][2]+M.FF.margin.SM
	        and mouse_y-M.FF.surface_xy[1] > cmp[?FFk.xy][1]-M.FF.margin.SM and mouse_y-M.FF.surface_xy[1] < cmp[?FFk.xy][3]+M.FF.margin.SM
	        and cmp[?FFk.active] and !M.FF.frame.menu_override and !cmp[?FFk.override]) {
			
	        // Draw
	        if(M.FF.MBL) draw_set_alpha(cmp[?FFk.fga]*0)
	        else draw_set_alpha(cmp[?FFk.fga]*.125)
	        draw_rectangle_color(cmp[?FFk.xy][0],cmp[?FFk.xy][1],cmp[?FFk.xy][2],cmp[?FFk.xy][3],
	            cmp[?FFk.fgc][0],cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],false)
			
	        // Do Action if Clicked on
	        if(M.FF.MBLR) {
				
	            // Undepress look
	            cmp[?FFk.bgc] = []
	            array_copy(cmp[?FFk.bgc],0,cmp[?FFk.bgc_o],0,array_length_1d(cmp[?FFk.bgc_o]))
				
	            // Do Action
	            button_action(cmp)
				
	        } else if(M.FF.MBL and array_equals(cmp[?FFk.bgc],cmp[?FFk.bgc_o]))
	            cmp[?FFk.bgc] = invert_array(cmp[?FFk.bgc])  // Depress look
			
	    } else {
			
	        in_cmp = false
			
	        // Undo depress look if outside button but orginally depressed button
	        if(!array_equals(cmp[?FFk.bgc],cmp[?FFk.bgc_o])) {
				
	            cmp[?FFk.bgc] = []
	            array_copy(cmp[?FFk.bgc],0,cmp[?FFk.bgc_o],0,array_length_1d(cmp[?FFk.bgc_o]))
				
	        }
			
	    }
	
	#endregion
	
	#region Text
		
	    var a
	    if(!cmp[?FFk.active]) a = cmp[?FFk.fga]/2
	    else a = cmp[?FFk.fga]
	    draw_set_halign(cmp[?FFk.hvalign][0])
	    draw_set_valign(cmp[?FFk.hvalign][1])
	    var txt = cmp[?FFk.str]
		
	    // X/Y Init as Middle/Center
	    var txtx = (((cmp[?FFk.xy][2]-cmp[?FFk.xy][0])/2)+cmp[?FFk.xy][0])
	    var txty = (((cmp[?FFk.xy][3]-cmp[?FFk.xy][1])/2)+cmp[?FFk.xy][1])
		
	    // Otherwise Init XY according to alignment
	    if(cmp[?FFk.hvalign][0] == fa_left) txtx = cmp[?FFk.xy][0]+M.FF.margin.MD
	    else if(cmp[?FFk.hvalign][0] == fa_right) txtx = cmp[?FFk.xy][2]-M.FF.margin.MD
	    if(cmp[?FFk.hvalign][1] == fa_top) txty = cmp[?FFk.xy][1]+M.FF.margin.MD
	    else if(cmp[?FFk.hvalign][1] == fa_bottom) txty = cmp[?FFk.xy][3]-M.FF.margin.MD
		
	    var txtw = cmp[?FFk.xy][2]-cmp[?FFk.xy][0]
	    if(string_width_ext(txt,M.FF.margin.STR_H,txtw) < txtw)
	        draw_text_ext_color(txtx,txty,txt,M.FF.margin.STR_H,txtw,cmp[?FFk.fgc][0],
	            cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],a)
		
	#endregion
	
	// Return whether or not mouse inside btn
	return in_cmp
	
}

function bind_button_draw() {
	
	#region Params
		
	    var cmp = argument0
	    var opt = cmp[?FFk.opt_cfg]
		
	#endregion
	
	#region Draw Body
		
	    // BG
	    draw_set_alpha(cmp[?FFk.bga])
	    draw_rectangle_color(cmp[?FFk.xy][0],cmp[?FFk.xy][1],cmp[?FFk.xy][2],cmp[?FFk.xy][3],
	        cmp[?FFk.bgc][0],cmp[?FFk.bgc][1],cmp[?FFk.bgc][2],cmp[?FFk.bgc][3],false)
		
	    // Outline
	    if(!cmp[?FFk.active]) draw_set_alpha(cmp[?FFk.fga]/2)
	    else draw_set_alpha(cmp[?FFk.fga])
	    draw_rectangle_color(cmp[?FFk.xy][0],cmp[?FFk.xy][1],cmp[?FFk.xy][2],cmp[?FFk.xy][3],
	        cmp[?FFk.fgc][0],cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],true)
		
	#endregion
	
	#region Interaction/Hilight Logic
		
	    var in_cmp = true // Used to return if mouse is inside button
	    if(mouse_x-M.FF.surface_xy[0] > cmp[?FFk.xy][0]-M.FF.margin.SM and mouse_x-M.FF.surface_xy[0] < cmp[?FFk.xy][2]+M.FF.margin.SM
	        and mouse_y-M.FF.surface_xy[1] > cmp[?FFk.xy][1]-M.FF.margin.SM and mouse_y-M.FF.surface_xy[1] < cmp[?FFk.xy][3]+M.FF.margin.SM
	        and cmp[?FFk.active] and (!M.FF.frame.menu_override or M.FF.frame.component_focus == cmp) and !cmp[?FFk.override]) {
			
	        // Draw
	        if(M.FF.MBL) draw_set_alpha(cmp[?FFk.fga]*0)
	        else draw_set_alpha(cmp[?FFk.fga]*.125)
	        draw_rectangle_color(cmp[?FFk.xy][0],cmp[?FFk.xy][1],cmp[?FFk.xy][2],cmp[?FFk.xy][3],
	            cmp[?FFk.fgc][0],cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],false)
			
	        // Do Action if Clicked on
	        if(M.FF.MBLR and M.FF.frame.component_focus != cmp) {
				
	            // Undepress look
	            cmp[?FFk.bgc] = []
	            array_copy(cmp[?FFk.bgc],0,cmp[?FFk.bgc_o],0,array_length_1d(cmp[?FFk.bgc_o]))
				
	            // Do Action + Delay
	            bind_button_action(cmp)
	            M.FF.runtime_frame_delay = 2
				
	        } else if(M.FF.MBL and array_equals(cmp[?FFk.bgc],cmp[?FFk.bgc_o]))
	            cmp[?FFk.bgc] = invert_array(cmp[?FFk.bgc])  // Depress look
			
	    } else {
			
	        in_cmp = false
			
	        // Undo depress look if outside button but orginally depressed button
	        if(!array_equals(cmp[?FFk.bgc],cmp[?FFk.bgc_o])) {
				
	            cmp[?FFk.bgc] = []
	            array_copy(cmp[?FFk.bgc],0,cmp[?FFk.bgc_o],0,array_length_1d(cmp[?FFk.bgc_o]))
				
	        }
			
	    }
		
	    if(M.FF.frame.component_focus == cmp and M.FF.runtime_frame_delay <= 0) {
			
	        var key_got = noone
			
	        /* May not work in GMEdit
			
	        // Do direct key checks
	        if(keyboard_check_direct(vk_anykey)) {
				
	            key_got = true
	            if(keyboard_check_direct(vk_lshift)) variable_instance_set(opt[?FFk.val],"ky",vk_lshift)
	            else if(keyboard_check_direct(vk_lcontrol)) variable_instance_set(opt[?FFk.val],"ky",vk_lcontrol)
	            else if(keyboard_check_direct(vk_lalt)) variable_instance_set(opt[?FFk.val],"ky",vk_lalt)
	            else if(keyboard_check_direct(vk_rshift)) variable_instance_set(opt[?FFk.val],"ky",vk_rshift)
	            else if(keyboard_check_direct(vk_rcontrol)) variable_instance_set(opt[?FFk.val],"ky",vk_rcontrol)
	            else if(keyboard_check_direct(vk_ralt)) variable_instance_set(opt[?FFk.val],"ky",vk_ralt)
	            else {
					
	                key_got = false
					
	            }
				
	            if(key_got) {
					
	                M.FF.frame.menu_override = false
	                M.FF.frame.component_focus = noone
					
	            }
				
	        }
			
	        */
			
	        if(keyboard_check_pressed(vk_anykey) and (!key_got or key_got == noone)) {
				
	            // key_got is set to false if last else statement is executed
	            // Used to initiate keyboard direct checks
	            key_got = true
	            if(keyboard_check_pressed(vk_enter)) variable_instance_set(opt[?FFk.val],"ky",vk_enter)
	            else if(keyboard_check_pressed(vk_return)) variable_instance_set(opt[?FFk.val],"ky",vk_enter)
	            else if(keyboard_check_pressed(vk_shift)) variable_instance_set(opt[?FFk.val],"ky",vk_shift)
	            else if(keyboard_check_pressed(vk_control)) variable_instance_set(opt[?FFk.val],"ky",vk_control)
	            else if(keyboard_check_pressed(vk_alt)) variable_instance_set(opt[?FFk.val],"ky",vk_alt)
	            else if(keyboard_check_pressed(vk_escape)) variable_instance_set(opt[?FFk.val],"ky",vk_escape)
	            else if(keyboard_check_pressed(vk_space)) variable_instance_set(opt[?FFk.val],"ky",vk_space)
	            else if(keyboard_check_pressed(vk_backspace)) variable_instance_set(opt[?FFk.val],"ky",vk_backspace)
	            else if(keyboard_check_pressed(vk_tab)) variable_instance_set(opt[?FFk.val],"ky",vk_tab)
	            else if(keyboard_check_pressed(vk_pause)) variable_instance_set(opt[?FFk.val],"ky",vk_pause)
	            else if(keyboard_check_pressed(vk_printscreen)) variable_instance_set(opt[?FFk.val],"ky",vk_printscreen)
	            else if(keyboard_check_pressed(vk_left)) variable_instance_set(opt[?FFk.val],"ky",vk_left)
	            else if(keyboard_check_pressed(vk_right)) variable_instance_set(opt[?FFk.val],"ky",vk_right)
	            else if(keyboard_check_pressed(vk_up)) variable_instance_set(opt[?FFk.val],"ky",vk_up)
	            else if(keyboard_check_pressed(vk_down)) variable_instance_set(opt[?FFk.val],"ky",vk_down)
	            else if(keyboard_check_pressed(vk_home)) variable_instance_set(opt[?FFk.val],"ky",vk_home)
	            else if(keyboard_check_pressed(vk_end)) variable_instance_set(opt[?FFk.val],"ky",vk_end)
	            else if(keyboard_check_pressed(vk_delete)) variable_instance_set(opt[?FFk.val],"ky",vk_delete)
	            else if(keyboard_check_pressed(vk_insert)) variable_instance_set(opt[?FFk.val],"ky",vk_insert)
	            else if(keyboard_check_pressed(vk_pageup)) variable_instance_set(opt[?FFk.val],"ky",vk_pageup)
	            else if(keyboard_check_pressed(vk_pagedown)) variable_instance_set(opt[?FFk.val],"ky",vk_pagedown)
	            else if(keyboard_check_pressed(vk_f1)) variable_instance_set(opt[?FFk.val],"ky",vk_f1)
	            else if(keyboard_check_pressed(vk_f2)) variable_instance_set(opt[?FFk.val],"ky",vk_f2)
	            else if(keyboard_check_pressed(vk_f3)) variable_instance_set(opt[?FFk.val],"ky",vk_f3)
	            else if(keyboard_check_pressed(vk_f4)) variable_instance_set(opt[?FFk.val],"ky",vk_f4)
	            else if(keyboard_check_pressed(vk_f5)) variable_instance_set(opt[?FFk.val],"ky",vk_f5)
	            else if(keyboard_check_pressed(vk_f6)) variable_instance_set(opt[?FFk.val],"ky",vk_f6)
	            else if(keyboard_check_pressed(vk_f7)) variable_instance_set(opt[?FFk.val],"ky",vk_f7)
	            else if(keyboard_check_pressed(vk_f8)) variable_instance_set(opt[?FFk.val],"ky",vk_f8)
	            else if(keyboard_check_pressed(vk_f9)) variable_instance_set(opt[?FFk.val],"ky",vk_f9)
	            else if(keyboard_check_pressed(vk_f10)) variable_instance_set(opt[?FFk.val],"ky",vk_f10)
	            else if(keyboard_check_pressed(vk_f11)) variable_instance_set(opt[?FFk.val],"ky",vk_f11)
	            else if(keyboard_check_pressed(vk_f12)) variable_instance_set(opt[?FFk.val],"ky",vk_f12)
	            else if(keyboard_check_pressed(vk_numpad0)) variable_instance_set(opt[?FFk.val],"ky",vk_numpad0)
	            else if(keyboard_check_pressed(vk_numpad1)) variable_instance_set(opt[?FFk.val],"ky",vk_numpad1)
	            else if(keyboard_check_pressed(vk_numpad2)) variable_instance_set(opt[?FFk.val],"ky",vk_numpad2)
	            else if(keyboard_check_pressed(vk_numpad3)) variable_instance_set(opt[?FFk.val],"ky",vk_numpad3)
	            else if(keyboard_check_pressed(vk_numpad4)) variable_instance_set(opt[?FFk.val],"ky",vk_numpad4)
	            else if(keyboard_check_pressed(vk_numpad5)) variable_instance_set(opt[?FFk.val],"ky",vk_numpad5)
	            else if(keyboard_check_pressed(vk_numpad6)) variable_instance_set(opt[?FFk.val],"ky",vk_numpad6)
	            else if(keyboard_check_pressed(vk_numpad7)) variable_instance_set(opt[?FFk.val],"ky",vk_numpad7)
	            else if(keyboard_check_pressed(vk_numpad8)) variable_instance_set(opt[?FFk.val],"ky",vk_numpad8)
	            else if(keyboard_check_pressed(vk_numpad9)) variable_instance_set(opt[?FFk.val],"ky",vk_numpad9)
	            else if(keyboard_check_pressed(vk_divide)) variable_instance_set(opt[?FFk.val],"ky",vk_divide)
	            else if(keyboard_check_pressed(vk_multiply)) variable_instance_set(opt[?FFk.val],"ky",vk_multiply)
	            else if(keyboard_check_pressed(vk_subtract)) variable_instance_set(opt[?FFk.val],"ky",vk_subtract)
	            else if(keyboard_check_pressed(vk_add)) variable_instance_set(opt[?FFk.val],"ky",vk_add)
	            else if(keyboard_check_pressed(vk_decimal)) variable_instance_set(opt[?FFk.val],"ky",vk_decimal)
	            else if(string_lettersdigits(chr(keyboard_key)) != "") variable_instance_set(opt[?FFk.val],"ky",keyboard_key)
	            else key_got = false
				
	            if(key_got) {
					
	                M.FF.frame.menu_override = false
	                M.FF.frame.component_focus = noone
					
	            }
				
	        } else {
				
	            var mouse_got = true
	            if(mouse_check_button_pressed(mb_left)) variable_instance_set(opt[?FFk.val],"ky",mb_left)
	            else if(mouse_check_button_pressed(mb_right)) variable_instance_set(opt[?FFk.val],"ky",mb_right)
	            else if(mouse_check_button_pressed(mb_middle)) variable_instance_set(opt[?FFk.val],"ky",mb_middle)
	            else if(mouse_wheel_up()) variable_instance_set(opt[?FFk.val],"ky","mb_up")
	            else if(mouse_wheel_down()) variable_instance_set(opt[?FFk.val],"ky","mb_down")
	            else mouse_got = false
				
	            if(mouse_got) {
					
	                M.FF.frame.menu_override = false
	                M.FF.frame.component_focus = noone
					
	            }
				
	        }
			
	    }
	
	#endregion
	
	#region Text
		
	    if(opt[?FFk.val].ky == (vk_enter)) opt[?FFk.str] = "Enter"
	    else if(opt[?FFk.val].ky == (vk_shift)) opt[?FFk.str] = "Shift"
	    else if(opt[?FFk.val].ky == (vk_control)) opt[?FFk.str] = "Ctrl"
	    else if(opt[?FFk.val].ky == (vk_alt)) opt[?FFk.str] = "Alt"
	    else if(opt[?FFk.val].ky == (vk_escape)) opt[?FFk.str] = "Esc"
	    else if(opt[?FFk.val].ky == (vk_space)) opt[?FFk.str] = "Space"
	    else if(opt[?FFk.val].ky == (vk_backspace)) opt[?FFk.str] = "Backspace"
	    else if(opt[?FFk.val].ky == (vk_tab)) opt[?FFk.str] = "Tab"
	    else if(opt[?FFk.val].ky == (vk_pause)) opt[?FFk.str] = "Pause"
	    else if(opt[?FFk.val].ky == (vk_printscreen)) opt[?FFk.str] = "Print Screen"
	    else if(opt[?FFk.val].ky == (vk_left)) opt[?FFk.str] = "Left Arrow"
	    else if(opt[?FFk.val].ky == (vk_right)) opt[?FFk.str] = "Right Arrow"
	    else if(opt[?FFk.val].ky == (vk_up)) opt[?FFk.str] = "Up Arrow"
	    else if(opt[?FFk.val].ky == (vk_down)) opt[?FFk.str] = "Down Arrow"
	    else if(opt[?FFk.val].ky == (vk_home)) opt[?FFk.str] = "Home"
	    else if(opt[?FFk.val].ky == (vk_end)) opt[?FFk.str] = "End"
	    else if(opt[?FFk.val].ky == (vk_delete)) opt[?FFk.str] = "Delete"
	    else if(opt[?FFk.val].ky == (vk_insert)) opt[?FFk.str] = "Insert"
	    else if(opt[?FFk.val].ky == (vk_pageup)) opt[?FFk.str] = "Page Up"
	    else if(opt[?FFk.val].ky == (vk_pagedown)) opt[?FFk.str] = "Page Down"
	    else if(opt[?FFk.val].ky == (vk_f1)) opt[?FFk.str] = "F1"
	    else if(opt[?FFk.val].ky == (vk_f2)) opt[?FFk.str] = "F2"
	    else if(opt[?FFk.val].ky == (vk_f3)) opt[?FFk.str] = "F3"
	    else if(opt[?FFk.val].ky == (vk_f4)) opt[?FFk.str] = "F4"
	    else if(opt[?FFk.val].ky == (vk_f5)) opt[?FFk.str] = "F5"
	    else if(opt[?FFk.val].ky == (vk_f6)) opt[?FFk.str] = "F6"
	    else if(opt[?FFk.val].ky == (vk_f7)) opt[?FFk.str] = "F7"
	    else if(opt[?FFk.val].ky == (vk_f8)) opt[?FFk.str] = "F8"
	    else if(opt[?FFk.val].ky == (vk_f9)) opt[?FFk.str] = "F9"
	    else if(opt[?FFk.val].ky == (vk_f10)) opt[?FFk.str] = "F10"
	    else if(opt[?FFk.val].ky == (vk_f11)) opt[?FFk.str] = "F11"
	    else if(opt[?FFk.val].ky == (vk_f12)) opt[?FFk.str] = "F12"
	    else if(opt[?FFk.val].ky == (vk_numpad0)) opt[?FFk.str] = "Num 0"
	    else if(opt[?FFk.val].ky == (vk_numpad1)) opt[?FFk.str] = "Num 1"
	    else if(opt[?FFk.val].ky == (vk_numpad2)) opt[?FFk.str] = "Num 2"
	    else if(opt[?FFk.val].ky == (vk_numpad3)) opt[?FFk.str] = "Num 3"
	    else if(opt[?FFk.val].ky == (vk_numpad4)) opt[?FFk.str] = "Num 4"
	    else if(opt[?FFk.val].ky == (vk_numpad5)) opt[?FFk.str] = "Num 5"
	    else if(opt[?FFk.val].ky == (vk_numpad6)) opt[?FFk.str] = "Num 6"
	    else if(opt[?FFk.val].ky == (vk_numpad7)) opt[?FFk.str] = "Num 7"
	    else if(opt[?FFk.val].ky == (vk_numpad8)) opt[?FFk.str] = "Num 8"
	    else if(opt[?FFk.val].ky == (vk_numpad9)) opt[?FFk.str] = "Num 9"
	    else if(opt[?FFk.val].ky == (vk_divide)) opt[?FFk.str] = "Divide"
	    else if(opt[?FFk.val].ky == (vk_multiply)) opt[?FFk.str] = "Multiply"
	    else if(opt[?FFk.val].ky == (vk_subtract)) opt[?FFk.str] = "Subtract"
	    else if(opt[?FFk.val].ky == (vk_add)) opt[?FFk.str] = "Add"
	    else if(opt[?FFk.val].ky == (vk_decimal)) opt[?FFk.str] = "Decimal"
	    /* Commented out, does not seem to work in GMEdit
	    else if(opt[?FFk.val].ky == (vk_lshift)) opt[?FFk.str] = "L Shift"
	    else if(opt[?FFk.val].ky == (vk_lcontrol)) opt[?FFk.str] = "L Ctrl"
	    else if(opt[?FFk.val].ky == (vk_lalt)) opt[?FFk.str] = "L Alt"
	    else if(opt[?FFk.val].ky == (vk_rshift)) opt[?FFk.str] = "R Shift"
	    else if(opt[?FFk.val].ky == (vk_rcontrol)) opt[?FFk.str] = "R Ctrl"
	    else if(opt[?FFk.val].ky == (vk_ralt)) opt[?FFk.str] = "R Alt"
	    */
	    else if(opt[?FFk.val].ky == (mb_left)) opt[?FFk.str] = "Mouse Left"
	    else if(opt[?FFk.val].ky == (mb_right)) opt[?FFk.str] = "Mouse Right"
	    else if(opt[?FFk.val].ky == (mb_middle)) opt[?FFk.str] = "Mouse Middle"
	    else if(opt[?FFk.val].ky == ("mb_up")) opt[?FFk.str] = "Wheel Up"
	    else if(opt[?FFk.val].ky == ("mb_down")) opt[?FFk.str] = "Wheel Down"
	    else opt[?FFk.str] = string(chr(opt[?FFk.val].ky))
		
	    var a
	    if(!cmp[?FFk.active]) a = cmp[?FFk.fga]/2
	    else a = cmp[?FFk.fga]
	    draw_set_halign(fa_middle)
	    draw_set_valign(fa_center)
	    var txt = ""
	    if(M.FF.frame.component_focus != cmp) txt = opt[?FFk.str]
	    else txt = "PRESS TO BIND"
	    var txtx = (((cmp[?FFk.xy][2]-cmp[?FFk.xy][0])/2)+cmp[?FFk.xy][0])
	    var txty = (((cmp[?FFk.xy][3]-cmp[?FFk.xy][1])/2)+cmp[?FFk.xy][1])
	    var txtw = cmp[?FFk.xy][2]-cmp[?FFk.xy][0]
	    if(string_width_ext(txt,M.FF.margin.STR_H,txtw) < txtw)
	        draw_text_ext_color(txtx,txty,txt,M.FF.margin.STR_H,txtw,cmp[?FFk.fgc][0],
	            cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],a)
		
	#endregion
	
	// Return whether or not mouse inside btn
	return in_cmp
	
}

function color_picker_draw() {
	
	#region Params&CFG
		
	    var cmp = argument0
	    var opt = cmp[?FFk.opt_cfg]
	    var col = opt[?FFk.arr][opt[?FFk.val]].rgb
		
	#endregion
	
	// Calc Inits
	var cmp_h = cmp[?FFk.xy][3] - cmp[?FFk.xy][1]
	
	#region Draw Body
		
	    // BG
	    draw_set_alpha(cmp[?FFk.bga])
	    draw_rectangle_color(cmp[?FFk.xy][0]+cmp_h,cmp[?FFk.xy][1],cmp[?FFk.xy][2]-cmp_h,cmp[?FFk.xy][3],
	        cmp[?FFk.bgc][0],cmp[?FFk.bgc][1],cmp[?FFk.bgc][2],cmp[?FFk.bgc][3],false)
		
	    // Outline
	    if(!cmp[?FFk.active]) draw_set_alpha(cmp[?FFk.fga]/2)
	    else draw_set_alpha(cmp[?FFk.fga])
	    draw_rectangle_color(cmp[?FFk.xy][0]+cmp_h,cmp[?FFk.xy][1],cmp[?FFk.xy][2]-cmp_h,cmp[?FFk.xy][3],
	        cmp[?FFk.fgc][0],cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],true)
		
	#endregion
	
	#region Draw Arrows & Color Display
		
	    // Inits
	    var asz = round(cmp_h*.25) // Arrow Size
	    // Color Demo
	    var xyc
	    xyc[0] = cmp[?FFk.xy][0]
	    xyc[1] = cmp[?FFk.xy][1]
	    xyc[2] = cmp[?FFk.xy][0]+cmp_h
	    xyc[3] = cmp[?FFk.xy][3]
	    var cx = xyc[0]+((xyc[2]-xyc[0])/2)
	    var cy = xyc[1]+((xyc[3]-xyc[1])/2)
	    // Left
	    var xyl
	    xyl[0] = xyc[2]
	    xyl[1] = cmp[?FFk.xy][1]
	    xyl[2] = xyc[2]+cmp_h
	    xyl[3] = cmp[?FFk.xy][3]
	    var lx = xyl[0]+((xyl[2]-xyl[0])/2)
	    var ly = xyl[1]+((xyl[3]-xyl[1])/2)
	    // Right
	    var xyr
	    xyr[0] = cmp[?FFk.xy][2]-cmp_h
	    xyr[1] = cmp[?FFk.xy][1]
	    xyr[2] = cmp[?FFk.xy][2]
	    xyr[3] = cmp[?FFk.xy][3]
	    var rx = xyr[0]+((xyr[2]-xyr[0])/2)
	    var ry = xyr[1]+((xyr[3]-xyr[1])/2)
		
	    // Color Demo
	    // BG
	    draw_set_alpha(cmp[?FFk.bga])
	    draw_rectangle_color(xyc[0],xyc[1],xyc[2],xyc[3],col,col,col,col,false)
		
	    // Outline
	    if(!cmp[?FFk.active]) draw_set_alpha(cmp[?FFk.fga]/2)
	    else draw_set_alpha(cmp[?FFk.fga])
	    draw_rectangle_color(xyc[0],xyc[1],xyc[2],xyc[3],cmp[?FFk.fgc][0],
	        cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],true)
		
	    // Left (Depress Check)
	    if(mouse_x-M.FF.surface_xy[0] > xyl[0]-M.FF.margin.SM and mouse_x-M.FF.surface_xy[0] < xyl[2]+M.FF.margin.SM
	        and mouse_y-M.FF.surface_xy[1] > xyl[1]-M.FF.margin.SM and mouse_y-M.FF.surface_xy[1] < xyl[3]+M.FF.margin.SM
	        and cmp[?FFk.active] and !M.FF.frame.menu_override and !cmp[?FFk.override])
	        if(M.FF.MBL and array_equals(cmp[?FFk.bgc],cmp[?FFk.bgc_o]))
	            cmp[?FFk.bgc] = invert_array(cmp[?FFk.bgc])
		
	    // Left
	    // BG
	    draw_set_alpha(cmp[?FFk.bga])
	    draw_rectangle_color(xyl[0],xyl[1],xyl[2],xyl[3],cmp[?FFk.bgc][0],
	        cmp[?FFk.bgc][1],cmp[?FFk.bgc][2],cmp[?FFk.bgc][3],false)
		
	    // Undepress..
	    if(!array_equals(cmp[?FFk.bgc],cmp[?FFk.bgc_o]))
	        cmp[?FFk.bgc] = array_dupe(cmp[?FFk.bgc],cmp[?FFk.bgc_o])
		
	    // Outline
	    if(!cmp[?FFk.active]) draw_set_alpha(cmp[?FFk.fga]/2)
	    else draw_set_alpha(cmp[?FFk.fga])
	    draw_rectangle_color(xyl[0],xyl[1],xyl[2],xyl[3],cmp[?FFk.fgc][0],
	        cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],true)
		
	    // Arrow
	    draw_set_color(cmp[?FFk.fgc][0])
	    if(!cmp[?FFk.active]) draw_set_alpha(cmp[?FFk.fga]/2)
	    else draw_set_alpha(cmp[?FFk.fga])
	    draw_triangle(lx-asz,ly,lx+asz,ly+asz,lx+asz,ly-asz,true)
		
	    // Right (Depress Check)
	    if(mouse_x-M.FF.surface_xy[0] > xyr[0]-M.FF.margin.SM and mouse_x-M.FF.surface_xy[0] < xyr[2]+M.FF.margin.SM
	        and mouse_y-M.FF.surface_xy[1] > xyr[1]-M.FF.margin.SM and mouse_y-M.FF.surface_xy[1] < xyr[3]+M.FF.margin.SM
	        and cmp[?FFk.active] and !M.FF.frame.menu_override and !cmp[?FFk.override])
	        if(M.FF.MBL and array_equals(cmp[?FFk.bgc],cmp[?FFk.bgc_o]))
	            cmp[?FFk.bgc] = invert_array(cmp[?FFk.bgc])
		
	    // Right
	    // BG
	    draw_set_alpha(cmp[?FFk.bga])
	    draw_rectangle_color(xyr[0],xyr[1],xyr[2],xyr[3],cmp[?FFk.bgc][0],
	        cmp[?FFk.bgc][1],cmp[?FFk.bgc][2],cmp[?FFk.bgc][3],false)
		
	    // Undepress..
	    if(!array_equals(cmp[?FFk.bgc],cmp[?FFk.bgc_o]))
	        cmp[?FFk.bgc] = array_dupe(cmp[?FFk.bgc],cmp[?FFk.bgc_o])
		
	    // Outline
	    if(!cmp[?FFk.active]) draw_set_alpha(cmp[?FFk.fga]/2)
	    else draw_set_alpha(cmp[?FFk.fga])
	    draw_rectangle_color(xyr[0],xyr[1],xyr[2],xyr[3],cmp[?FFk.fgc][0],
	        cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],true)
		
	    // Arrow
	    draw_set_colour(cmp[?FFk.fgc][0])
	    if(!cmp[?FFk.active]) draw_set_alpha(cmp[?FFk.fga]/2)
	    else draw_set_alpha(cmp[?FFk.fga])
	    draw_triangle(rx+asz,ry,rx-asz,ry+asz,rx-asz,ry-asz,true)
		
	#endregion
	
	#region Interaction/Hilight Logic
		
	    var in_cmp = false // Used to return if mouse is inside button
		
	    // Left
	    if(mouse_x-M.FF.surface_xy[0] > xyl[0]-M.FF.margin.SM and mouse_x-M.FF.surface_xy[0] < xyl[2]+M.FF.margin.SM
	        and mouse_y-M.FF.surface_xy[1] > xyl[1]-M.FF.margin.SM and mouse_y-M.FF.surface_xy[1] < xyl[3]+M.FF.margin.SM
	        and cmp[?FFk.active] and !M.FF.frame.menu_override and !cmp[?FFk.override]) {
			
	        in_cmp = true
	        // Draw
	        if(M.FF.MBL) draw_set_alpha(cmp[?FFk.fga]*.05)
	        else draw_set_alpha(cmp[?FFk.fga]*.125)
	        draw_rectangle_color(xyl[0],xyl[1],xyl[2],xyl[3],cmp[?FFk.fgc][0],
	            cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],false)
			
	        // Arrow
	        draw_set_colour(cmp[?FFk.fgc][0])
	        if(M.FF.MBL) draw_set_alpha(cmp[?FFk.fga]*.5)
	        else draw_set_alpha(cmp[?FFk.fga])
	        draw_triangle(lx-asz,ly,lx+asz,ly+asz,lx+asz,ly-asz,false)
			
	        if(M.FF.MBLR) {
				
	            if(opt[?FFk.val] > 0) opt[?FFk.val] -= 1
	            else opt[?FFk.val] = array_length_1d(opt[?FFk.arr])-1
				
	        }
			
	    }
		
	    // Right
	    if(mouse_x-M.FF.surface_xy[0] > xyr[0]-M.FF.margin.SM and mouse_x-M.FF.surface_xy[0] < xyr[2]+M.FF.margin.SM
	        and mouse_y-M.FF.surface_xy[1] > xyr[1]-M.FF.margin.SM and mouse_y-M.FF.surface_xy[1] < xyr[3]+M.FF.margin.SM
	        and cmp[?FFk.active] and !M.FF.frame.menu_override and !cmp[?FFk.override]) {
			
	        in_cmp = true
	        // Draw
	        if(M.FF.MBL) draw_set_alpha(cmp[?FFk.fga]*.05)
	        else draw_set_alpha(cmp[?FFk.fga]*.125)
	        draw_rectangle_color(xyr[0],xyr[1],xyr[2],xyr[3],cmp[?FFk.fgc][0],
	            cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],false)
			
	        // Arrow
	        draw_set_colour(cmp[?FFk.fgc][0])
	        if(M.FF.MBL) draw_set_alpha(cmp[?FFk.fga]*.5)
	        else draw_set_alpha(cmp[?FFk.fga])
	        draw_triangle(rx+asz,ry,rx-asz,ry+asz,rx-asz,ry-asz,false)
			
	        if(M.FF.MBLR) {
				
	            if(opt[?FFk.val] < array_length_1d(opt[?FFk.arr])-1)
	                opt[?FFk.val] += 1
	            else opt[?FFk.val] = 0
				
	        }
			
	    }
		
	#endregion
	
	#region Text
		
	    var a
	    if(!cmp[?FFk.active]) a = cmp[?FFk.fga]/2
	    else a = cmp[?FFk.fga]
	    draw_set_halign(fa_middle)
	    draw_set_valign(fa_center)
	    var txt = string_capital_all(opt[?FFk.arr][opt[?FFk.val]].str)
	    var txtx = (((xyr[0]-xyl[2])/2)+xyl[2])
	    var txty = (((cmp[?FFk.xy][3]-cmp[?FFk.xy][1])/2)+cmp[?FFk.xy][1])
	    var txtw = (cmp[?FFk.xy][2]-cmp_h)-(cmp[?FFk.xy][0]+cmp_h)
	    if(string_width_ext(txt,M.FF.margin.STR_H,txtw) < txtw)
	        draw_text_ext_color(txtx,txty,txt,M.FF.margin.STR_H,txtw,cmp[?FFk.fgc][0],
	            cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],a)
		
	#endregion
	
	// Do Action
	color_picker_action(cmp)
	
	// Return whether or not mouse inside btn
	return in_cmp
	
}

function cmp_list_draw() {
	
	#region Params
		
	    var cmp = argument0
		
	#endregion
	
	#region Draw Body
		
	    // BG
	    draw_set_alpha(cmp[?FFk.bga])
	    draw_rectangle_color(cmp[?FFk.xy][0],cmp[?FFk.xy][1],cmp[?FFk.xy][2],cmp[?FFk.xy][3],
	        cmp[?FFk.bgc][0],cmp[?FFk.bgc][1],cmp[?FFk.bgc][2],cmp[?FFk.bgc][3],false)
		
	    // Outline
	    if(!cmp[?FFk.active]) draw_set_alpha(cmp[?FFk.fga]/2)
	    else draw_set_alpha(cmp[?FFk.fga])
	    draw_rectangle_color(cmp[?FFk.xy][0],cmp[?FFk.xy][1],cmp[?FFk.xy][2],cmp[?FFk.xy][3],
	        cmp[?FFk.fgc][0],cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],true)
		
	#endregion
	
	#region Interaction/Hilight Logic
		
	    var in_cmp = false // Used to return if mouse is inside button
	    if(mouse_x-M.FF.surface_xy[0] > cmp[?FFk.xy][0]-M.FF.margin.SM and mouse_x-M.FF.surface_xy[0] < cmp[?FFk.xy][2]+M.FF.margin.SM
	        and mouse_y-M.FF.surface_xy[1] > cmp[?FFk.xy][1]-M.FF.margin.SM and mouse_y-M.FF.surface_xy[1] < cmp[?FFk.xy][3]+M.FF.margin.SM
	        and cmp[?FFk.active] and !M.FF.frame.menu_override and !cmp[?FFk.override]) {
			
	        if(cmp[?FFk.scroll]) {
				
	            if(M.FF.MWU)
	                if(M.FF.key_shift) cmp[?FFk.scrolly] += M.FF.margin.STR_H*2
	                else cmp[?FFk.scrolly] += M.FF.margin.STR_H
	            else if(M.FF.MWD)
	                if(M.FF.key_shift) cmp[?FFk.scrolly] -= M.FF.margin.STR_H*2
	                else cmp[?FFk.scrolly] -= M.FF.margin.STR_H
	            cmp[?FFk.scrolly] = clamp(cmp[?FFk.scrolly],cmp[?FFk.scrolly_mn],cmp[?FFk.scrolly_mx])
				
	        }
			
	    }
		
	#endregion
	
	#region Components
		
	    // Surface Init
	    var w = cmp[?FFk.xy][2] - cmp[?FFk.xy][0]
	    var h = cmp[?FFk.xy][3] - cmp[?FFk.xy][1]
	    cmp[?FFk.surf_wh] = [w-1,h-1]
	    cmp[?FFk.surf_id] = ds_map_size(M.FF.surface_map)
	    M.FF.surface_map[?cmp[?FFk.surf_id]] = surface_create(cmp[?FFk.surf_wh][0],cmp[?FFk.surf_wh][1])
	    surface_set_target(M.FF.surface_map[?cmp[?FFk.surf_id]])
	    cmp[?FFk.surf_xy] = [cmp[?FFk.xy][0]+1,cmp[?FFk.xy][1]+1]
	    M.FF.surface_xy = cmp[?FFk.surf_xy]
		
	    var cfg = cmp[?FFk.cmpnt_cfg]
	    var l_sz = ds_list_size(cmp[?FFk.cmp_list])
	    var v_sz = 0
	    if(cfg[?FFk.varr] != noone) v_sz = array_height_2d(cfg[?FFk.varr])
		
		show_debug_message(string(cfg[?FFk.varr]))
	    if(l_sz > v_sz) {
			
	        cmp[?FFk.cmpnt_cfg][?FFk.varr] = [[]]
	        if(l_sz > 1) {
				
	            var do_last = false
	            for(var i = 1; i < ds_list_size(cmp[?FFk.cmp_list]); i++) {
					
	                if(do_last) cfg[?FFk.varr][array_height_2d(cfg[?FFk.varr])] = []
					
	                if(!do_last) cfg[?FFk.varr][i-1][0] = cmp[?FFk.cmp_list][|i]
	                else cfg[?FFk.varr][array_height_2d(cfg[?FFk.varr])-1][0] = cmp[?FFk.cmp_list][|i]
					
	                if(!do_last and i == l_sz-1) {
						
	                    do_last = true
	                    i = -1
						
	                } else if(do_last) break
					
	            }
				
	        } else {
				
				cfg[?FFk.varr][0][0] = cmp[?FFk.cmp_list][|0]
				
	        }
			
	    }
		
	    // Draw
	    var ret_arr = draw_components(cmp,[0,noone,in_cmp])
		
	    cmp[?FFk.scrolly_mn] = -(ret_arr[0]-cmp[?FFk.cmp_list][|0][?FFk.h]-(cmp[?FFk.cmpnt_cfg][?FFk.marginy]*2))
		
	    // Draw surface
	    surface_reset_target()
	    draw_set_alpha(1)
	    draw_surface(M.FF.surface_map[?cmp[?FFk.surf_id]],M.FF.surface_xy[0],M.FF.surface_xy[1]+1)
	    M.FF.surface_xy = [0,0]
		
	#endregion
	
	// Return whether or not mouse inside btn
	return in_cmp
	
}

function container_draw() {
	
	#region Params
		
	    var cmp = argument0
		
	#endregion
	
	#region Draw Body
		
	    // BG
	    draw_set_alpha(cmp[?FFk.bga])
	    draw_rectangle_color(cmp[?FFk.xy][0],cmp[?FFk.xy][1],cmp[?FFk.xy][2],cmp[?FFk.xy][3],
	        cmp[?FFk.bgc][0],cmp[?FFk.bgc][1],cmp[?FFk.bgc][2],cmp[?FFk.bgc][3],false)
		
	    // Outline
	    if(!cmp[?FFk.active]) draw_set_alpha(cmp[?FFk.fga]/2)
	    else draw_set_alpha(cmp[?FFk.fga])
	    draw_rectangle_color(cmp[?FFk.xy][0],cmp[?FFk.xy][1],cmp[?FFk.xy][2],cmp[?FFk.xy][3],
	        cmp[?FFk.fgc][0],cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],true)
		
	#endregion
	
	#region Interaction/Hilight Logic
		
	    var in_cmp = false // Used to return if mouse is inside button
	    if(mouse_x-M.FF.surface_xy[0] > cmp[?FFk.xy][0]-M.FF.margin.SM and mouse_x-M.FF.surface_xy[0] < cmp[?FFk.xy][2]+M.FF.margin.SM
	        and mouse_y-M.FF.surface_xy[1] > cmp[?FFk.xy][1]-M.FF.margin.SM and mouse_y-M.FF.surface_xy[1] < cmp[?FFk.xy][3]+M.FF.margin.SM
	        and cmp[?FFk.active] and !M.FF.frame.menu_override and !cmp[?FFk.override]) {
			
			// UNUSED
			
	    }
		
	#endregion
	
	#region Components
		
	    if(cmp[?FFk.cmpnt_cfg][?FFk.varr] != noone) {
			
	        var tot_h = 0
	        draw_components(cmp,[tot_h,noone,in_cmp])
			
	    }
		
	#endregion
	
	// Do Action
	container_action(cmp)
	
	// Return whether or not mouse inside btn
	return in_cmp
	
}

function dropdown_draw() {
	
	#region Params&CFG
		
	    var cmp = argument0
	    var opt = cmp[?FFk.opt_cfg]
	    var menu = cmp[?FFk.menu_cfg]
	    var cell = cmp[?FFk.cell_cfg]
		
	#endregion
	
	// Calc Inits
	menu[?FFk.offx] = cmp[?FFk.xy][3] - cmp[?FFk.xy][1]
	
	#region Draw Body
		
	    // BG
	    draw_set_alpha(cmp[?FFk.bga])
	    if(!array_equals(cmp[?FFk.bgc],cmp[?FFk.bgc_o]))
	    draw_rectangle_color(cmp[?FFk.xy][0],cmp[?FFk.xy][1],cmp[?FFk.xy][2]-menu[?FFk.offx],cmp[?FFk.xy][3],
	        cmp[?FFk.bgc_o][0],cmp[?FFk.bgc_o][1],cmp[?FFk.bgc_o][2],cmp[?FFk.bgc_o][3],false)
	    else draw_rectangle_color(cmp[?FFk.xy][0],cmp[?FFk.xy][1],cmp[?FFk.xy][2]-menu[?FFk.offx],cmp[?FFk.xy][3],
	        cmp[?FFk.bgc][0],cmp[?FFk.bgc][1],cmp[?FFk.bgc][2],cmp[?FFk.bgc][3],false)
		
	    // Outline
	    if(!cmp[?FFk.active]) draw_set_alpha(cmp[?FFk.fga]/2)
	    else draw_set_alpha(cmp[?FFk.fga])
	    draw_rectangle_color(cmp[?FFk.xy][0],cmp[?FFk.xy][1],cmp[?FFk.xy][2]-menu[?FFk.offx],cmp[?FFk.xy][3],
	        cmp[?FFk.fgc][0],cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],true)
		
	#endregion
	
	#region Draw Arrow
		
	    // Inits
	    var asz = round(menu[?FFk.offx]*.25) // Arrow Size
	    // Right
	    var xyr
	    xyr[0] = cmp[?FFk.xy][2]-menu[?FFk.offx]
	    xyr[1] = cmp[?FFk.xy][1]
	    xyr[2] = cmp[?FFk.xy][2]
	    xyr[3] = cmp[?FFk.xy][3]
	    var rx = xyr[0]+((xyr[2]-xyr[0])/2)
	    var ry = xyr[1]+((xyr[3]-xyr[1])/2)
		
	    // Right
	    // BG
	    if(mouse_x-M.FF.surface_xy[0] > xyr[0]-M.FF.margin.SM and mouse_x-M.FF.surface_xy[0] < xyr[2]+M.FF.margin.SM
	        and mouse_y-M.FF.surface_xy[1] > xyr[1]-M.FF.margin.SM and mouse_y-M.FF.surface_xy[1] < xyr[3]+M.FF.margin.SM
	        and cmp[?FFk.active] and (!M.FF.frame.menu_override or cmp[?FFk.state])
	        and !cmp[?FFk.override]) {
			
	        if(M.FF.MBL and array_equals(cmp[?FFk.bgc],cmp[?FFk.bgc_o]))
	            cmp[?FFk.bgc] = invert_array(cmp[?FFk.bgc])
	        else if(!M.FF.MBL and !array_equals(cmp[?FFk.bgc],cmp[?FFk.bgc_o]))
	            cmp[?FFk.bgc] = array_dupe(cmp[?FFk.bgc],cmp[?FFk.bgc_o])
			
	    } else if(!array_equals(cmp[?FFk.bgc],cmp[?FFk.bgc_o]))
	        cmp[?FFk.bgc] = array_dupe(cmp[?FFk.bgc],cmp[?FFk.bgc_o])
		
	    draw_set_alpha(cmp[?FFk.bga])
	    draw_rectangle_color(xyr[0],xyr[1],xyr[2],xyr[3],cmp[?FFk.bgc][0],
	        cmp[?FFk.bgc][1],cmp[?FFk.bgc][2],cmp[?FFk.bgc][3],false)
		
	    // Outline
	    if(!cmp[?FFk.active]) draw_set_alpha(cmp[?FFk.fga]/2)
	    else draw_set_alpha(cmp[?FFk.fga])
	    draw_rectangle_color(xyr[0],xyr[1],xyr[2],xyr[3],cmp[?FFk.fgc][0],
	        cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],true)
		
	    // Arrow
	    draw_set_colour(cmp[?FFk.fgc][0])
	    if(!cmp[?FFk.active]) draw_set_alpha(cmp[?FFk.fga]/2)
	    else draw_set_alpha(cmp[?FFk.fga])
	    draw_triangle(rx,ry+asz,rx-asz,ry-asz,rx+asz,ry-asz,true)
		
	#endregion
	
	#region Interaction/Hilight Logic
		
	    var in_cmp = false // Used to return if mouse is inside button
		
	    // Drop arrow
	    if(mouse_x-M.FF.surface_xy[0] > xyr[0]-M.FF.margin.SM and mouse_x-M.FF.surface_xy[0] < xyr[2]+M.FF.margin.SM
	        and mouse_y-M.FF.surface_xy[1] > xyr[1]-M.FF.margin.SM and mouse_y-M.FF.surface_xy[1] < xyr[3]+M.FF.margin.SM
	        and cmp[?FFk.active] and (!M.FF.frame.menu_override or cmp[?FFk.state])
	         and !cmp[?FFk.override]) {
			
	        in_cmp = true
			
	        // Draw Button Highlight
	        if(M.FF.MBL) draw_set_alpha(cmp[?FFk.fga]*.05)
	        else draw_set_alpha(cmp[?FFk.fga]*.125)
	        draw_rectangle_color(xyr[0],xyr[1],xyr[2],xyr[3],cmp[?FFk.fgc][0],
	            cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],false)
			
	        // Arrow Filling
	        draw_set_colour(cmp[?FFk.fgc][0])
	        if(M.FF.MBL) draw_set_alpha(cmp[?FFk.fga]*.5)
	        else draw_set_alpha(cmp[?FFk.fga])
	        draw_triangle(rx,ry+asz,rx-asz,ry-asz,rx+asz,ry-asz,false)
			
	        if(M.FF.MBLR) cmp[?FFk.state] = !cmp[?FFk.state] // Toggle dropdown
			
	    } else if(mouse_x-M.FF.surface_xy[0] > menu[?FFk.xy][0]-M.FF.margin.SM and mouse_x-M.FF.surface_xy[0] < menu[?FFk.xy][2]+M.FF.margin.SM
	        and mouse_y-M.FF.surface_xy[1] > menu[?FFk.xy][1]-M.FF.margin.SM and mouse_y-M.FF.surface_xy[1] < menu[?FFk.xy][3]+M.FF.margin.SM
	        and cmp[?FFk.state]) in_cmp = true // In Menu?
	    else if(cmp[?FFk.state] and M.FF.MBLR) cmp[?FFk.state] = false // Click off menu
		
	    // Update Drowdown menu vars if needed
	    dropdown_update(cmp)
		
	#endregion
	
	#region Text
		
	    // Draw the selected option's text inside the dropdown field
	    var a
	    if(!cmp[?FFk.active]) a = cmp[?FFk.fga]/2
	    else a = cmp[?FFk.fga]
	    draw_set_halign(fa_middle)
	    draw_set_valign(fa_center)
	    var txt = opt[?FFk.arr][opt[?FFk.val]].str
	    var txtx = ((((cmp[?FFk.xy][2]-menu[?FFk.offx])-cmp[?FFk.xy][0])/2)+cmp[?FFk.xy][0])
	    var txty = (((cmp[?FFk.xy][3]-cmp[?FFk.xy][1])/2)+cmp[?FFk.xy][1])
	    var txtw = (cmp[?FFk.xy][2]-menu[?FFk.offx])-(cmp[?FFk.xy][0]+menu[?FFk.offx])
	    if(string_width_ext(txt,M.FF.margin.STR_H,txtw) < txtw)
	        draw_text_ext_color(txtx,txty,txt,M.FF.margin.STR_H,txtw,cmp[?FFk.fgc][0],
	            cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],a)
		
	#endregion
	
	// Return whether or not mouse inside btn
	return in_cmp
	
}

function entry_button_draw() {

	#region Params
    
	    var cmp = argument0
    
	#endregion

	#region Ref Action
    
	    switch(cmp[?FFk.action]) {
        
	        case FF_action.journal_entry: {
            
	            if(cmp[?FFk.ref] != noone) {
                
	                cmp[?FFk.str] = cmp[?FFk.ref][?FFk.uid]
	                // TODO Pin
	                var c = get_color_rgb(cmp[?FFk.ref][?FFk.color].rgb)
	                cmp[?FFk.bgc] = []
	                cmp[?FFk.bgc][0] = cmp[?FFk.ref][?FFk.color].rgb
	                cmp[?FFk.bgc][1] = cmp[?FFk.ref][?FFk.color].rgb
	                cmp[?FFk.bgc][2] = make_color_rgb(c[0]/2,c[1]/2,c[2]/2)
	                cmp[?FFk.bgc][3] = make_color_rgb(c[0]/2,c[1]/2,c[2]/2)
	                // TODO Notes
                
	            }
            
	            break
            
	        }
        
	        default: break
        
	    }
    
	#endregion

	#region Draw Body
    
	    // BG
	    draw_set_alpha(cmp[?FFk.bga])
	    draw_rectangle_color(cmp[?FFk.xy][0],cmp[?FFk.xy][1],cmp[?FFk.xy][2],cmp[?FFk.xy][3],
	        cmp[?FFk.bgc][0],cmp[?FFk.bgc][1],cmp[?FFk.bgc][2],cmp[?FFk.bgc][3],false)
    
	    // Outline
	    if(!cmp[?FFk.active]) draw_set_alpha(cmp[?FFk.fga]/2)
	    else draw_set_alpha(cmp[?FFk.fga])
	    draw_rectangle_color(cmp[?FFk.xy][0],cmp[?FFk.xy][1],cmp[?FFk.xy][2],cmp[?FFk.xy][3],
	        cmp[?FFk.fgc][0],cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],true)

	#endregion

	#region Interaction/Hilight Logic
    
	    var in_cmp = true // Used to return if mouse is inside button
	    if(mouse_x-M.FF.surface_xy[0] > cmp[?FFk.xy][0]-M.FF.margin.SM and mouse_x-M.FF.surface_xy[0] < cmp[?FFk.xy][2]+M.FF.margin.SM
	        and mouse_y-M.FF.surface_xy[1] > cmp[?FFk.xy][1]-M.FF.margin.SM and mouse_y-M.FF.surface_xy[1] < cmp[?FFk.xy][3]+M.FF.margin.SM
	        and cmp[?FFk.active] and !M.FF.frame.menu_override and !cmp[?FFk.override]) {
            
	        // Draw X
	        if(M.FF.MBL) draw_set_alpha(cmp[?FFk.fga]*.4)
	        else draw_set_alpha(cmp[?FFk.fga]*.8)
	        var h = cmp[?FFk.h]
	        var m = cmp[?FFk.h]*.2
	        var xy1 = [cmp[?FFk.xy][2]-(h-m),cmp[?FFk.xy][1]+m,cmp[?FFk.xy][2]-m,cmp[?FFk.xy][3]-m]
	        var xy2 = [cmp[?FFk.xy][2]-(h-m),cmp[?FFk.xy][3]-m,cmp[?FFk.xy][2]-m,cmp[?FFk.xy][1]+m]
	        var w = M.FF.margin.SM
            
	        if(mouse_x-M.FF.surface_xy[0] > xy1[0] and mouse_x-M.FF.surface_xy[0] < xy1[2]
	            and mouse_y-M.FF.surface_xy[1] > xy1[1] and mouse_y-M.FF.surface_xy[1] < xy1[3]
	            and cmp[?FFk.active] and !M.FF.frame.menu_override and !cmp[?FFk.override]
	            and cmp[?FFk.del_btn]) {
                
	            if(M.FF.MBL) draw_set_alpha(cmp[?FFk.fga]*.34)
	            else draw_set_alpha(cmp[?FFk.fga]*.5)
	            draw_rectangle_color(xy1[0]-M.FF.margin.SM,xy1[1]-M.FF.margin.SM,xy1[2]+M.FF.margin.SM,xy1[3]+M.FF.margin.SM,
	                cmp[?FFk.fgc][3],cmp[?FFk.fgc][2],cmp[?FFk.fgc][1],cmp[?FFk.fgc][0],false)
            
	            if(M.FF.MBLR) {
                
	                delete_entry(cmp)
	                return noone
                
	            }
            
	            // Set Alpha for X
	            draw_set_alpha(1)
            
	        } else {
            
	            // Draw Hilight
	            if(M.FF.MBL) draw_set_alpha(cmp[?FFk.fga]*0)
	            else draw_set_alpha(cmp[?FFk.fga]*.125)
	            draw_rectangle_color(cmp[?FFk.xy][0],cmp[?FFk.xy][1],cmp[?FFk.xy][2],cmp[?FFk.xy][3],
	                cmp[?FFk.fgc][0],cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],false)
            
	            // Do Action if Clicked on
	            if(M.FF.MBLR) {
                
	                // Undepress look
	                cmp[?FFk.bgc] = []
	                array_copy(cmp[?FFk.bgc],0,cmp[?FFk.bgc_o],0,array_length_1d(cmp[?FFk.bgc_o]))
                
	                // Button Action
	                entry_button_action(cmp)
                
	            } else if(M.FF.MBL and array_equals(cmp[?FFk.bgc],cmp[?FFk.bgc_o]))
	            cmp[?FFk.bgc] = invert_array(cmp[?FFk.bgc])  // Depress look
            
	            // Set Alpha for X
	            if(cmp[?FFk.del_btn]) draw_set_alpha(.5)
            
	        }
        
	        // Draw X if del_btn true
	        if(cmp[?FFk.del_btn]) {
            
	            draw_line_width_color(xy1[0],xy1[1],xy1[2],xy1[3],w,cmp[?FFk.fgc][0],cmp[?FFk.fgc][2])
	            draw_line_width_color(xy2[0],xy2[1],xy2[2],xy2[3],w,cmp[?FFk.fgc][3],cmp[?FFk.fgc][1])
            
	        }
    
	    } else {
        
	        in_cmp = false
        
	        // Undo depress look if outside button but orginally depressed button
	        if(!array_equals(cmp[?FFk.bgc],cmp[?FFk.bgc_o])) {
            
	            cmp[?FFk.bgc] = []
	            array_copy(cmp[?FFk.bgc],0,cmp[?FFk.bgc_o],0,array_length_1d(cmp[?FFk.bgc_o]))
            
	        }
        
	    }

	#endregion

	#region Text
    
	    var a
	    if(!cmp[?FFk.active]) a = cmp[?FFk.fga]/2
	    else a = cmp[?FFk.fga]
	    draw_set_halign(cmp[?FFk.hvalign][0])
	    draw_set_valign(cmp[?FFk.hvalign][1])
	    var txt = cmp[?FFk.str]
    
	    // X/Y Init as Middle/Center
	    var txtx = (((cmp[?FFk.xy][2]-cmp[?FFk.xy][0])/2)+cmp[?FFk.xy][0])
	    var txty = (((cmp[?FFk.xy][3]-cmp[?FFk.xy][1])/2)+cmp[?FFk.xy][1])
    
	    // Otherwise Init XY according to alignment
	    if(cmp[?FFk.hvalign][0] == fa_left) txtx = cmp[?FFk.xy][0]+M.FF.margin.MD
	    else if(cmp[?FFk.hvalign][0] == fa_right) txtx = cmp[?FFk.xy][2]-M.FF.margin.MD
	    if(cmp[?FFk.hvalign][1] == fa_top) txty = cmp[?FFk.xy][1]+M.FF.margin.MD
	    else if(cmp[?FFk.hvalign][1] == fa_bottom) txty = cmp[?FFk.xy][3]-M.FF.margin.MD
    
    
	    if(surface_get_target() != application_surface) gpu_set_blendmode(bm_dest_alpha)
    
	    var txtw = cmp[?FFk.xy][2]-cmp[?FFk.xy][0]
	    if(string_width_ext(txt,M.FF.margin.STR_H,txtw) < txtw)
	        draw_text_ext_color(txtx,txty,txt,M.FF.margin.STR_H,txtw,cmp[?FFk.fgc][0],
	            cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],a)
    
	    if(surface_get_target() != application_surface) gpu_set_blendmode(bm_normal)

	#endregion

	// Return whether or not mouse inside btn
	return in_cmp

}

function horiz_space_draw() {
	
	#region Params%CFG
		
	    var cmp = argument0
		
	#endregion
	
	switch(cmp[?FFk.type]) {
		
	    case FF_spacer.bar_fill:
	    case FF_spacer.bar_line: {
			
	        var fill = false
	        if(cmp[?FFk.type] == FF_spacer.bar_fill) fill = true
			
	        #region Draw Body
				
	            // BG
	            if(fill) {
					
	                draw_set_alpha(cmp[?FFk.bga])
	                draw_rectangle_color(cmp[?FFk.xy][0],cmp[?FFk.xy][1],cmp[?FFk.xy][2],cmp[?FFk.xy][3],
	                    cmp[?FFk.bgc][0],cmp[?FFk.bgc][1],cmp[?FFk.bgc][2],cmp[?FFk.bgc][3],false)
					
	            }
				
	            // Outline
	            draw_set_alpha(cmp[?FFk.fga])
	            draw_rectangle_color(cmp[?FFk.xy][0],cmp[?FFk.xy][1],cmp[?FFk.xy][2],cmp[?FFk.xy][3],
	                cmp[?FFk.fgc][0],cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],true)
				
	            // Init Text
	            var txt = cmp[?FFk.str]
	            // Init Text X/Y w/ Middle&Center
	            var txtx = lerp(cmp[?FFk.xy][0],cmp[?FFk.xy][2],0.5)
	            var txty = lerp(cmp[?FFk.xy][1],cmp[?FFk.xy][3],0.5)
	            var txtw = cmp[?FFk.xy][2]-cmp[?FFk.xy][0]
	            var txtwe = 0
				
	            if(cmp[?FFk.str] != "") {
					
	                draw_set_halign(cmp[?FFk.hvalign][0])
	                draw_set_valign(cmp[?FFk.hvalign][1])
					
	                // Text X Left/Right Align
	                if(cmp[?FFk.hvalign][0] == fa_left) txtx = cmp[?FFk.xy][0] + M.FF.margin.SM
	                else if(cmp[?FFk.hvalign][0] == fa_right) txtx = cmp[?FFk.xy][2] - M.FF.margin.SM
					
	                // Text Y Top/Bottom Align
	                if(cmp[?FFk.hvalign][1] == fa_top) txty = cmp[?FFk.xy][1] + M.FF.margin.SM
	                else if(cmp[?FFk.hvalign][1] == fa_bottom) txty = cmp[?FFk.xy][3] - M.FF.margin.SM
					
	                // Draw text
	                if(!fill) {
						
	                    if(string_width_ext(txt,M.FF.margin.STR_H,txtw) < txtw)
	                        draw_text_ext_color(txtx,txty,txt,M.FF.margin.STR_H,txtw,cmp[?FFk.fgc][0],
	                            cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],cmp[?FFk.fga])
						
	                } else {
						
	                    if(string_width_ext(txt,M.FF.margin.STR_H,txtw) < txtw)
	                        draw_text_ext_color(txtx,txty,txt,M.FF.margin.STR_H,txtw,cmp[?FFk.bgc][0],
	                            cmp[?FFk.bgc][1],cmp[?FFk.bgc][2],cmp[?FFk.bgc][3],cmp[?FFk.fga])
						  
	                }
					
	                // Get text drawn width
	                txtwe = string_width_ext(txt,M.FF.margin.STR_H,txtw)
	                if(cmp[?FFk.hvalign][0] == fa_middle) txtwe = txtwe/2
					
	            }
				
	        #endregion
			
	        break
			
	    }
		
	    case FF_spacer.line: {
			
	        // Init Line
	        var line_y = lerp(cmp[?FFk.xy][1],cmp[?FFk.xy][3],0.5)
			
	        // Init Text
	        var txt = cmp[?FFk.str]
	        // Init Text X/Y w/ Middle&Center
	        var txtx = lerp(cmp[?FFk.xy][0],cmp[?FFk.xy][2],0.5)
	        var txty = line_y-2 // Slight Adjustment to make text look more aligned
	        var txtw = cmp[?FFk.xy][2]-cmp[?FFk.xy][0]
	        var txtwe = 0
			
	        if(cmp[?FFk.str] != "") {
				
	            draw_set_halign(cmp[?FFk.hvalign][0])
	            draw_set_valign(cmp[?FFk.hvalign][1])
				
	            // Text X Left/Right Align
	            if(cmp[?FFk.hvalign][0] == fa_left) txtx = cmp[?FFk.xy][0]
	            else if(cmp[?FFk.hvalign][0] == fa_right) txtx = cmp[?FFk.xy][2]
				
	            // Text Y Top/Bottom Align
	            // valign is inversed here because we want to put text
	            // on TOP of the line or on BOTTOM of the line
	            if(cmp[?FFk.hvalign][1] == fa_top) {
					
	                draw_set_valign(fa_bottom)
	                txty += round(M.FF.margin.STR_H*.25)
	                line_y += round(M.FF.margin.STR_H*.5)
					
	            } else if(cmp[?FFk.hvalign][1] == fa_bottom) {
					
	                draw_set_valign(fa_top)
	                txty -= round(M.FF.margin.STR_H*.25)
	                line_y -= round(M.FF.margin.STR_H*.5)
					
	            }
				
	            // Draw text
	            if(string_width_ext(txt,M.FF.margin.STR_H,txtw) < txtw)
	                draw_text_ext_color(txtx,txty,txt,M.FF.margin.STR_H,txtw,cmp[?FFk.fgc][0],
	                    cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],cmp[?FFk.fga])
				
	            // Get text drawn width
	            txtwe = string_width_ext(txt,M.FF.margin.STR_H,txtw)
	            if(cmp[?FFk.hvalign][0] == fa_middle) txtwe = txtwe/2
				
	        }
			
	        var break_line = (cmp[?FFk.hvalign][1] == fa_center and cmp[?FFk.str] != "")
	        if(break_line) { // Break Line for Text
				
	            // Before
	            if(cmp[?FFk.hvalign][0] != fa_left) {
					
	                draw_set_alpha(cmp[?FFk.fga])
	                draw_line_width_color(cmp[?FFk.xy][0],line_y,txtx-txtwe-M.FF.margin.MD,line_y,
	                    cmp[?FFk.line_w],cmp[?FFk.fgc][0],cmp[?FFk.fgc][2])
					
	            }
				
	            // After
	            if(cmp[?FFk.hvalign][0] != fa_right) {
					
	                draw_set_alpha(cmp[?FFk.fga])
	                draw_line_width_color(txtx+txtwe+M.FF.margin.MD,line_y,cmp[?FFk.xy][2],line_y,
	                    cmp[?FFk.line_w],cmp[?FFk.fgc][0],cmp[?FFk.fgc][2])
					
	            }
				
	        } else { // Draw Full Line
				
	            draw_set_alpha(cmp[?FFk.fga])
	            draw_line_width_color(cmp[?FFk.xy][0],line_y,cmp[?FFk.xy][2],line_y,
	                cmp[?FFk.line_w],cmp[?FFk.fgc][0],cmp[?FFk.fgc][2])
				
	        }
			
	        break
			
	    }
		
	    case FF_spacer.str: {
			
	        // Init Text
	        var txt = cmp[?FFk.str]
	        // Init Text X/Y w/ Middle&Center
	        var txtx = lerp(cmp[?FFk.xy][0],cmp[?FFk.xy][2],0.5)
	        var txty = lerp(cmp[?FFk.xy][1],cmp[?FFk.xy][3],0.5) - M.FF.margin.SM
	        var txtw = cmp[?FFk.xy][2]-cmp[?FFk.xy][0]
	        var txtwe = 0
			
	        if(cmp[?FFk.str] != "") {
				
	            draw_set_halign(cmp[?FFk.hvalign][0])
	            draw_set_valign(cmp[?FFk.hvalign][1])
				
	            // Text X Left/Right Align
	            if(cmp[?FFk.hvalign][0] == fa_left) txtx = cmp[?FFk.xy][0]
	            else if(cmp[?FFk.hvalign][0] == fa_right) txtx = cmp[?FFk.xy][2]
				
	            // Text Y Top/Bottom Align
	            if(cmp[?FFk.hvalign][1] == fa_top) txty += M.FF.margin.SM
	            else if(cmp[?FFk.hvalign][1] == fa_bottom) txty -= M.FF.margin.SM
				
	            while(cmp[?FFk.fill] and string_width(txt)+string_width(cmp[?FFk.str]) < cmp[?FFk.w])
	                txt += cmp[?FFk.str]
				
	            // Draw text
	            if(string_width_ext(txt,M.FF.margin.STR_H,txtw) < txtw)
	                draw_text_ext_color(txtx,txty,txt,M.FF.margin.STR_H,txtw,cmp[?FFk.fgc][0],
	                    cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],cmp[?FFk.fga])
				
	            // Get text drawn width
	            txtwe = string_width_ext(txt,M.FF.margin.STR_H,txtw)
	            if(cmp[?FFk.hvalign][0] == fa_middle) txtwe = txtwe/2
				
	        }
			
	        break
			
	    }
		
	    case FF_spacer.str_cmplx: {
			
	        // Init Text
	        var txt = string_complex_inline(cmp[?FFk.str_arr])
	        // Init Text X/Y w/ Middle&Center
	        var txtx = lerp(cmp[?FFk.xy][0],cmp[?FFk.xy][2],0.5)
	        var txty = lerp(cmp[?FFk.xy][1],cmp[?FFk.xy][3],0.5) - M.FF.margin.SM
	        var txtw = cmp[?FFk.xy][2]-cmp[?FFk.xy][0]
	        var txtwe = 0
			
	        if(txt != "") {
				
	            draw_set_halign(cmp[?FFk.hvalign][0])
	            draw_set_valign(cmp[?FFk.hvalign][1])
				
	            // Text X Left/Right Align
	            if(cmp[?FFk.hvalign][0] == fa_left) txtx = cmp[?FFk.xy][0]
	            else if(cmp[?FFk.hvalign][0] == fa_right) txtx = cmp[?FFk.xy][2]
				
	            // Text Y Top/Bottom Align
	            if(cmp[?FFk.hvalign][1] == fa_top) txty += M.FF.margin.SM
	            else if(cmp[?FFk.hvalign][1] == fa_bottom) txty -= M.FF.margin.SM
				
	            // Draw text
	            if(string_width_ext(txt,M.FF.margin.STR_H,txtw) < txtw) {
	                draw_text_ext_color(txtx,txty,txt,M.FF.margin.STR_H,txtw,cmp[?FFk.fgc][0],
	                    cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],cmp[?FFk.fga])
	            }
				
	            // Get text drawn width
	            txtwe = string_width_ext(txt,M.FF.margin.STR_H,txtw)
	            if(cmp[?FFk.hvalign][0] == fa_middle) txtwe = txtwe/2
				
	        }
			
	        break
			
	    }
		
	    case FF_spacer.none: {
			
	        // Nothing duh; sweet sweet simplicity
	        break
			
	    }
		
	}
	
	// Return false since this isn'true really an interactable component
	return false
	
}

function input_field_draw() {
	
	#region Params
		
	    var cmp = argument0
	    var npt = cmp[?FFk.inp_cfg]
	    var crt = npt[?FFk.carot_cfg]
		
	#endregion
	
	// Init
	input_field_update(cmp)
	
	#region Draw Body
		
	    // BG
	    draw_set_alpha(cmp[?FFk.bga])
	    draw_rectangle_color(cmp[?FFk.xy][0],cmp[?FFk.xy][1],cmp[?FFk.xy][2],cmp[?FFk.xy][3],
	        cmp[?FFk.bgc][0],cmp[?FFk.bgc][1],cmp[?FFk.bgc][2],cmp[?FFk.bgc][3],false)
		
	    // Outline
	    if(!cmp[?FFk.active]) draw_set_alpha(cmp[?FFk.fga]/2)
	    else draw_set_alpha(cmp[?FFk.fga])
	    draw_rectangle_color(cmp[?FFk.xy][0],cmp[?FFk.xy][1],cmp[?FFk.xy][2],cmp[?FFk.xy][3],
	        cmp[?FFk.fgc][0],cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],true)
		
	#endregion
	
	#region Interaction/Hilight Logic
		
	    var in_cmp = true // Used to return if mouse is inside button
	    if(mouse_x-M.FF.surface_xy[0] > cmp[?FFk.xy][0]-M.FF.margin.SM and mouse_x-M.FF.surface_xy[0] < cmp[?FFk.xy][2]+M.FF.margin.SM
	        and mouse_y-M.FF.surface_xy[1] > cmp[?FFk.xy][1]-M.FF.margin.SM and mouse_y-M.FF.surface_xy[1] < cmp[?FFk.xy][3]+M.FF.margin.SM
	        and cmp[?FFk.active] and !cmp[?FFk.override]) {
			
	        // Draw Hilight (If not active)
	        if(!cmp[?FFk.state]) {
				
	            if(M.FF.MBL) {
					
	                // Clicking..
	                draw_set_alpha(cmp[?FFk.fga]*.05)
					
	                // Depress..
	                if(array_equals(cmp[?FFk.bgc],cmp[?FFk.bgc_o]))
	                    cmp[?FFk.bgc] = invert_array(cmp[?FFk.bgc])
					
	            } else {
					
	                // Not Clicking..
	                draw_set_alpha(cmp[?FFk.fga]*.125)
					
	                // Undepress..
	                if(!cmp[?FFk.state] and !array_equals(cmp[?FFk.bgc],cmp[?FFk.bgc_o]))
	                    cmp[?FFk.bgc] = array_dupe(cmp[?FFk.bgc],cmp[?FFk.bgc_o])
					
	            }
				
	            draw_rectangle_color(cmp[?FFk.xy][0],cmp[?FFk.xy][1],cmp[?FFk.xy][2],cmp[?FFk.xy][3],
	                cmp[?FFk.fgc][0],cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],false)
				
	        }
			
	        // Do Action if Clicked on
	        if(M.FF.MBLR and M.FF.runtime_frame_delay = 0) {
				
	            cmp[?FFk.state] = true
	            keyboard_string = npt[?FFk.str] // So we don'true overwrite what we had on component
				
	            // Depress..
	            if(array_equals(cmp[?FFk.bgc],cmp[?FFk.bgc_o]))
	                cmp[?FFk.bgc] = invert_array(cmp[?FFk.bgc])
				
	        }
			
	    } else if(cmp[?FFk.state] and M.FF.MBLR) {
			
	        cmp[?FFk.state] = false
	        keyboard_string = ""
	        input_field_action(cmp)
	        M.FF.frame.menu_override = false
	        M.FF.frame.component_focus = noone
	        M.FF.runtime_frame_delay = 2
			
	        // Undepress..
	        if(!cmp[?FFk.state] and !array_equals(cmp[?FFk.bgc],cmp[?FFk.bgc_o]))
	            cmp[?FFk.bgc] = array_dupe(cmp[?FFk.bgc],cmp[?FFk.bgc_o])
			
	    } else {
			
	        in_cmp = false
			
	        // Depress..
	        if(cmp[?FFk.state] and array_equals(cmp[?FFk.bgc],cmp[?FFk.bgc_o]))
	            cmp[?FFk.bgc] = invert_array(cmp[?FFk.bgc])
	        // Undepress..
	        else if(!cmp[?FFk.state] and !array_equals(cmp[?FFk.bgc],cmp[?FFk.bgc_o]))
	            cmp[?FFk.bgc] = array_dupe(cmp[?FFk.bgc],cmp[?FFk.bgc_o])
			
	    }
		
	    if(cmp[?FFk.state]) {
			
	        M.FF.frame.menu_override = true
	        M.FF.frame.component_focus = cmp
			
	        // Inits
	        crt[?FFk.xy][0] = (cmp[?FFk.xy][0]+(M.FF.margin.SM*1.5))+string_width(npt[?FFk.str])
	        crt[?FFk.xy][1] = cmp[?FFk.xy][1]+M.FF.margin.SM
	        crt[?FFk.xy][2] = cmp[?FFk.xy][0]+M.FF.margin.STR_H+string_width(npt[?FFk.str])
	        crt[?FFk.xy][3] = cmp[?FFk.xy][3]-M.FF.margin.SM
			
	        #region Logic & Draw Input/Carot
				
	            #region Input Logic
					
	                // Trim whitespace
	                keyboard_string = string_trim2(keyboard_string,true,true,false)
					
	                // Trim inp_str if bigger than frame
	                while (crt[?FFk.xy][2] >= cmp[?FFk.xy][2]-M.FF.margin.SM
	                    or (npt[?FFk.limit] != noone and string_length(keyboard_string) > npt[?FFk.limit])) {
						
	                    // Trim from Input and update inp_str again
	                    keyboard_string = string_copy(keyboard_string,0,string_length(keyboard_string)-1)
	                    npt[?FFk.str] = keyboard_string
						
	                    // Reupdate Carot POS
	                    crt[?FFk.xy][0] = (cmp[?FFk.xy][0]+M.FF.margin.SM)+string_width(npt[?FFk.str])
	                    crt[?FFk.xy][2] = crt[?FFk.xy][0]+M.FF.margin.STR_H
						
	                }
					
	                // Apply Input Rules
	                if(keyboard_string != npt[?FFk.str]) {
						
	                    if(npt[?FFk.type] == FF_input.num and keyboard_string != "-") {
	                        npt[?FFk.str] = string_num(keyboard_string)
	                    } else if(npt[?FFk.type] == FF_input.posnum) {
	                        npt[?FFk.str] = string_posnum(keyboard_string)
	                    } else if(npt[?FFk.type] == FF_input.negnum and keyboard_string != "-") {
	                        npt[?FFk.str] = string_negnum(keyboard_string)
	                    } else if(npt[?FFk.type] == FF_input.alpha) {
	                        npt[?FFk.str] = string_alpha(keyboard_string)
	                    } else if(npt[?FFk.type] == FF_input.alphanum) {
	                        npt[?FFk.str] = string_alphanum(keyboard_string)
	                    } else npt[?FFk.str] = keyboard_string
	                    keyboard_string = npt[?FFk.str]
						
	                }
					
	                // Enter Input
	                if(M.FF.key_enter_p) {
						
	                    cmp[?FFk.state] = false
	                    keyboard_string = ""
	                    input_field_action(cmp)
	                    M.FF.frame.menu_override = false
	                    M.FF.frame.component_focus = noone
	                    M.FF.runtime_frame_delay = 2
						
	                }
					
	            #endregion
				
	            // Carot
	            if(M.FF.runtime_frame <= room_speed/2) draw_set_alpha(cmp[?FFk.fga])
	            else draw_set_alpha(0)
	            draw_rectangle_color(crt[?FFk.xy][0],crt[?FFk.xy][1],crt[?FFk.xy][2],crt[?FFk.xy][3],
	                cmp[?FFk.fgc][0],cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],false)
				
	        #endregion
			
	    }
		
	    // Text
	    var a
	    if(!cmp[?FFk.active]) a = cmp[?FFk.fga]/2
	    else a = cmp[?FFk.fga]
	    var txt = npt[?FFk.str]
	    var txtx = cmp[?FFk.xy][0]+M.FF.margin.SM
	    var txty = cmp[?FFk.xy][1]+M.FF.margin.SM
	    var txtw = string_width(txt)
	    var txth = string_height(txt)
	    draw_set_halign(fa_left)
	    draw_set_valign(fa_top)
	    draw_text_color(cmp[?FFk.xy][0]+M.FF.margin.SM,cmp[?FFk.xy][1]+M.FF.margin.SM,npt[?FFk.str],
	        cmp[?FFk.fgc][0],cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],a)
		
	#endregion
	
	#region Text
		
	    var a
	    if(!cmp[?FFk.active]) a = cmp[?FFk.fga]/2
	    else a = cmp[?FFk.fga]
	    draw_set_halign(fa_left)
	    draw_set_valign(fa_bottom)
	    var txt = cmp[?FFk.str]
	    var txtx = cmp[?FFk.xy][0]
	    var txty = cmp[?FFk.xy][1]-M.FF.margin.SM
	    var txtw = npt[?FFk.w]
	    if(string_width_ext(txt,M.FF.margin.STR_H,txtw) <= txtw)
	        draw_text_ext_color(txtx,txty,txt,M.FF.margin.STR_H,txtw,cmp[?FFk.fgc][0],
	            cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],a)
		
	#endregion
	
	// Return whether or not mouse inside btn
	return in_cmp
	
}

function iterator_draw() {
	
	#region Params&CFG
		
	    var cmp = argument0
	    var opt = cmp[?FFk.opt_cfg]
		
	#endregion
	
	// Calc Inits
	var cmp_h = cmp[?FFk.xy][3] - cmp[?FFk.xy][1]
	
	#region Draw Body
		
	    // BG
	    draw_set_alpha(cmp[?FFk.bga])
	    draw_rectangle_color(cmp[?FFk.xy][0]+cmp_h,cmp[?FFk.xy][1],cmp[?FFk.xy][2]-cmp_h,cmp[?FFk.xy][3],
	        cmp[?FFk.bgc][0],cmp[?FFk.bgc][1],cmp[?FFk.bgc][2],cmp[?FFk.bgc][3],false)
		
	    // Outline
	    if(!cmp[?FFk.active]) draw_set_alpha(cmp[?FFk.fga]/2)
	    else draw_set_alpha(cmp[?FFk.fga])
	    draw_rectangle_color(cmp[?FFk.xy][0]+cmp_h,cmp[?FFk.xy][1],cmp[?FFk.xy][2]-cmp_h,cmp[?FFk.xy][3],
	        cmp[?FFk.fgc][0],cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],true)
		
	#endregion
	
	#region Draw Arrows & Value Display
		
	    // Inits
	    var asz = round(cmp_h*.25) // Arrow Size
	    // Left
	    var xyl
	    xyl[0] = cmp[?FFk.xy][0]
	    xyl[1] = cmp[?FFk.xy][1]
	    xyl[2] = cmp[?FFk.xy][0]+cmp_h
	    xyl[3] = cmp[?FFk.xy][3]
	    var lx = xyl[0]+((xyl[2]-xyl[0])/2)
	    var ly = xyl[1]+((xyl[3]-xyl[1])/2)
	    // Value Demo
	    var xyv
	    xyv[0] = cmp[?FFk.xy][2]-cmp_h
	    xyv[1] = cmp[?FFk.xy][1]
	    xyv[2] = cmp[?FFk.xy][2]
	    xyv[3] = cmp[?FFk.xy][3]
	    var vx = xyv[0]+((xyv[2]-xyv[0])/2)
	    var vy = xyv[1]+((xyv[3]-xyv[1])/2)
	    // Right
	    var xyr
	    xyr[0] = xyv[0]-cmp_h
	    xyr[1] = cmp[?FFk.xy][1]
	    xyr[2] = xyv[0]
	    xyr[3] = cmp[?FFk.xy][3]
	    var rx = xyr[0]+((xyr[2]-xyr[0])/2)
	    var ry = xyr[1]+((xyr[3]-xyr[1])/2)
		
	    // Left (Depress Check)
	    if(mouse_x-M.FF.surface_xy[0] > xyl[0]-M.FF.margin.SM and mouse_x-M.FF.surface_xy[0] < xyl[2]+M.FF.margin.SM
	        and mouse_y-M.FF.surface_xy[1] > xyl[1]-M.FF.margin.SM and mouse_y-M.FF.surface_xy[1] < xyl[3]+M.FF.margin.SM
	        and cmp[?FFk.active] and !M.FF.frame.menu_override and !cmp[?FFk.override])
	        if(M.FF.MBL and array_equals(cmp[?FFk.bgc],cmp[?FFk.bgc_o]))
	            cmp[?FFk.bgc] = invert_array(cmp[?FFk.bgc])
		
	    // Left
	    // BG
	    draw_set_alpha(cmp[?FFk.bga])
	    draw_rectangle_color(xyl[0],xyl[1],xyl[2],xyl[3],cmp[?FFk.bgc][0],
	        cmp[?FFk.bgc][1],cmp[?FFk.bgc][2],cmp[?FFk.bgc][3],false)
		
	    // Undepress..
	    if(!array_equals(cmp[?FFk.bgc],cmp[?FFk.bgc_o]))
	        cmp[?FFk.bgc] = array_dupe(cmp[?FFk.bgc],cmp[?FFk.bgc_o])
		
	    // Outline
	    if(!cmp[?FFk.active]) draw_set_alpha(cmp[?FFk.fga]/2)
	    else draw_set_alpha(cmp[?FFk.fga])
	    draw_rectangle_color(xyl[0],xyl[1],xyl[2],xyl[3],cmp[?FFk.fgc][0],
	        cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],true)
		
	    // Arrow
	    draw_set_color(cmp[?FFk.fgc][0])
	    if(!cmp[?FFk.active]) draw_set_alpha(cmp[?FFk.fga]/2)
	    else draw_set_alpha(cmp[?FFk.fga])
	    draw_triangle(lx-asz,ly,lx+asz,ly+asz,lx+asz,ly-asz,true)
		
	    // Color Demo
	    // BG
	    draw_set_alpha(cmp[?FFk.bga])
	    draw_rectangle_color(xyv[0],xyv[1],xyv[2],xyv[3],cmp[?FFk.bgc][0],
	        cmp[?FFk.bgc][1],cmp[?FFk.bgc][2],cmp[?FFk.bgc][3],false)
		
	    // Outline
	    if(!cmp[?FFk.active]) draw_set_alpha(cmp[?FFk.fga]/2)
	    else draw_set_alpha(cmp[?FFk.fga])
	    draw_rectangle_color(xyv[0],xyv[1],xyv[2],xyv[3],cmp[?FFk.fgc][0],
	        cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],true)
		
	    // Value
	    var a
	    if(!cmp[?FFk.active]) a = cmp[?FFk.fga]/2
	    else a = cmp[?FFk.fga]
	    draw_set_halign(fa_middle)
	    draw_set_valign(fa_center)
	    var txt = string_capital_all(opt[?FFk.val])
	    var txtx = (((xyv[2]-xyv[0])/2)+xyv[0])
	    var txty = (((cmp[?FFk.xy][3]-cmp[?FFk.xy][1])/2)+cmp[?FFk.xy][1])
	    var txtw = (xyv[2]-xyv[0])
	    if(string_width_ext(txt,M.FF.margin.STR_H,txtw) < txtw)
	        draw_text_ext_color(txtx,txty,txt,M.FF.margin.STR_H,txtw,cmp[?FFk.fgc][0],
	            cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],a)
		
	    // Right (Depress Check)
	    if(mouse_x-M.FF.surface_xy[0] > xyr[0]-M.FF.margin.SM and mouse_x-M.FF.surface_xy[0] < xyr[2]+M.FF.margin.SM
	        and mouse_y-M.FF.surface_xy[1] > xyr[1]-M.FF.margin.SM and mouse_y-M.FF.surface_xy[1] < xyr[3]+M.FF.margin.SM
	        and cmp[?FFk.active] and !M.FF.frame.menu_override and !cmp[?FFk.override])
	        if(M.FF.MBL and array_equals(cmp[?FFk.bgc],cmp[?FFk.bgc_o]))
	            cmp[?FFk.bgc] = invert_array(cmp[?FFk.bgc])
		
	    // Right
	    // BG
	    draw_set_alpha(cmp[?FFk.bga])
	    draw_rectangle_color(xyr[0],xyr[1],xyr[2],xyr[3],cmp[?FFk.bgc][0],
	        cmp[?FFk.bgc][1],cmp[?FFk.bgc][2],cmp[?FFk.bgc][3],false)
		
	    // Undepress..
	    if(!array_equals(cmp[?FFk.bgc],cmp[?FFk.bgc_o]))
	        cmp[?FFk.bgc] = array_dupe(cmp[?FFk.bgc],cmp[?FFk.bgc_o])
		
	    // Outline
	    if(!cmp[?FFk.active]) draw_set_alpha(cmp[?FFk.fga]/2)
	    else draw_set_alpha(cmp[?FFk.fga])
	    draw_rectangle_color(xyr[0],xyr[1],xyr[2],xyr[3],cmp[?FFk.fgc][0],
	        cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],true)
		
	    // Arrow
	    draw_set_colour(cmp[?FFk.fgc][0])
	    if(!cmp[?FFk.active]) draw_set_alpha(cmp[?FFk.fga]/2)
	    else draw_set_alpha(cmp[?FFk.fga])
	    draw_triangle(rx+asz,ry,rx-asz,ry+asz,rx-asz,ry-asz,true)
		
	#endregion
	
	#region Interaction/Hilight Logic
		
	    var in_cmp = false // Used to return if mouse is inside button
		
	    // Left
	    if(mouse_x-M.FF.surface_xy[0] > xyl[0]-M.FF.margin.SM and mouse_x-M.FF.surface_xy[0] < xyl[2]+M.FF.margin.SM
	        and mouse_y-M.FF.surface_xy[1] > xyl[1]-M.FF.margin.SM and mouse_y-M.FF.surface_xy[1] < xyl[3]+M.FF.margin.SM
	        and cmp[?FFk.active] and !M.FF.frame.menu_override and !cmp[?FFk.override]) {
			
	        in_cmp = true
	        // Draw Hilight 
	        if(M.FF.MBL) draw_set_alpha(cmp[?FFk.fga]*.05)
	        else draw_set_alpha(cmp[?FFk.fga]*.125)
	        draw_rectangle_color(xyl[0],xyl[1],xyl[2],xyl[3],cmp[?FFk.fgc][0],
	            cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],false)
			
	        // Arrow
	        draw_set_colour(cmp[?FFk.fgc][0])
	        if(M.FF.MBL) draw_set_alpha(cmp[?FFk.fga]*.5)
	        else draw_set_alpha(cmp[?FFk.fga])
	        draw_triangle(lx-asz,ly,lx+asz,ly+asz,lx+asz,ly-asz,false)
			
	        if(M.FF.MBLR and opt[?FFk.val] > opt[?FFk.val_mn])
	            iterator_action(cmp,-1)
			
	    }
		
	    // Right
	    if(mouse_x-M.FF.surface_xy[0] > xyr[0]-M.FF.margin.SM and mouse_x-M.FF.surface_xy[0] < xyr[2]+M.FF.margin.SM
	        and mouse_y-M.FF.surface_xy[1] > xyr[1]-M.FF.margin.SM and mouse_y-M.FF.surface_xy[1] < xyr[3]+M.FF.margin.SM
	        and cmp[?FFk.active] and !M.FF.frame.menu_override and !cmp[?FFk.override]) {
			
	        in_cmp = true
	        // Draw Hilight
	        if(M.FF.MBL) draw_set_alpha(cmp[?FFk.fga]*.05)
	        else draw_set_alpha(cmp[?FFk.fga]*.125)
	        draw_rectangle_color(xyr[0],xyr[1],xyr[2],xyr[3],cmp[?FFk.fgc][0],
	            cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],false)
			
	        // Arrow
	        draw_set_colour(cmp[?FFk.fgc][0])
	        if(M.FF.MBL) draw_set_alpha(cmp[?FFk.fga]*.5)
	        else draw_set_alpha(cmp[?FFk.fga])
	        draw_triangle(rx+asz,ry,rx-asz,ry+asz,rx-asz,ry-asz,false)
			
	        if(M.FF.MBLR and opt[?FFk.val] < opt[?FFk.val_mx])
	            iterator_action(cmp,1)
			
	    }
		
	#endregion
	
	#region Text
		
	    var a
	    if(!cmp[?FFk.active]) a = cmp[?FFk.fga]/2
	    else a = cmp[?FFk.fga]
	    draw_set_halign(fa_middle)
	    draw_set_valign(fa_center)
	    var txt = string_capital_all(opt[?FFk.str])
	    var txtx = (((xyr[0]-xyl[2])/2)+xyl[2])
	    var txty = (((cmp[?FFk.xy][3]-cmp[?FFk.xy][1])/2)+cmp[?FFk.xy][1])
	    var txtw = (cmp[?FFk.xy][2]-cmp_h)-(cmp[?FFk.xy][0]+cmp_h)
	    if(string_width_ext(txt,M.FF.margin.STR_H,txtw) < txtw)
	        draw_text_ext_color(txtx,txty,txt,M.FF.margin.STR_H,txtw,cmp[?FFk.fgc][0],
	            cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],a)
		
	#endregion
	
	// Return whether or not mouse inside btn
	return in_cmp
	
}

function label_draw() {
	
	#region Params
		
	    var cmp = argument0
		
	#endregion
	
	#region Text
		
	    // Init
	    draw_set_halign(cmp[?FFk.hvalign][0])
	    draw_set_valign(cmp[?FFk.hvalign][1])
	    var txt = cmp[?FFk.str]
	    var txtx = cmp[?FFk.xy][0]                            // Init as fa_left
	    var txty = lerp(cmp[?FFk.xy][1],cmp[?FFk.xy][3],0.5)    // Init as fa_center
		
	    // Adjust middle/right align
	    if(cmp[?FFk.hvalign][0] == fa_middle or cmp[?FFk.hvalign][0] == fa_center)
	        txtx = lerp(cmp[?FFk.xy][0],cmp[?FFk.xy][2],0.5)
	    else if(cmp[?FFk.hvalign][0] == fa_right) txtx = cmp[?FFk.xy][2]
		
	    // Adjust top/bottom align
	    if(cmp[?FFk.hvalign][1] == fa_top) txty = cmp[?FFk.xy][1]
	    else if(cmp[?FFk.hvalign][1] == fa_bottom) txty = cmp[?FFk.xy][3]
		
	    if(string_width_ext(txt,M.FF.margin.STR_H,cmp[?FFk.w_mx]) < cmp[?FFk.w_mx])
	        draw_text_ext_color(txtx,txty,txt,M.FF.margin.STR_H,cmp[?FFk.w_mx],cmp[?FFk.fgc][0],
	            cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],cmp[?FFk.fga])
		
	    /*
	    // Set Bounds if Able
	    cmp[?FFk.bound] = [noone,noone,noone,noone]
	    if(cmp[?FFk.hvalign][0] == fa_left) {
        
	        cmp[?FFk.bound][2] = cmp[?FFk.xy][0] + string_width_ext(txt,M.FF.margin.STR_H,cmp[?FFk.w_mx]) + M.FF.margin.STR_H
        
	    }
	    */
		
	#endregion
	
	// in_btn does not apply to labels
	return false
	
}

function multi_field_draw() {
	
	#region Params & CFGs
		
	    var cmp = argument0
	    var cStr = cmp[?FFk.str_cfg]
	    var crt = cmp[?FFk.carot_cfg]
		
	#endregion
	
	#region Text
		
	    #region Keyboard Input to String Config
			
	        // Init
	        var listy = ds_list_size(cStr[?FFk.list_2d])-1
	        var listx = ds_list_size(cStr[?FFk.list_2d][|listy])
			
	        if(cmp[?FFk.selected]) {
				
	            if(cStr[?FFk.type] == FF_input.num and keyboard_string != "-") {
	                cStr[?FFk.str] = string_num(keyboard_string)
	            } else if(cStr[?FFk.type] == FF_input.posnum) {
	                cStr[?FFk.str] = string_posnum(keyboard_string)
	            } else if(cStr[?FFk.type] == FF_input.negnum and keyboard_string != "-") {
	                cStr[?FFk.str] = string_negnum(keyboard_string)
	            } else if(cStr[?FFk.type] == FF_input.alpha) {
	                cStr[?FFk.str] = string_alpha(keyboard_string)
	            } else if(cStr[?FFk.type] == FF_input.alphanum) {
	                cStr[?FFk.str] = string_alphanum(keyboard_string)
	            } else cStr[?FFk.str] = keyboard_string
				
	            if(M.FF.caps_lock) cStr[?FFk.str] = string_upper(cStr[?FFk.str])
	            keyboard_string = string_char_at(cStr[?FFk.str],0)
				
	            // Add to list
	            if(keyboard_string != "") {
					
	                if(crt[?FFk.carot_end]) cStr[?FFk.list_2d][|listy][|listx] = keyboard_string
	                else {
						
	                    if(cmp[?FFk.overwrite]) {
							
	                        cStr[?FFk.list_2d][|crt[?FFk.yy]][|crt[?FFk.xx]+1] = keyboard_string
	                        crt[?FFk.xx] += 1
							
	                    } else {
							
	                        ds_list_insert(cStr[?FFk.list_2d][|crt[?FFk.yy]],crt[?FFk.xx]+1,keyboard_string)
	                        crt[?FFk.xx] += 1
							
	                    }
						
	                }
					
	                keyboard_string = ""
					
	            }
				
	            if(M.FF.key_enter_p) {
					
	                if(crt[?FFk.carot_end]) {
						
	                    ds_list_add(cStr[?FFk.list_2d],ds_list_create())
	                    keyboard_string = ""
	                    cStr[?FFk.str] = ""
	                    crt[?FFk.yy] += 1
	                    crt[?FFk.xx] = -1
						
	                } else {
						
	                    ds_list_insert(cStr[?FFk.list_2d],crt[?FFk.yy]+1,list_split(cStr[?FFk.list_2d][|crt[?FFk.yy]],crt[?FFk.xx]+1,true))
	                    keyboard_string = ""
	                    cStr[?FFk.str] = ""
	                    crt[?FFk.yy] += 1
	                    crt[?FFk.xx] = -1
						
	                }
					
	            } else if(M.FF.key_back_p) {
					
	                if(crt[?FFk.carot_end]) { // End of Text
						
	                    if(!ds_list_empty(cStr[?FFk.list_2d][|listy]))
	                        ds_list_delete(cStr[?FFk.list_2d][|listy],listx-1) // Delete prv char
	                    else if(ds_list_empty(cStr[?FFk.list_2d][|listy]) and listy > 0) {
							
	                        // Get end xx of last line
	                        var listx2 = ds_list_size(cStr[?FFk.list_2d][|listy-1])
							
	                        // Destroy line/list
	                        ds_list_destroy(cStr[?FFk.list_2d][|listy])
	                        ds_list_delete(cStr[?FFk.list_2d],listy)
							
	                    }
						
	                } else { // Not end of Text
						
	                    if(crt[?FFk.xx] > -1) {
							
	                        // Delete Prv Char
	                        ds_list_delete(cStr[?FFk.list_2d][|crt[?FFk.yy]],crt[?FFk.xx])
	                        crt[?FFk.xx] -= 1
							
	                     } else if(crt[?FFk.yy] > 0) {
							
	                        // Get end xx of last line before joining
	                        var listx2 = ds_list_size(cStr[?FFk.list_2d][|crt[?FFk.yy]-1])-1
							
	                        // Join line to previous
	                        list_join(cStr[?FFk.list_2d][|crt[?FFk.yy]],cStr[?FFk.list_2d][|crt[?FFk.yy]-1],noone,true)
	                        ds_list_delete(cStr[?FFk.list_2d],crt[?FFk.yy])
	                        crt[?FFk.yy] -= 1
	                        crt[?FFk.xx] = listx2
	                        listy -= 1
							
	                    }
						
	                }
					
	            } else if(M.FF.key_heldi > room_speed/2) {
					
	                #region Repeat Input Logic
						
	                    if(M.FF.key_heldi < room_speed*2.5) {
							
	                        if(M.FF.key_back and M.FF.runtime_frame%5 == 0) {
								
	                            if(crt[?FFk.carot_end]) { // End of Text
									
	                                if(!ds_list_empty(cStr[?FFk.list_2d][|listy]))
	                                    ds_list_delete(cStr[?FFk.list_2d][|listy],listx-1) // Delete prv char
	                                else if(ds_list_empty(cStr[?FFk.list_2d][|listy]) and listy > 0) {
										
	                                    // Get end xx of last line
	                                    var listx2 = ds_list_size(cStr[?FFk.list_2d][|listy-1])
										
	                                    // Destroy line/list
	                                    ds_list_destroy(cStr[?FFk.list_2d][|listy])
	                                    ds_list_delete(cStr[?FFk.list_2d],listy)
										
	                                }
									
	                            } else { // Not end of Text
									
	                                if(crt[?FFk.xx] > -1) {
										
	                                    // Delete Prv Char
	                                    ds_list_delete(cStr[?FFk.list_2d][|crt[?FFk.yy]],crt[?FFk.xx])
	                                    crt[?FFk.xx] -= 1
										
	                                 } else if(crt[?FFk.yy] > 0) {
										
	                                    // Get end xx of last line before joining
	                                    var listx2 = ds_list_size(cStr[?FFk.list_2d][|crt[?FFk.yy]-1])-1
										
	                                    // Join line to previous
	                                    list_join(cStr[?FFk.list_2d][|crt[?FFk.yy]],cStr[?FFk.list_2d][|crt[?FFk.yy]-1],noone,true)
	                                    ds_list_delete(cStr[?FFk.list_2d],crt[?FFk.yy])
	                                    crt[?FFk.yy] -= 1
	                                    crt[?FFk.xx] = listx2
	                                    listy -= 1
										
	                                }
									
	                            }
								
	                        }
							
	                        if(M.FF.key_enter and M.FF.runtime_frame%5 == 0) {
								
	                            if(crt[?FFk.carot_end]) {
									
	                                ds_list_add(cStr[?FFk.list_2d],ds_list_create())
	                                keyboard_string = ""
	                                cStr[?FFk.str] = ""
	                                crt[?FFk.yy] += 1
	                                crt[?FFk.xx] = -1
									
	                            } else {
									
	                                ds_list_insert(cStr[?FFk.list_2d],crt[?FFk.yy]+1,list_split(cStr[?FFk.list_2d][|crt[?FFk.yy]],crt[?FFk.xx]+1,true))
	                                keyboard_string = ""
	                                cStr[?FFk.str] = ""
	                                crt[?FFk.yy] += 1
	                                crt[?FFk.xx] = -1
									
	                            }
								
	                        }
							
	                    } else if (M.FF.key_heldi < room_speed*5) {
							
	                        if(M.FF.key_back and M.FF.runtime_frame%2 == 0) {
								
	                            if(crt[?FFk.carot_end]) { // End of Text
									
	                                if(!ds_list_empty(cStr[?FFk.list_2d][|listy]))
	                                    ds_list_delete(cStr[?FFk.list_2d][|listy],listx-1) // Delete prv char
	                                else if(ds_list_empty(cStr[?FFk.list_2d][|listy]) and listy > 0) {
										
	                                    // Get end xx of last line
	                                    var listx2 = ds_list_size(cStr[?FFk.list_2d][|listy-1])
										
	                                    // Destroy line/list
	                                    ds_list_destroy(cStr[?FFk.list_2d][|listy])
	                                    ds_list_delete(cStr[?FFk.list_2d],listy)
										
	                                }
									
	                            } else { // Not end of Text
									
	                                if(crt[?FFk.xx] > -1) {
										
	                                    // Delete Prv Char
	                                    ds_list_delete(cStr[?FFk.list_2d][|crt[?FFk.yy]],crt[?FFk.xx])
	                                    crt[?FFk.xx] -= 1
										
	                                 } else if(crt[?FFk.yy] > 0) {
										
	                                    // Get end xx of last line before joining
	                                    var listx2 = ds_list_size(cStr[?FFk.list_2d][|crt[?FFk.yy]-1])-1
										
	                                    // Join line to previous
	                                    list_join(cStr[?FFk.list_2d][|crt[?FFk.yy]],cStr[?FFk.list_2d][|crt[?FFk.yy]-1],noone,true)
	                                    ds_list_delete(cStr[?FFk.list_2d],crt[?FFk.yy])
	                                    crt[?FFk.yy] -= 1
	                                    crt[?FFk.xx] = listx2
	                                    listy -= 1
										
	                                }
									
	                            }
								
	                        }
							
	                        if(M.FF.key_enter and M.FF.runtime_frame%2 == 0) {
								
	                            if(crt[?FFk.carot_end]) {
									
	                                ds_list_add(cStr[?FFk.list_2d],ds_list_create())
	                                keyboard_string = ""
	                                cStr[?FFk.str] = ""
	                                crt[?FFk.yy] += 1
	                                crt[?FFk.xx] = -1
									
	                            } else {
									
	                                ds_list_insert(cStr[?FFk.list_2d],crt[?FFk.yy]+1,list_split(cStr[?FFk.list_2d][|crt[?FFk.yy]],crt[?FFk.xx]+1,true))
	                                keyboard_string = ""
	                                cStr[?FFk.str] = ""
	                                crt[?FFk.yy] += 1
	                                crt[?FFk.xx] = -1
									
	                            }
								
	                        }
							
	                    } else {
							
	                        if(M.FF.key_back) {
								
	                            if(crt[?FFk.carot_end]) { // End of Text
									
	                                if(!ds_list_empty(cStr[?FFk.list_2d][|listy]))
	                                    ds_list_delete(cStr[?FFk.list_2d][|listy],listx-1) // Delete prv char
	                                else if(ds_list_empty(cStr[?FFk.list_2d][|listy]) and listy > 0) {
										
	                                    // Get end xx of last line
	                                    var listx2 = ds_list_size(cStr[?FFk.list_2d][|listy-1])
										
	                                    // Destroy line/list
	                                    ds_list_destroy(cStr[?FFk.list_2d][|listy])
	                                    ds_list_delete(cStr[?FFk.list_2d],listy)
										
	                                }
									
	                            } else { // Not end of Text
									
	                                if(crt[?FFk.xx] > -1) {
										
	                                    // Delete Prv Char
	                                    ds_list_delete(cStr[?FFk.list_2d][|crt[?FFk.yy]],crt[?FFk.xx])
	                                    crt[?FFk.xx] -= 1
										
	                                 } else if(crt[?FFk.yy] > 0) {
										
	                                    // Get end xx of last line before joining
	                                    var listx2 = ds_list_size(cStr[?FFk.list_2d][|crt[?FFk.yy]-1])-1
										
	                                    // Join line to previous
	                                    list_join(cStr[?FFk.list_2d][|crt[?FFk.yy]],cStr[?FFk.list_2d][|crt[?FFk.yy]-1],noone,true)
	                                    ds_list_delete(cStr[?FFk.list_2d],crt[?FFk.yy])
	                                    crt[?FFk.yy] -= 1
	                                    crt[?FFk.xx] = listx2
	                                    listy -= 1
										
	                                }
									
	                            }
								
	                        }
							
	                        if(M.FF.key_enter) {
								
	                            if(crt[?FFk.carot_end]) {
									
	                                ds_list_add(cStr[?FFk.list_2d],ds_list_create())
	                                keyboard_string = ""
	                                cStr[?FFk.str] = ""
	                                crt[?FFk.yy] += 1
	                                crt[?FFk.xx] = -1
									
	                            } else {
									
	                                ds_list_insert(cStr[?FFk.list_2d],crt[?FFk.yy]+1,list_split(cStr[?FFk.list_2d][|crt[?FFk.yy]],crt[?FFk.xx]+1,true))
	                                keyboard_string = ""
	                                cStr[?FFk.str] = ""
	                                crt[?FFk.yy] += 1
	                                crt[?FFk.xx] = -1
									
	                            }
								
	                        }
							
	                    }
						
	                #endregion
					
	            }
				
	        }
			
	    #endregion
		
	    #region Init Draw
			
	        var a
	        if(!cmp[?FFk.active]) a = cmp[?FFk.fga]/2
	        else a = cmp[?FFk.fga]
	        draw_set_halign(cStr[?FFk.hvalign][0])
	        draw_set_valign(cStr[?FFk.hvalign][1])
			
	    #endregion
		
	    #region Init Txt vars
			
	        // X/Y Init as Middle/Center
	        var txtx = ((cmp[?FFk.xy][2]-cmp[?FFk.xy][0])/2)
	        var txty = ((cmp[?FFk.xy][3]-cmp[?FFk.xy][1])/2)
			
	        // Otherwise Init XY according to alignment
	        if(cStr[?FFk.hvalign][0] == fa_left) txtx = cStr[?FFk.marginx]
	        else if(cStr[?FFk.hvalign][0] == fa_right) txtx = cmp[?FFk.w]-cStr[?FFk.marginx]
	        if(cStr[?FFk.hvalign][1] == fa_top) txty = cStr[?FFk.marginy]
	        else if(cStr[?FFk.hvalign][1] == fa_bottom) txty = cmp[?FFk.h]-cStr[?FFk.marginy]
			
	    #endregion
		
	    #region Setup Surface
			
	        // Doing this here so we can also draw carot to surface.
	        var w = cmp[?FFk.xy][2] - cmp[?FFk.xy][0]
	        var h = cmp[?FFk.xy][3] - cmp[?FFk.xy][1]
	        cmp[?FFk.surf_wh] = [w-1,h-1]
	        cmp[?FFk.surf_id] = ds_map_size(M.FF.surface_map)
	        M.FF.surface_map[?cmp[?FFk.surf_id]] = surface_create(cmp[?FFk.surf_wh][0],cmp[?FFk.surf_wh][1])
	        surface_set_target(M.FF.surface_map[?cmp[?FFk.surf_id]])
	        cmp[?FFk.surf_xy] = [cmp[?FFk.xy][0]+1,cmp[?FFk.xy][1]+1]
	        M.FF.surface_xy = cmp[?FFk.surf_xy]
			
	    #endregion
		
	    #region Draw Body
			
	        // BG
	        draw_set_alpha(cmp[?FFk.bga])
	        draw_rectangle_color(-1,-1,cmp[?FFk.surf_wh][0],cmp[?FFk.surf_wh][1],
	            cmp[?FFk.bgc][0],cmp[?FFk.bgc][1],cmp[?FFk.bgc][2],cmp[?FFk.bgc][3],false)
			
	        // Outline
	        if(!cmp[?FFk.active]) draw_set_alpha(cmp[?FFk.fga]/2)
	        else draw_set_alpha(cmp[?FFk.fga])
	        draw_rectangle_color(0,0,cmp[?FFk.surf_wh][0]-1,cmp[?FFk.surf_wh][1]-1,
	            cmp[?FFk.fgc][0],cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],true)
			
	    #endregion
		
	    #region Parse String Config
			
	        // Init Y Loop
	        var txtw = (cmp[?FFk.xy][2]-cmp[?FFk.xy][0])-(cStr[?FFk.marginx]*2)
	        var txth = (cmp[?FFk.xy][3]-cmp[?FFk.xy][1])-(cStr[?FFk.marginy]*2)
	        var lh = ds_list_size(cStr[?FFk.list_2d])
	        crt[?FFk.yy] = clamp(crt[?FFk.yy],0,lh-1)   // clamp carot yy
	        var yy = txty
	        var line_all = ""
	        var line = ""
	        var word = ""
	        var ls = 0
	        for(var iy = 0; iy < lh; iy++) {
				
	            // Init X Loop
	            if(iy > 0) line += M.FF.line_break
	            var lw = ds_list_size(cStr[?FFk.list_2d][|iy])
	            if(iy == crt[?FFk.yy]) crt[?FFk.xx] = clamp(crt[?FFk.xx],-1,lw-1)
	            var xx = txtx
	            for(var ix = -1; ix < lw; ix++) {
					
	                if(ix > -1) {
						
	                    // Init
	                    var c = cStr[?FFk.list_2d][|iy][|ix]
						
	                    if(string_width(word)+string_width(c) >= txtw) {
							
	                        // Wrap/Next Line
	                        ls += 1
	                        line_all += word
	                        if(iy < lh-1) ds_list_insert(cStr[?FFk.list_2d][|iy+1],0,c)
	                        else ds_list_add(cStr[?FFk.list_2d],list_split(cStr[?FFk.list_2d][|iy],ix,true))
	                        word = c
	                        if(crt[?FFk.xx] >= lw-1) {
	                            crt[?FFk.yy] += 1
	                            crt[?FFk.xx] = 0
	                        }
	                        yy += M.FF.margin.STR_H
	                        xx = txtx
							
	                    } else if(c = " ") {
							
	                        line += word + c
	                        word = ""
							
	                    } else word += c
						
	                    if(string_width(line)+string_width(word) >= txtw and ix == lw-1) {
							
	                        // Wrap/Next Line
	                        // Init
	                        var totx_len = string_length(line) + string_length(word)
	                        var linex_len = string_length(line)
	                        var wordx_len = string_length(word)
							
	                        if(crt[?FFk.carot_end] and crt[?FFk.yy] == iy) {
								
	                            ls += 1
	                            line_all += line
	                            var nl = list_split(cStr[?FFk.list_2d][|iy],ix-(wordx_len-1),true)
	                            ds_list_add(cStr[?FFk.list_2d],nl)
	                            iy += 1
	                            line = ""
	                            crt[?FFk.yy] += 1
	                            crt[?FFk.xx] = string_length(word)-1
	                            yy += M.FF.margin.STR_H
	                            xx = txtx+string_width(word)
								
	                        } else {
								
	                            var lineSelf = list_extract_string(cStr[?FFk.list_2d][|iy])
	                            var word_cnt = string_word_count(lineSelf)
	                            var extract = string_extract_word(lineSelf,word_cnt-1,false)
	                            var lastWord = extract[0]
	                            var ws = extract[1]
	                            wordx_len = string_length(lastWord)-1
	                            var lead_len = string_length(ws[0])
	                            var trail_len = string_length(ws[1])
								
	                            if(iy < lh-1) {
									
	                                var nl = list_split(cStr[?FFk.list_2d][|iy],ix-(wordx_len+trail_len),true)
	                                list_join(nl,cStr[?FFk.list_2d][|iy+1],0,true)
									
	                            } else {
									
	                                ls += 1
	                                ds_list_add(cStr[?FFk.list_2d],list_split(cStr[?FFk.list_2d][|iy],ix-(wordx_len+trail_len),true))
									
	                            }
								
	                            if(crt[?FFk.xx]+1 >= lw-1) {
									
	                                line_all += line
	                                iy += 1
	                                crt[?FFk.yy] += 1
	                                crt[?FFk.xx] = wordx_len
	                                yy += M.FF.margin.STR_H
	                                xx = txtx+string_width(lastWord)
									
	                            }
								
	                            line = list_extract_string(cStr[?FFk.list_2d][|iy])
								
	                        }
							
	                    } else xx += string_width(cStr[?FFk.list_2d][|iy][|ix])
						
	                }
					
	                #region Carot
						
	                    if(!crt[?FFk.carot_end]) {
							
	                        // Normal Text (TOP LEFT TO BOTTOM RIGHT)
	                        if((cStr[?FFk.hvalign][0] == fa_top)
	                            and (cStr[?FFk.hvalign][1] = fa_left)
	                            and cmp[?FFk.selected] and cmp[?FFk.active]
	                            and iy == crt[?FFk.yy] and ix == crt[?FFk.xx]) {
								
	                            crt[?FFk.xy] = []
	                            crt[?FFk.xy][0] = xx+1
	                            crt[?FFk.xy][1] = yy+cmp[?FFk.scrolly]+3
	                            crt[?FFk.xy][2] = crt[?FFk.xy][0]+(M.FF.margin.STR_W*1.2)
	                            crt[?FFk.xy][3] = crt[?FFk.xy][1]+(M.FF.margin.STR_H*.8)
	                            var cxy = crt[?FFk.xy]
								
	                            #region Scroll to Carot on key press
									
	                                var bot_dlt =  abs(cmp[?FFk.h]-crt[?FFk.xy][3])
	                                var top_dlt = abs(crt[?FFk.xy][1])
	                                if(cmp[?FFk.selected])
	                                    if(crt[?FFk.xy][3] >= cmp[?FFk.h])
	                                        cmp[?FFk.scrolly] -= bot_dlt+(M.FF.margin.STR_H*.5)
	                                    else if(crt[?FFk.xy][1] <= 0)
	                                        cmp[?FFk.scrolly] += top_dlt+(M.FF.margin.STR_H*.5)
									
	                            #endregion
								
	                            if(M.FF.runtime_frame > room_speed*.34 or keyboard_check(vk_anykey)) {
									
	                                draw_rectangle_color(cxy[0],cxy[1],cxy[2],cxy[3],cmp[?FFk.fgc][0],
	                                    cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],cmp[?FFk.overwrite])
									
	                            }
								
	                        }
							
	                    } else if(iy == lh-1 and ix == lw-1) {
							
	                        // Update carot xx yy to end..
	                        crt[?FFk.yy] = iy
	                        crt[?FFk.xx] = ix
							
	                    }
						
	                #endregion
					
	                if(M.FF.debug_text_input and iy == crt[?FFk.yy] and ix == crt[?FFk.xx]) {
						
	                    trace("Line : " + line)
	                    trace("Word : " + word)
	                    trace("Char : " + c)
	                    trace(list_to_array(cStr[?FFk.list_2d][|iy]))
	                    trace("")
	                    trace("h: " + lh)
	                    trace("w: " + lw)
	                    trace("yy:" + crt[?FFk.yy])
	                    trace("xx: " + crt[?FFk.xx])
	                    trace("nxt: " + cStr[?FFk.list_2d][|crt[?FFk.yy]][|crt[?FFk.xx]+1])
	                    trace("prv: " + cStr[?FFk.list_2d][|crt[?FFk.yy]][|crt[?FFk.xx]])
	                    trace("")
						
	                }
					
	            }
				
	            #region Carot
					
	                if(crt[?FFk.carot_end]) {
						
	                    // Normal Text (TOP LEFT TO BOTTOM RIGHT)
	                    if((cStr[?FFk.hvalign][0] == fa_top)
	                        and (cStr[?FFk.hvalign][1] = fa_left)
	                        and cmp[?FFk.selected] and cmp[?FFk.active]
	                        and iy == lh-1) {
							
	                        if(M.FF.debug_text_input and iy == crt[?FFk.yy]) trace("CAROT END")
							
	                        crt[?FFk.xy] = []
	                        crt[?FFk.xy][0] = xx+1
	                        crt[?FFk.xy][1] = yy+cmp[?FFk.scrolly]+3
	                        crt[?FFk.xy][2] = crt[?FFk.xy][0]+(M.FF.margin.STR_W*1.2)
	                        crt[?FFk.xy][3] = crt[?FFk.xy][1]+(M.FF.margin.STR_H*.8)
	                        var cxy = crt[?FFk.xy]
							
	                        #region Scroll to Carot on key press
								
	                            var bot_dlt =  abs(cmp[?FFk.h]-crt[?FFk.xy][3])
	                            var top_dlt = abs(crt[?FFk.xy][1])
	                            if(cmp[?FFk.selected])
	                                if(crt[?FFk.xy][3] >= cmp[?FFk.h])
	                                    cmp[?FFk.scrolly] -= bot_dlt+(M.FF.margin.STR_H*.5)
	                                else if(crt[?FFk.xy][1] <= 0)
	                                    cmp[?FFk.scrolly] += top_dlt+(M.FF.margin.STR_H*.5)
								
	                        #endregion
							
	                        if(M.FF.runtime_frame > room_speed*.34 or keyboard_check(vk_anykey)) {
								
	                            draw_rectangle_color(cxy[0],cxy[1],cxy[2],cxy[3],cmp[?FFk.fgc][0],
	                                cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],cmp[?FFk.overwrite])
								
	                        }
							
	                    }
						
	                }
					
	            #endregion
				
	            // Next line
	            if(iy < lh) {
					
	                // Wrap/Next Line
	                ls += 1
	                line_all += line + word
	                line = ""
	                word = ""
	                yy += M.FF.margin.STR_H
	                xx = txtx
					
	            }
				
	        }
			
	        if(M.FF.debug_text_input_all) {
				
	            trace("All:")
	            for(var i = 0; i < ds_list_size(cStr[?FFk.list_2d]); i++)
	                trace(list_to_array(cStr[?FFk.list_2d][|i]))
	            trace("")
				
	        }
			
	    #endregion
		
	    #region Draw Text to Surface
			
	        // Draw text to surface
	        gpu_set_colorwriteenable(true,true,true,false)
	        //draw_text_ext_transformed_color(txtx,txty+cmp[?FFk.scrolly],line_all+word,M.FF.margin.STR_H,cmp[?FFk.w],1,1,0,
	        //    cmp[?FFk.fgc][0],cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],1)
	        draw_text_transformed_color(txtx,txty+cmp[?FFk.scrolly],line_all+word,1,1,0,
	            cmp[?FFk.fgc][0],cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],1)
	        gpu_set_colorwriteenable(true,true,true,true)
			
	    #endregion
		
	    #region Draw/Reset Surface
			
	        // Draw Surface and Reset
	        surface_reset_target()
	        draw_set_alpha(1)
	        draw_surface(M.FF.surface_map[?cmp[?FFk.surf_id]],M.FF.surface_xy[0],M.FF.surface_xy[1]+1)
	        M.FF.surface_xy = [0,0]
			
	    #endregion
		
	#endregion
	
	#region Interaction/Hilight Logic
		
	    var in_cmp = true // Used to return if mouse is inside button
	    if(mouse_x-M.FF.surface_xy[0] > cmp[?FFk.xy][0]-M.FF.margin.SM and mouse_x-M.FF.surface_xy[0] < cmp[?FFk.xy][2]+M.FF.margin.SM
	        and mouse_y-M.FF.surface_xy[1] > cmp[?FFk.xy][1]-M.FF.margin.SM and mouse_y-M.FF.surface_xy[1] < cmp[?FFk.xy][3]+M.FF.margin.SM
	        and cmp[?FFk.active] and !M.FF.frame.menu_override and !cmp[?FFk.override]) {
			
	        // Set Beam Cursor
	        window_set_cursor(cr_beam)
			
	        // Draw Hilight
	        if(M.FF.MBL) draw_set_alpha(cmp[?FFk.fga]*.0625)
	        else draw_set_alpha(cmp[?FFk.fga]*.125)
	        if(!cmp[?FFk.selected]) draw_rectangle_color(cmp[?FFk.xy][0],cmp[?FFk.xy][1],
	            cmp[?FFk.xy][2],cmp[?FFk.xy][3],cmp[?FFk.fgc][0],cmp[?FFk.fgc][1],
	            cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],false)
			
	        if(cmp[?FFk.scroll]) {
				
	            if(M.FF.MWU)
	                if(M.FF.key_shift) cmp[?FFk.scrolly] += M.FF.margin.STR_H*2
	                else cmp[?FFk.scrolly] += M.FF.margin.STR_H
	            else if(M.FF.MWD)
	                if(M.FF.key_shift) cmp[?FFk.scrolly] -= M.FF.margin.STR_H*2
	                else cmp[?FFk.scrolly] -= M.FF.margin.STR_H
	            cmp[?FFk.scrolly_mn] = -(string_height(line_all))
	            cmp[?FFk.scrolly] = clamp(cmp[?FFk.scrolly],cmp[?FFk.scrolly_mn],cmp[?FFk.scrolly_mx])
				
	        }
			
	        if(M.FF.MBLR and M.FF.runtime_frame_delay == 0) {
				
	            cmp[?FFk.selected] = true
	            keyboard_string = ""
	            keyboard_string = cStr[?FFk.str]
	            crt[?FFk.yy] = ds_list_size(cStr[?FFk.list_2d])-1
	            crt[?FFk.xx] = ds_list_size((cStr[?FFk.list_2d][|crt[?FFk.yy]]))-1
	            M.FF.frame.component_focus = cmp
	            M.FF.frame.menu_override = true
				
	        }
			
	    } else {
			
	        // Set Default Cursor
	        window_set_cursor(cr_default)
			
	        in_cmp = false
			
	        if(M.FF.MBLR and cmp[?FFk.selected]) {
				
	            cmp[?FFk.selected] = false
	            keyboard_string = ""
	            M.FF.frame.menu_override = false
	            M.FF.frame.component_focus = noone
	            M.FF.runtime_frame_delay = 2
				
	        }
			
	    }
		
	#endregion
	
	#region Other Controls
		
	    if(cmp[?FFk.selected]) {
			
	        var l_cnt = [string_wrap_count(cStr[?FFk.list_2d][|crt[?FFk.yy]-1],txtw),
	            string_wrap_count(cStr[?FFk.list_2d][|crt[?FFk.yy]],txtw),
	            string_wrap_count(cStr[?FFk.list_2d][|crt[?FFk.yy]+1],txtw)]
	        var lw2 = ds_list_size(cStr[?FFk.list_2d][|crt[?FFk.yy]])
	        var lh2 = ds_list_size(cStr[?FFk.list_2d])
			
	        if(M.FF.key_arrow_p) {
				
	            if(M.FF.key_up and crt[?FFk.yy] > 0) crt[?FFk.yy] -= 1
				
	            if(M.FF.key_down and crt[?FFk.yy] < lh2-1) crt[?FFk.yy] += 1
				
	            if(M.FF.key_left) {
					
	                if(crt[?FFk.xx] == -1 and crt[?FFk.yy] > 0) {
						
	                    crt[?FFk.yy] -= 1
	                    crt[?FFk.xx] = ds_list_size(cStr[?FFk.list_2d][|crt[?FFk.yy]])-1
						
	                } else crt[?FFk.xx] -= 1
					
	            }
				
	            if(M.FF.key_right) {
					
	                if(crt[?FFk.xx] == lw2-1 and crt[?FFk.yy] < lh2-1) {
						
	                    crt[?FFk.yy] += 1
	                    crt[?FFk.xx] = -1
						
	                } else if(crt[?FFk.xx] < lw2-1) crt[?FFk.xx] += 1
					
	            }
				
	        } else if(M.FF.key_heldi > room_speed/2) {
				
	            #region Repeat Input Logic
					
	                if(M.FF.key_heldi < room_speed*2.5) {
						
	                    if(M.FF.key_up and M.FF.runtime_frame%5 == 0 and crt[?FFk.yy] > 0) crt[?FFk.yy] -= 1
						
	                    if(M.FF.key_down and M.FF.runtime_frame%5 == 0 and crt[?FFk.yy] < lh2-1) crt[?FFk.yy] += 1
						
	                    if(M.FF.key_left and M.FF.runtime_frame%5 == 0) {
							
	                        if(crt[?FFk.xx] == -1 and crt[?FFk.yy] > 0) {
								
	                            crt[?FFk.yy] -= 1
	                            crt[?FFk.xx] = ds_list_size(cStr[?FFk.list_2d][|crt[?FFk.yy]])-1
								
	                        } else crt[?FFk.xx] -= 1
							
	                    }
						
	                    if(M.FF.key_right and M.FF.runtime_frame%5 == 0) {
							
	                        if(crt[?FFk.xx] == lw2-1 and crt[?FFk.yy] < lh2-1) {
								
	                            crt[?FFk.yy] += 1
	                            crt[?FFk.xx] = -1
								
	                        } else if(crt[?FFk.xx] < lw2-1) crt[?FFk.xx] += 1
							
	                    }
						
	                } else if (M.FF.key_heldi < room_speed*5) {
						
	                    if(M.FF.key_up and M.FF.runtime_frame%2 == 0 and crt[?FFk.yy] > 0) crt[?FFk.yy] -= 1
						
	                    if(M.FF.key_down and M.FF.runtime_frame%2 == 0 and crt[?FFk.yy] < lh2-1) crt[?FFk.yy] += 1
						
	                    if(M.FF.key_left and M.FF.runtime_frame%2 == 0) {
							
	                        if(crt[?FFk.xx] == -1 and crt[?FFk.yy] > 0) {
								
	                            crt[?FFk.yy] -= 1
	                            crt[?FFk.xx] = ds_list_size(cStr[?FFk.list_2d][|crt[?FFk.yy]])-1
								
	                        } else crt[?FFk.xx] -= 1
							
	                    }
						
	                    if(M.FF.key_right and M.FF.runtime_frame%2 == 0) {
							
	                        if(crt[?FFk.xx] == lw2-1 and crt[?FFk.yy] < lh2-1) {
								
	                            crt[?FFk.yy] += 1
	                            crt[?FFk.xx] = -1
								
	                        } else if(crt[?FFk.xx] < lw2-1) crt[?FFk.xx] += 1
							
	                    }
						
	                } else {
						
	                    if(M.FF.key_up and crt[?FFk.yy] > 0) crt[?FFk.yy] -= 1
						
	                    if(M.FF.key_down and crt[?FFk.yy] < lh2-1) crt[?FFk.yy] += 1
						
	                    if(M.FF.key_left) {
                        
	                        if(crt[?FFk.xx] == -1 and crt[?FFk.yy] > 0) {
								
	                            crt[?FFk.yy] -= 1
	                            crt[?FFk.xx] = ds_list_size(cStr[?FFk.list_2d][|crt[?FFk.yy]])-1
								
	                        } else crt[?FFk.xx] -= 1
							
	                    }
						
	                    if(M.FF.key_right) {
							
	                        if(crt[?FFk.xx] == lw2-1 and crt[?FFk.yy] < lh2-1) {
								
	                            crt[?FFk.yy] += 1
	                            crt[?FFk.xx] = -1
								
	                        } else if(crt[?FFk.xx] < lw2-1) crt[?FFk.xx] += 1
							
	                    }
						
	                }
					
	            #endregion
				
	        }
			
	        // Toggle Carot End
	        if(crt[?FFk.yy] == lh-1 and crt[?FFk.xx] == lw-1) crt[?FFk.carot_end] = true
	        else crt[?FFk.carot_end] = false
			
	        // Toggle Overwrite (Insert)
	        if(M.FF.key_insert_p) cmp[?FFk.overwrite] = !cmp[?FFk.overwrite]
			
	    }
		
	#endregion
	
	// Return whether or not mouse inside btn
	return in_cmp
	
}

function picker_draw() {
	
	#region Params&CFG
		
	    var cmp = argument0
	    var opt = cmp[?FFk.opt_cfg]
		
	#endregion
	
	// Calc Inits
	var cmp_h = cmp[?FFk.xy][3] - cmp[?FFk.xy][1]
	
	#region Draw Body
		
	    // BG
	    draw_set_alpha(cmp[?FFk.bga])
	    draw_rectangle_color(cmp[?FFk.xy][0]+cmp_h,cmp[?FFk.xy][1],cmp[?FFk.xy][2]-cmp_h,cmp[?FFk.xy][3],
	        cmp[?FFk.bgc][0],cmp[?FFk.bgc][1],cmp[?FFk.bgc][2],cmp[?FFk.bgc][3],false)
		
	    // Outline
	    if(!cmp[?FFk.active]) draw_set_alpha(cmp[?FFk.fga]/2)
	    else draw_set_alpha(cmp[?FFk.fga])
	    draw_rectangle_color(cmp[?FFk.xy][0]+cmp_h,cmp[?FFk.xy][1],cmp[?FFk.xy][2]-cmp_h,cmp[?FFk.xy][3],
	        cmp[?FFk.fgc][0],cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],true)
		
	#endregion
	
	#region Draw Arrows
		
	    // Inits
	    var asz = round(cmp_h*.25) // Arrow Size
	    // Left
	    var xyl
	    xyl[0] = cmp[?FFk.xy][0]
	    xyl[1] = cmp[?FFk.xy][1]
	    xyl[2] = cmp[?FFk.xy][0]+cmp_h
	    xyl[3] = cmp[?FFk.xy][3]
	    var lx = xyl[0]+((xyl[2]-xyl[0])/2)
	    var ly = xyl[1]+((xyl[3]-xyl[1])/2)
	    // Right
	    var xyr
	    xyr[0] = cmp[?FFk.xy][2]-cmp_h
	    xyr[1] = cmp[?FFk.xy][1]
	    xyr[2] = cmp[?FFk.xy][2]
	    xyr[3] = cmp[?FFk.xy][3]
	    var rx = xyr[0]+((xyr[2]-xyr[0])/2)
	    var ry = xyr[1]+((xyr[3]-xyr[1])/2)
		
	    // Left (Depress/Unpress Check)
	    if(mouse_x-M.FF.surface_xy[0] > xyl[0]-M.FF.margin.SM and mouse_x-M.FF.surface_xy[0] < xyl[2]+M.FF.margin.SM
	        and mouse_y-M.FF.surface_xy[1] > xyl[1]-M.FF.margin.SM and mouse_y-M.FF.surface_xy[1] < xyl[3]+M.FF.margin.SM
	        and cmp[?FFk.active] and !M.FF.frame.menu_override and !cmp[?FFk.override])
	        if(M.FF.MBL and array_equals(cmp[?FFk.bgc],cmp[?FFk.bgc_o]))
	            cmp[?FFk.bgc] = invert_array(cmp[?FFk.bgc])
		
	    // Left
	    // BG
	    draw_set_alpha(cmp[?FFk.bga])
	    draw_rectangle_color(xyl[0],xyl[1],xyl[2],xyl[3],cmp[?FFk.bgc][0],
	        cmp[?FFk.bgc][1],cmp[?FFk.bgc][2],cmp[?FFk.bgc][3],false)
		
	    if(!array_equals(cmp[?FFk.bgc],cmp[?FFk.bgc_o]))
	        cmp[?FFk.bgc] = array_dupe(cmp[?FFk.bgc],cmp[?FFk.bgc_o])
		
	    // Outline
	    if(!cmp[?FFk.active]) draw_set_alpha(cmp[?FFk.fga]/2)
	    else draw_set_alpha(cmp[?FFk.fga])
	    draw_rectangle_color(xyl[0],xyl[1],xyl[2],xyl[3],cmp[?FFk.fgc][0],
	        cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],true)
		
	    // Arrow
	    draw_set_color(cmp[?FFk.fgc][0])
	    if(!cmp[?FFk.active]) draw_set_alpha(cmp[?FFk.fga]/2)
	    else draw_set_alpha(cmp[?FFk.fga])
	    draw_triangle(lx-asz,ly,lx+asz,ly+asz,lx+asz,ly-asz,true)
		
	    // Right (Depress/Unpress Check)
	    if(mouse_x-M.FF.surface_xy[0] > xyr[0]-M.FF.margin.SM and mouse_x-M.FF.surface_xy[0] < xyr[2]+M.FF.margin.SM
	        and mouse_y-M.FF.surface_xy[1] > xyr[1]-M.FF.margin.SM and mouse_y-M.FF.surface_xy[1] < xyr[3]+M.FF.margin.SM
	        and cmp[?FFk.active] and !M.FF.frame.menu_override and !cmp[?FFk.override])
	        if(M.FF.MBL and array_equals(cmp[?FFk.bgc],cmp[?FFk.bgc_o]))
	            cmp[?FFk.bgc] = invert_array(cmp[?FFk.bgc])
		
	    // Right
	    // BG
	    draw_set_alpha(cmp[?FFk.bga])
	    draw_rectangle_color(xyr[0],xyr[1],xyr[2],xyr[3],cmp[?FFk.bgc][0],
	        cmp[?FFk.bgc][1],cmp[?FFk.bgc][2],cmp[?FFk.bgc][3],false)
		
	    if(!array_equals(cmp[?FFk.bgc],cmp[?FFk.bgc_o]))
	        cmp[?FFk.bgc] = array_dupe(cmp[?FFk.bgc],cmp[?FFk.bgc_o])
		
	    // Outline
	    if(!cmp[?FFk.active]) draw_set_alpha(cmp[?FFk.fga]/2)
	    else draw_set_alpha(cmp[?FFk.fga])
	    draw_rectangle_color(xyr[0],xyr[1],xyr[2],xyr[3],cmp[?FFk.fgc][0],
	        cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],true)
		
	    // Arrow
	    draw_set_colour(cmp[?FFk.fgc][0])
	    if(!cmp[?FFk.active]) draw_set_alpha(cmp[?FFk.fga]/2)
	    else draw_set_alpha(cmp[?FFk.fga])
	    draw_triangle(rx+asz,ry,rx-asz,ry+asz,rx-asz,ry-asz,true)
		
	#endregion
	
	#region Interaction/Hilight Logic
		
	    var in_cmp = false // Used to return if mouse is inside button
		
	    // Left
	    if(mouse_x-M.FF.surface_xy[0] > xyl[0]-M.FF.margin.SM and mouse_x-M.FF.surface_xy[0] < xyl[2]+M.FF.margin.SM
	        and mouse_y-M.FF.surface_xy[1] > xyl[1]-M.FF.margin.SM and mouse_y-M.FF.surface_xy[1] < xyl[3]+M.FF.margin.SM
	        and cmp[?FFk.active] and !M.FF.frame.menu_override and !cmp[?FFk.override]) {
			
	        in_cmp = true
			
	        // Draw
	        if(M.FF.MBL) draw_set_alpha(cmp[?FFk.fga]*.05)
	        else draw_set_alpha(cmp[?FFk.fga]*.125)
	        draw_rectangle_color(xyl[0],xyl[1],xyl[2],xyl[3],cmp[?FFk.fgc][0],
	            cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],false)
			
	        // Arrow
	        draw_set_colour(cmp[?FFk.fgc][0])
	        if(M.FF.MBL) draw_set_alpha(cmp[?FFk.fga]*.5)
	        else draw_set_alpha(cmp[?FFk.fga])
	        draw_triangle(lx-asz,ly,lx+asz,ly+asz,lx+asz,ly-asz,false)
			
	        if(M.FF.MBLR) {
				
	            if(opt[?FFk.val] > 0) opt[?FFk.val] -= 1
	            else opt[?FFk.val] = array_length_1d(opt[?FFk.arr])-1
				
	        }
			
	    }
		
	    // Right
	    if(mouse_x-M.FF.surface_xy[0] > xyr[0]-M.FF.margin.SM and mouse_x-M.FF.surface_xy[0] < xyr[2]+M.FF.margin.SM
	        and mouse_y-M.FF.surface_xy[1] > xyr[1]-M.FF.margin.SM and mouse_y-M.FF.surface_xy[1] < xyr[3]+M.FF.margin.SM
	        and cmp[?FFk.active] and !M.FF.frame.menu_override and !cmp[?FFk.override]) {
			
	        in_cmp = true
			
	        // Draw
	        if(M.FF.MBL) draw_set_alpha(cmp[?FFk.fga]*.05)
	        else draw_set_alpha(cmp[?FFk.fga]*.125)
	        draw_rectangle_color(xyr[0],xyr[1],xyr[2],xyr[3],cmp[?FFk.fgc][0],
	            cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],false)
			
	        // Arrow
	        draw_set_colour(cmp[?FFk.fgc][0])
	        if(M.FF.MBL) draw_set_alpha(cmp[?FFk.fga]*.5)
	        else draw_set_alpha(cmp[?FFk.fga])
	        draw_triangle(rx+asz,ry,rx-asz,ry+asz,rx-asz,ry-asz,false)
			
	        if(M.FF.MBLR) {
				
	            if(opt[?FFk.val] < array_length_1d(opt[?FFk.arr])-1)
	                opt[?FFk.val] += 1
	            else opt[?FFk.val] = 0
				
	        }
			
	    }
		
	#endregion
	
	#region Text
		
	    var a
	    if(!cmp[?FFk.active]) a = cmp[?FFk.fga]/2
	    else a = cmp[?FFk.fga]
	    draw_set_halign(fa_middle)
	    draw_set_valign(fa_center)
	    var txt = string_capital_all(opt[?FFk.arr][opt[?FFk.val]].str)
	    var txtx = (((cmp[?FFk.xy][2]-cmp[?FFk.xy][0])/2)+cmp[?FFk.xy][0])
	    var txty = (((cmp[?FFk.xy][3]-cmp[?FFk.xy][1])/2)+cmp[?FFk.xy][1])
	    var txtw = (cmp[?FFk.xy][2]-cmp_h)-(cmp[?FFk.xy][0]+cmp_h)
	    if(string_width_ext(txt,M.FF.margin.STR_H,txtw) < txtw)
	        draw_text_ext_color(txtx,txty,txt,M.FF.margin.STR_H,txtw,cmp[?FFk.fgc][0],
	            cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],a)
		
	#endregion
	
	// Return whether or not mouse inside btn
	return in_cmp
	
}

function preview_draw() {
	
	#region Params
		
	    var cmp = argument0
		
	#endregion
	
	#region Draw Body
		
	    // BG
	    draw_set_alpha(cmp[?FFk.bga])
	    draw_rectangle_color(cmp[?FFk.xy][0],cmp[?FFk.xy][1],cmp[?FFk.xy][2],cmp[?FFk.xy][3],
	        cmp[?FFk.bgc][0],cmp[?FFk.bgc][1],cmp[?FFk.bgc][2],cmp[?FFk.bgc][3],false)
		
	    // Outline
	    if(!cmp[?FFk.active]) draw_set_alpha(cmp[?FFk.fga]/2)
	    else draw_set_alpha(cmp[?FFk.fga])
	    draw_rectangle_color(cmp[?FFk.xy][0],cmp[?FFk.xy][1],cmp[?FFk.xy][2],cmp[?FFk.xy][3],
	        cmp[?FFk.fgc][0],cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],true)
		
	#endregion
	
	#region Interaction/Hilight Logic
		
	    var in_cmp = true // Used to return if mouse is inside button
	    if(mouse_x-M.FF.surface_xy[0] > cmp[?FFk.xy][0]-M.FF.margin.SM and mouse_x-M.FF.surface_xy[0] < cmp[?FFk.xy][2]+M.FF.margin.SM
	        and mouse_y-M.FF.surface_xy[1] > cmp[?FFk.xy][1]-M.FF.margin.SM and mouse_y-M.FF.surface_xy[1] < cmp[?FFk.xy][3]+M.FF.margin.SM
	        and cmp[?FFk.active] and !M.FF.frame.menu_override and !cmp[?FFk.override]) {
			
			// UNUSED
			
	    } else in_cmp = false
		
	#endregion
	
	#region Reference
		
	    if(cmp[?FFk.ref] != noone) {
			
	        var r = cmp[?FFk.ref]
			
	        if(r[?FFk.type] == FFv.player) {
				
	            var scl = clamp(cmp[?FFk.w]/(r[?FFk.rsz]*3),0,1)
	            var xx = lerp(cmp[?FFk.xy][0],cmp[?FFk.xy][2],0.5)
	            var yy = lerp(cmp[?FFk.xy][1],cmp[?FFk.xy][3],0.5)
				
	            // Draw Player
	            draw_player_at(r,xx,yy,scl)
				
	        }
			
	    }
		
	#endregion
	
	#region Text
		
	    var a
	    if(!cmp[?FFk.active]) a = cmp[?FFk.fga]/2
	    else a = cmp[?FFk.fga]
	    draw_set_halign(fa_left)
	    draw_set_valign(fa_bottom)
	    var txt = cmp[?FFk.str]
	    var txtx = cmp[?FFk.xy][0]
	    var txty = cmp[?FFk.xy][1]-M.FF.margin.SM
	    var txtw = cmp[?FFk.xy][2]-cmp[?FFk.xy][0]
	    if(string_width_ext(txt,M.FF.margin.STR_H,txtw) < txtw)
	        draw_text_ext_color(txtx,txty,txt,M.FF.margin.STR_H,txtw,cmp[?FFk.fgc][0],
	            cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],a)
		
	#endregion
	
	// Return whether or not mouse inside btn
	return in_cmp
	
}

function slider_draw() {
	
	#region Params
		
	    var cmp = argument0
		
	#endregion
	
	#region Draw Body
		
	    // Outline (BG)
	    if(!cmp[?FFk.active]) draw_set_alpha(cmp[?FFk.bga]/2)
	    else draw_set_alpha(cmp[?FFk.bga])
	    draw_rectangle_color(cmp[?FFk.xy][0],cmp[?FFk.xy][1],cmp[?FFk.xy][2],cmp[?FFk.xy][3],cmp[?FFk.fgc][0],
	            cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],true)
		
	#endregion
	
	// Init
	var pct = cmp[?FFk.val]/cmp[?FFk.val_mx]
	var pct_min = cmp[?FFk.val_mn]/cmp[?FFk.val_mx]
	var adj = round2(((cmp[?FFk.xy][2]-cmp[?FFk.xy][0])*pct_min)-(((cmp[?FFk.xy][2]-cmp[?FFk.xy][0])*pct_min)*pct),1)
	var x2 = (cmp[?FFk.xy][0]+((cmp[?FFk.xy][2]-cmp[?FFk.xy][0])*pct))-adj
	
	#region Interaction/Hilight Logic
		
	    var in_cmp = true // Used to return if mouse is inside button
	    if(mouse_x-M.FF.surface_xy[0] > cmp[?FFk.xy][0]-M.FF.margin.MD and mouse_x-M.FF.surface_xy[0] < cmp[?FFk.xy][2]+M.FF.margin.MD
	        and mouse_y-M.FF.surface_xy[1] > cmp[?FFk.xy][1]-M.FF.margin.SM and mouse_y-M.FF.surface_xy[1] < cmp[?FFk.xy][3]+M.FF.margin.SM
	        and cmp[?FFk.active] and !M.FF.frame.menu_override and !cmp[?FFk.override]) {
			
	        // Draw
	        if(M.FF.MBL) draw_set_alpha(cmp[?FFk.fga]*.34)
	        else draw_set_alpha(cmp[?FFk.fga]*.5)
	        draw_rectangle_color(cmp[?FFk.xy][0],cmp[?FFk.xy][1],x2,cmp[?FFk.xy][3],cmp[?FFk.fgc][0],
	            cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],false)
			
	        // Update Val
	        if(M.FF.MBL) {
				
	            var xpct = round2((mouse_x-cmp[?FFk.xy][0]+adj)/(cmp[?FFk.xy][2]-cmp[?FFk.xy][0]+adj),cmp[?FFk.num_dec])
	            cmp[?FFk.val] = clamp(round2(cmp[?FFk.val_mx]*xpct,cmp[?FFk.num_dec]),cmp[?FFk.val_mn],cmp[?FFk.val_mx])
	            if(abs(cmp[?FFk.val] - round(cmp[?FFk.val])) <= 0.05) cmp[?FFk.val] = clamp(round(cmp[?FFk.val]),cmp[?FFk.val_mn],cmp[?FFk.val_mx])
				
	        }
			
	        // Current Value; (Displayed under bar only when hovering)
	        if(!cmp[?FFk.active]) a = cmp[?FFk.fga]/2
	        else a = cmp[?FFk.fga]
	        draw_set_halign(fa_middle)
	        draw_set_valign(fa_top)
	        draw_text_color(x2,cmp[?FFk.xy][3],string("{0}{1}",cmp[?FFk.val],cmp[?FFk.sym]),cmp[?FFk.fgc][0],
	            cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],a)
			
	    } else {
			
	        in_cmp = false
			
	        draw_set_alpha(cmp[?FFk.fga]*.75)
	        draw_rectangle_color(cmp[?FFk.xy][0],cmp[?FFk.xy][1],x2,cmp[?FFk.xy][3],cmp[?FFk.fgc][0],
	            cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],false)
			
	    }
		
	    // Apply Changes
	    slider_action(cmp)
		
	#endregion
	
	#region Ticks
		
	    // 1/5s
	    if(!cmp[?FFk.active]) draw_set_alpha(cmp[?FFk.bga]/2)
	    else draw_set_alpha(cmp[?FFk.bga])
	    for(var i = 1; i < 20; i++) {
			
	        var tx = cmp[?FFk.xy][0]+((cmp[?FFk.xy][2]-cmp[?FFk.xy][0])*(i*.05))
			
	        var ty = cmp[?FFk.xy][3]
	        if(i == 10) ty -= M.FF.margin.BG
	        else if(i%2 == 0) ty -= M.FF.margin.MD
	        else ty -= M.FF.margin.SM
			
	        var tw = 1
	        if(i%10 == 0) tw = 2
			
	        if(ceil(x2) >= floor(tx)) draw_line_width_color(tx,cmp[?FFk.xy][3],tx,ty,tw,cmp[?FFk.bgc][0],cmp[?FFk.bgc][2])
	        else draw_line_width_color(tx,cmp[?FFk.xy][3],tx,ty,tw,cmp[?FFk.fgc][0],cmp[?FFk.fgc][2])
			
	    }
		
	#endregion
	
	#region Text
		
	    // Label
	    var a
	    if(!cmp[?FFk.active]) a = cmp[?FFk.fga]/2
	    else a = cmp[?FFk.fga]
	    draw_set_halign(fa_left)
	    draw_set_valign(fa_bottom)
	    var l_str = string("{0} : {1}{2}", cmp[?FFk.str],cmp[?FFk.val],cmp[?FFk.sym])
	    draw_text_color(cmp[?FFk.xy][0],cmp[?FFk.xy][1],l_str,cmp[?FFk.fgc][0],
	        cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],a)
		
	    // Min Value
	    if(!cmp[?FFk.active]) a = cmp[?FFk.fga]/2
	    else a = cmp[?FFk.fga]
	    draw_set_halign(fa_right)
	    draw_set_valign(fa_center)
	    draw_text_color(cmp[?FFk.xy][0]-M.FF.margin.STR_H,cmp[?FFk.xy][1]+((cmp[?FFk.xy][3]-cmp[?FFk.xy][1])/2),
	        string("{0}{1}",cmp[?FFk.val_mn],cmp[?FFk.sym]),cmp[?FFk.fgc][0],
	        cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],a)
		
	    // Max Value
	    if(!cmp[?FFk.active]) a = cmp[?FFk.fga]/2
	    else a = cmp[?FFk.fga]
	    draw_set_halign(fa_left)
	    draw_set_valign(fa_center)
	    draw_text_color(cmp[?FFk.xy][2]+M.FF.margin.STR_H,cmp[?FFk.xy][1]+((cmp[?FFk.xy][3]-cmp[?FFk.xy][1])/2),
	        string("{0}{1}",cmp[?FFk.val_mx],cmp[?FFk.sym]),cmp[?FFk.fgc][0],
	        cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],a)
		
	#endregion
	
	// Return whether or not mouse inside btn
	return in_cmp
	
}

function slot_grid_draw() {
	
	#region Params
		
	    var cmp = argument0
		
	#endregion
	
	#region Draw Body
		
	    // BG
	    if(cmp[?FFk.bg]) {
			
	        draw_set_alpha(cmp[?FFk.bga])
	        draw_rectangle_color(cmp[?FFk.xy][0],cmp[?FFk.xy][1],cmp[?FFk.xy][2],cmp[?FFk.xy][3],
	            cmp[?FFk.bgc][3],cmp[?FFk.bgc][2],cmp[?FFk.bgc][1],cmp[?FFk.bgc][0],false)
			
	    }
		
	    // Outline
	    if(cmp[?FFk.fg]) {
			
	        if(!cmp[?FFk.active]) draw_set_alpha(cmp[?FFk.fga]/2)
	        else draw_set_alpha(cmp[?FFk.fga])
	        draw_rectangle_color(cmp[?FFk.xy][0],cmp[?FFk.xy][1],cmp[?FFk.xy][2],cmp[?FFk.xy][3],
	            cmp[?FFk.fgc][3],cmp[?FFk.fgc][2],cmp[?FFk.fgc][1],cmp[?FFk.fgc][0],true)
			
	    }
		
	#endregion
	
	#region Init Grid Iteration
		
	    var mar = 4
	    var cols = ds_grid_width(cmp[?FFk.grid])
	    var rows = ds_grid_height(cmp[?FFk.grid])
	    var sw = cmp[?FFk.w]/cols
	    var sh = cmp[?FFk.h]/rows
	    if(cmp[?FFk.scl_w]) sh = sw
	    if(cmp[?FFk.scl_h]) sw = sh
	    var h_cnt = round(cmp[?FFk.h]/sh)
		
	#endregion
	
	#region Draw Slots
		
	    draw_set_alpha(1)
	    var scry = abs(cmp[?FFk.scrolly])
	    var ri = 0
	    for(var ir = scry; ir < rows; ir++) {
			
	        var traced = false
	        var row_iter = false
	        for(var ic = 0; ic < cols; ic++) {
				
	            #region Init
					
	                var ge = cmp[?FFk.grid][#ic,ir]
					
	                // Init Coordinates
	                var xy = []
	                xy[0] = (cmp[?FFk.xy][0]+(sw*ic)) + mar
	                xy[1] = ((cmp[?FFk.xy][1]+(sh*ir)) + mar) - (scry*sh)
	                xy[2] = (xy[0]+sw) - mar
	                xy[3] = (xy[1]+sh) - mar
					
	                // Ignore Blocks Outside
	                if(xy[3] > cmp[?FFk.xy][3]
	                    or xy[1] < cmp[?FFk.xy][1])
	                    break
					
	                // Row drawn? (Only counted once per row, regardless of columns)
	                if(!row_iter) {
						
	                    row_iter = true
	                    ri += 1
						
	                }
					
	            #endregion
				
	            #region Slot Size Adjustments
					
	                // Sometimes Edge slot margins might be a little off..
	                // Adjust Height
	                if(ir == scry)
	                    if(abs(cmp[?FFk.xy][1]-xy[1]) < sh)
	                        xy[1] = cmp[?FFk.xy][1]+mar
	                if(ri == h_cnt)
	                    if(abs(cmp[?FFk.xy][3]-xy[3]) < sh)
	                        xy[3] = cmp[?FFk.xy][3]-mar
					
	                // Adjust Width
	                if(ic == 0)
	                    if(abs(cmp[?FFk.xy][0]-xy[0]) < sw)
	                        xy[0] = cmp[?FFk.xy][0]+mar
	                if(ic == cols-1)
	                    if(abs(cmp[?FFk.xy][2]-xy[2]) < sw)
	                        xy[2] = cmp[?FFk.xy][2]-mar
					
	            #endregion
				
	            #region Draw Slot BG
					
	                if(cmp[?FFk.bg]) {
						
	                    if(mouse_x-M.FF.surface_xy[0] >= xy[0] and mouse_x-M.FF.surface_xy[0] <= xy[2]
	                        and mouse_y-M.FF.surface_xy[1] >= xy[1] and mouse_y-M.FF.surface_xy[1] <= xy[3]) {
							
	                        if(((M.FF.MBL and (ge[?FFk.val] != noone or ge[?FFk.val_arr] != noone))
	                            or (M.FF.MBR and M.FF.mouse_drag_list != noone))
	                            and array_equals(cmp[?FFk.bgc_o],cmp[?FFk.bgc]))
	                            cmp[?FFk.bgc] = invert_array(cmp[?FFk.bgc])
							
	                    }
						
	                    draw_set_alpha(cmp[?FFk.bga])
	                    draw_rectangle_color(xy[0],xy[1],xy[2],xy[3],
	                        cmp[?FFk.bgc][3],cmp[?FFk.bgc][2],cmp[?FFk.bgc][1],cmp[?FFk.bgc][0],false)
						
	                    if(!array_equals(cmp[?FFk.bgc_o],cmp[?FFk.bgc]))
	                        array_copy(cmp[?FFk.bgc],0,cmp[?FFk.bgc_o],0,array_length_1d(cmp[?FFk.bgc_o]))
						
	                }
					
	            #endregion
				
	            #region Draw Slot Outline
					
	                if(cmp[?FFk.fg]) {
						
	                    if(!cmp[?FFk.active]) draw_set_alpha(cmp[?FFk.fga]/2)
	                    else draw_set_alpha(cmp[?FFk.fga])
						
	                    draw_rectangle_color(xy[0],xy[1],xy[2],xy[3],
	                        cmp[?FFk.fgc][3],cmp[?FFk.fgc][2],cmp[?FFk.fgc][1],cmp[?FFk.fgc][0],true)
						
	                }
					
	            #endregion
				
	            #region Draw Slot number
					
	                if(cmp[?FFk.grid_nums]) {
						
	                    draw_set_halign(fa_right)
	                    draw_set_valign(fa_bottom)
	                    var txtx = lerp(xy[0],xy[2],0.9)
	                    var txty = lerp(xy[1],xy[3],0.95)
	                    draw_text_color(txtx,txty,1+(ir*cols)+ic,c_white,
	                        c_white,c_white,c_white,6.7)
						
	                }
					
	            #endregion
				
	            #region Draw Slot Content
					
	                if(ge[?FFk.val] != noone or ge[?FFk.val_arr] != noone) {
						
	                    // Slot Holds Something
	                    var a = 1
	                    draw_set_halign(fa_middle)
	                    draw_set_valign(fa_center)
	                    var txt = "ERR"
	                    if(ge[?FFk.val] == noone) txt = ge[?FFk.val_arr][0][?FFk.ref].str
	                    else txt = ge[?FFk.val][?FFk.ref].str
	                    var txtx = lerp(xy[0],xy[2],0.5)
	                    var txty = lerp(xy[1],xy[3],0.5)
	                    var txtw = xy[2]-xy[0]
	                    if(string_width_ext(txt,M.FF.margin.STR_H,txtw) < txtw)
	                        draw_text_ext_color(txtx,txty,txt,M.FF.margin.STR_H,txtw,cmp[?FFk.fgc][0],
	                            cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],a)
						
	                    if(ge[?FFk.val_arr] != noone) {
							
	                        var sz = array_length_1d(ge[?FFk.val_arr])
	                        var lim = ge[?FFk.val_arr][0][?FFk.ref].stack_lim
							
	                        var a = 0.67
	                        draw_set_halign(fa_left)
	                        draw_set_valign(fa_top)
	                        var txt = string("{0}{1}{2}",sz,"/",lim)
	                        var txtx = xy[0]+M.FF.margin.SM
	                        var txty = xy[1]+M.FF.margin.SM
	                        var txtw = xy[2]-xy[0]
	                        if(string_width_ext(txt,M.FF.margin.STR_H,txtw) < txtw)
	                            draw_text_ext_color(txtx,txty,txt,M.FF.margin.STR_H,txtw,cmp[?FFk.fgc][0],
	                                cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],a)
							
	                    }
						
	                } else if(ge[?FFk.type] != noone) {
						
	                    // Slot Empty, but has paramaters
	                    // Slot Label
	                    if(!is_undefined(ge[?FFk.type].str)) {
							
	                        var a = 0.67
	                        draw_set_halign(fa_middle)
	                        draw_set_valign(fa_center)
	                        var txt = ge[?FFk.type].str
	                        var txtx = lerp(xy[0],xy[2],0.5)
	                        var txty = lerp(xy[1],xy[3],0.5)
	                        var txtw = xy[2]-xy[0]
	                        if(string_width_ext(txt,M.FF.margin.STR_H,txtw) < txtw)
	                            draw_text_ext_color(txtx,txty,txt,M.FF.margin.STR_H,txtw,cmp[?FFk.fgc][0],
	                                cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],a)
							
	                    }
						
	                }
					
	            #endregion
				
	            // Mouse Inside Slot?
	            if(mouse_x-M.FF.surface_xy[0] >= xy[0] and mouse_x-M.FF.surface_xy[0] <= xy[2]
	                and mouse_y-M.FF.surface_xy[1] >= xy[1] and mouse_y-M.FF.surface_xy[1] <= xy[3]) {
					
	                #region Init Bools
						
	                    // Init - What is drag?
	                    var drag_is_empty = (M.FF.mouse_drag_list == noone)
	                    var drag_is_single = (!drag_is_empty and !ds_exists(M.FF.mouse_drag_list,ds_type_list))
	                    var drag_is_stack = (!drag_is_single and !drag_is_empty)
						
	                    // Init - What is slot?
	                    var slot_is_empty = (ge[?FFk.val] == noone and ge[?FFk.val_arr] == noone)
	                    var slot_is_single = (ge[?FFk.val] != noone and ge[?FFk.val_arr] == noone)
	                    var slot_is_stack = (ge[?FFk.val] == noone and ge[?FFk.val_arr] != noone)
						
	                    // Init - What is ref?
	                    var drag_ref = noone
	                    var slot_ref = noone
	                    if(drag_is_single) drag_ref = M.FF.mouse_drag_list[?FFk.ref]
	                    else if(drag_is_stack) drag_ref = M.FF.mouse_drag_list[|0][?FFk.ref]
	                    if(slot_is_single) slot_ref = ge[?FFk.val][?FFk.ref]
	                    else if(slot_is_stack) slot_ref = ge[?FFk.val_arr][0][?FFk.ref]
						
	                    // Init - Types match?
	                    var slot_type_match = slot_drag_type_check(drag_ref,ge[?FFk.type])
						
	                    // Init - If slot and drag are not empty, do refs match?
	                    var slot_drag_match = noone
	                    if(drag_ref != noone and slot_ref != noone
	                        and drag_ref.uid == slot_ref.uid)
	                        slot_drag_match = true
	                    else if(drag_is_empty or slot_is_empty)
	                        slot_drag_match = true
	                    else slot_drag_match = false
						
	                    // Init if slot is stack..
	                    var slot_stack_give = noone
	                    var slot_stack_take = noone
	                    if(drag_is_empty or drag_is_stack) {
							
	                        var slot_stack_give = stack_can_take(ge)
	                        var slot_stack_take = stack_can_give(ge)
							
	                    }
						
	                #endregion
					
	                #region Draw Slot Hover Highlight
						
	                    if(M.FF.MBL or M.FF.MBR) draw_set_alpha(0.05)
	                    else draw_set_alpha(.125)
	                    draw_rectangle_color(xy[0],xy[1],xy[2],xy[3],cmp[?FFk.fgc][3],cmp[?FFk.fgc][2],
	                        cmp[?FFk.fgc][1],cmp[?FFk.fgc][0],false)
						
	                #endregion
					
	                #region Controls
						
	                    // Left click release, pick up
	                    if(M.FF.MBLR and !slot_is_empty and slot_drag_match
	                        and slot_type_match) {
							
	                        #region Left Click (Pick Up/Add to Drag)
								
	                            // Pickup non-stack (val)
	                            if(slot_is_single and drag_is_empty) {
									
	                                M.FF.mouse_drag_list = ge[?FFk.val]
	                                M.FF.mouse_drag_source = ge
	                                ge[?FFk.val] = noone
									
	                            // Pickup stack (val_arr)
	                            } else if(slot_is_stack and slot_stack_give > 0) {
									
	                                // Create drag list if not yet
	                                if(drag_is_empty)
	                                    M.FF.mouse_drag_list = ds_list_create()
									
	                                // Control key? Pick up half stack.
	                                if(M.FF.key_control) {
										
	                                    var limit = ge[?FFk.val_arr][0][?FFk.ref].stack_lim*M.FF.entity.stack_pickup_multiplier
	                                    var sz = array_length_1d(ge[?FFk.val_arr])
										
	                                    repeat(max(1,round(slot_stack_take/2))) {
											
	                                        if(ge[?FFk.val_arr] != [] and ds_list_size(M.FF.mouse_drag_list) < limit) {
	                                            var pop_arr = array_pop(ge[?FFk.val_arr])
	                                            ds_list_add(M.FF.mouse_drag_list,pop_arr[0])
	                                            ge[?FFk.val_arr] = pop_arr[1]
	                                        } else break
											
	                                    }
									
	                                // Shift key, pick up whole stack (as much as possible)
	                                } else if(M.FF.key_shift) {
										
	                                    var limit = ge[?FFk.val_arr][0][?FFk.ref].stack_lim*M.FF.entity.stack_pickup_multiplier
	                                    var sz = array_length_1d(ge[?FFk.val_arr])
										
										repeat(sz) {
											
	                                        if(ge[?FFk.val_arr] != [] and ds_list_size(M.FF.mouse_drag_list) < limit) {
	                                            var pop_arr = array_pop(ge[?FFk.val_arr])
	                                            ds_list_add(M.FF.mouse_drag_list,pop_arr[0])
	                                            ge[?FFk.val_arr] = pop_arr[1]
	                                        } else break
											
	                                    }
										
	                                // No key, pick up one
	                                } else {
										
	                                    var pop_arr = array_pop(ge[?FFk.val_arr])
	                                    ds_list_add(M.FF.mouse_drag_list, pop_arr[0])
	                                    ge[?FFk.val_arr] = pop_arr[1]
										
	                                    if(ge[?FFk.val_arr] == [])
	                                        ge[?FFk.val_arr] = noone
										
	                                }
									
	                                // Destroy Drag List if empty; Set to noone
	                                if(ds_list_empty(M.FF.mouse_drag_list)) {
										
	                                    ds_list_destroy(M.FF.mouse_drag_list)
	                                    M.FF.mouse_drag_list = noone
										
	                                }
									
	                            }
								
	                            M.FF.runtime_frame_delay = 1
								
	                        #endregion
						
	                    // Right click, put down
	                    } else if(M.FF.MBRR and !drag_is_empty and slot_drag_match
	                        and slot_type_match) {
							
	                        #region Right Click (Add to slot/Put down)
								
	                            // Put non-stack (val)
	                            if(slot_is_empty and drag_is_single) {
									
	                                ge[?FFk.val] = M.FF.mouse_drag_list
	                                M.FF.mouse_drag_list = noone
	                                M.FF.mouse_drag_source = noone
	                                M.FF.mouse_drag_destination = noone
									
	                            // Put stack (val_arr)
	                            } else if((!slot_is_single and slot_stack_take > 0)
	                                or slot_is_empty) {
									
	                                if(slot_is_empty) ge[?FFk.val_arr] = []
									
	                                // Control key? Put half stack.
	                                if(M.FF.key_control) {
										
	                                    var limit = M.FF.mouse_drag_list[|0][?FFk.ref].stack_lim
	                                    repeat(max(1,round(slot_stack_take/2))) {
											
	                                        var sz = array_length_1d(ge[?FFk.val_arr])
	                                        if(!ds_list_empty(M.FF.mouse_drag_list) and sz < limit)
	                                            ge[?FFk.val_arr][array_length_1d(ge[?FFk.val_arr])] = list_pop(M.FF.mouse_drag_list)
	                                        else break
											
	                                    }
										
	                                // Shift key, Put whole stack (as much as possible)
	                                } else if(M.FF.key_shift) {
										
	                                    var limit = M.FF.mouse_drag_list[|0][?FFk.ref].stack_lim
	                                    repeat(slot_stack_take) {
											
	                                        var sz = array_length_1d(ge[?FFk.val_arr])
	                                        if(!ds_list_empty(M.FF.mouse_drag_list) and sz < limit)
	                                            ge[?FFk.val_arr][array_length_1d(ge[?FFk.val_arr])] = list_pop(M.FF.mouse_drag_list)
	                                        else break
											
	                                    }
										
	                                // No key, put one
	                                } else ge[?FFk.val_arr][array_length_1d(ge[?FFk.val_arr])] = list_pop(M.FF.mouse_drag_list)
									
	                                if(ge[?FFk.val_arr] == []) ge[?FFk.val_arr] = noone
									
	                                // Destroy Drag List if empty; Set to noone
	                                if(ds_list_empty(M.FF.mouse_drag_list)) {
										
	                                    ds_list_destroy(M.FF.mouse_drag_list)
	                                    M.FF.mouse_drag_list = noone
										
	                                }
									
	                            }
								
	                            M.FF.runtime_frame_delay = 1
								
	                        #endregion
							
	                    // Nothing, Update drag destination
	                    } else if(M.FF.mouse_drag_list != noone) {
							
	                        M.FF.mouse_drag_destination = ge
							
	                    }
						
	                #endregion
					
	            }
				
	        }
			
	    }
		
	#endregion
	
	#region Interaction/Hilight Logic
		
	    var in_cmp = true // Used to return if mouse is inside button
	    if(mouse_x-M.FF.surface_xy[0] > cmp[?FFk.xy][0]-M.FF.margin.SM and mouse_x-M.FF.surface_xy[0] < cmp[?FFk.xy][2]+M.FF.margin.SM
	        and mouse_y-M.FF.surface_xy[1] > cmp[?FFk.xy][1]-M.FF.margin.SM and mouse_y-M.FF.surface_xy[1] < cmp[?FFk.xy][3]+M.FF.margin.SM
	        and cmp[?FFk.active] and !M.FF.frame.menu_override and !cmp[?FFk.override]) {
			
	        if(cmp[?FFk.scroll]) {
				
	            // Do Scroll (Wheel up/down)
	            if(M.FF.MWU ) cmp[?FFk.scrolly] += 1
	            else if(M.FF.MWD) cmp[?FFk.scrolly] -= 1
	            cmp[?FFk.scrolly] = clamp(cmp[?FFk.scrolly],-rows+1,0)
				
	        }
			
	    } else in_cmp = false
		
	#endregion
	
	#region Text
		
	    if(cmp[?FFk.str] != noone and cmp[?FFk.str] != "") {
			
	        var a
	        if(!cmp[?FFk.active]) a = cmp[?FFk.fga]/2
	        else a = cmp[?FFk.fga]
	        draw_set_halign(fa_left)
	        draw_set_valign(fa_bottom)
	        var txt = cmp[?FFk.str]
	        var txtx = cmp[?FFk.xy][0]
	        var txty = cmp[?FFk.xy][1]-M.FF.margin.SM
	        var txtw = cmp[?FFk.xy][2]-cmp[?FFk.xy][0]
	        if(string_width_ext(txt,M.FF.margin.STR_H,txtw) < txtw)
	            draw_text_ext_color(txtx,txty,txt,M.FF.margin.STR_H,txtw,cmp[?FFk.fgc][0],
	                cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],a)
			
	    }
		
	#endregion
	
	// Return whether or not mouse inside btn
	return in_cmp
	
}

function toggle_draw() {
	
	#region Params
		
	    var cmp = argument0
		
	#endregion
	
	#region Draw Body
		
	    // BG
	    draw_set_alpha(cmp[?FFk.bga])
	    draw_rectangle_color(cmp[?FFk.xy][0],cmp[?FFk.xy][1],cmp[?FFk.xy][2],cmp[?FFk.xy][3],
	        cmp[?FFk.bgc][0],cmp[?FFk.bgc][1],cmp[?FFk.bgc][2],cmp[?FFk.bgc][3],false)
		
	    // Outline
	    if(!cmp[?FFk.active]) draw_set_alpha(cmp[?FFk.fga]/2)
	    else draw_set_alpha(cmp[?FFk.fga])
	    draw_rectangle_color(cmp[?FFk.xy][0],cmp[?FFk.xy][1],cmp[?FFk.xy][2],cmp[?FFk.xy][3],
	        cmp[?FFk.fgc][0],cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],true)
		
	#endregion
	
	#region Interaction/Hilight Logic
		
	    var in_cmp = false // Used to return if mouse is inside button
	    if(mouse_x-M.FF.surface_xy[0] > cmp[?FFk.xy][0]-M.FF.margin.SM and mouse_x-M.FF.surface_xy[0] < cmp[?FFk.xy][2]+M.FF.margin.SM
	        and mouse_y-M.FF.surface_xy[1] > cmp[?FFk.xy][1]-M.FF.margin.SM and mouse_y-M.FF.surface_xy[1] < cmp[?FFk.xy][3]+M.FF.margin.SM
	        and cmp[?FFk.active] and !M.FF.frame.menu_override and !cmp[?FFk.override]) {
			
	        in_cmp = true
			
	        // Draw
	        if(!cmp[?FFk.state]) {
				
	            if(M.FF.MBL) {
					
	                // If Clicking..
	                draw_set_alpha(cmp[?FFk.fga]*.05)
					
	                // Depress..
	                if(array_equals(cmp[?FFk.bgc],cmp[?FFk.bgc_o]))
	                    cmp[?FFk.bgc] = invert_array(cmp[?FFk.bgc])
					
	            } else {
					
	                // If Unclicked..
	                draw_set_alpha(cmp[?FFk.fga]*.125)
					
	                // Undepress..
	                if(!array_equals(cmp[?FFk.bgc],cmp[?FFk.bgc_o]))
	                    cmp[?FFk.bgc] = array_dupe(cmp[?FFk.bgc],cmp[?FFk.bgc_o])
					
	            }
				
	            // Draw FG
	            draw_rectangle_color(cmp[?FFk.xy][0],cmp[?FFk.xy][1],cmp[?FFk.xy][2],cmp[?FFk.xy][3],
	                cmp[?FFk.fgc][0],cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],false)
				
	        } else {
				
	            draw_set_alpha(cmp[?FFk.fga])
	            if(M.FF.MBL) {
					
	                // If Clicking..
	                // Depress..
	                if(array_equals(cmp[?FFk.fgc],cmp[?FFk.fgc_o]))
	                    cmp[?FFk.fgc] = invert_array(cmp[?FFk.fgc])
					
	            } else {
					
	                // If Unclicked..
	                // Undepress..
	                if(!array_equals(cmp[?FFk.fgc],cmp[?FFk.fgc_o]))
	                    cmp[?FFk.fgc] = array_dupe(cmp[?FFk.fgc],cmp[?FFk.fgc_o])
					
	            }
				
	            draw_rectangle_color(cmp[?FFk.xy][0]+M.FF.margin.SM,cmp[?FFk.xy][1]+M.FF.margin.SM,cmp[?FFk.xy][2]-M.FF.margin.SM,cmp[?FFk.xy][3]-M.FF.margin.SM,
	                cmp[?FFk.fgc][0],cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],false)
				
	        }
			
	        // Do Action if Clicked on
	        if(M.FF.MBLR) { 
	            cmp[?FFk.state] = !cmp[?FFk.state]
	            toggle_action(cmp)
	        }
			
	    } else if(cmp[?FFk.state]) {
			
	        draw_set_alpha(cmp[?FFk.fga])
	        draw_rectangle_color(cmp[?FFk.xy][0]+M.FF.margin.SM,cmp[?FFk.xy][1]+M.FF.margin.SM,cmp[?FFk.xy][2]-M.FF.margin.SM,cmp[?FFk.xy][3]-M.FF.margin.SM,
	            cmp[?FFk.fgc][0],cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],false)
			
	        // Undepress.. (BGC)
	        if(!array_equals(cmp[?FFk.bgc],cmp[?FFk.bgc_o]))
	            cmp[?FFk.bgc] = array_dupe(cmp[?FFk.bgc],cmp[?FFk.bgc_o])
			
	    } else if(!array_equals(cmp[?FFk.bgc],cmp[?FFk.bgc_o])) // Undepress..
	        cmp[?FFk.bgc] = array_dupe(cmp[?FFk.bgc],cmp[?FFk.bgc_o])
		
	    // Undepress.. (FGC)
	    if(!array_equals(cmp[?FFk.fgc],cmp[?FFk.fgc_o]))
	        cmp[?FFk.fgc] = array_dupe(cmp[?FFk.fgc],cmp[?FFk.fgc_o])
		
	#endregion
	
	#region Text
		
	    var a
	    if(!cmp[?FFk.active]) a = cmp[?FFk.fga]/2
	    else a = cmp[?FFk.fga]
	    draw_set_halign(fa_left)
	    draw_set_valign(fa_center)
	    var txt = cmp[?FFk.str]
	    var txtx = cmp[?FFk.xy][2] + M.FF.margin.MD
	    var txty = (((cmp[?FFk.xy][3]-cmp[?FFk.xy][1])/2)+cmp[?FFk.xy][1])
	    var txtw = cmp[?FFk.bound][2]-txtx
	    if(txtx+string_width_ext(txt,M.FF.margin.STR_H,txtw) < cmp[?FFk.bound][2])
	        draw_text_ext_color(txtx,txty,txt,M.FF.margin.STR_H,txtw,cmp[?FFk.fgc][0],
	            cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],a)
		
	#endregion
	
	// Return whether or not mouse inside btn
	return in_cmp
	
}

function vert_bar_draw() {
	
	#region Params
		
	    var cmp = argument0
			
	#endregion
	
	#region Draw Outline
		
	    // Outline
	    if(!cmp[?FFk.active]) draw_set_alpha(cmp[?FFk.fga]/2)
	    else draw_set_alpha(cmp[?FFk.fga])
	    draw_rectangle_color(cmp[?FFk.xy][0]-2,cmp[?FFk.xy][1]-2,cmp[?FFk.xy][2]+2,cmp[?FFk.xy][3]+2,
	        cmp[?FFk.fgc][0],cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],true)
		
	#endregion
	
	#region Interaction/Hilight Logic / Draw Body
		
	    // Init H Calc
	    var h_pct = 1
	    var h = (cmp[?FFk.xy][3] - cmp[?FFk.xy][1])*h_pct
	    if(cmp[?FFk.val_arr] != noone) {
			
	        var val_map = map_val_arr(cmp[?FFk.val_arr])
			
	        h_pct = pct(val_map[?FFk.val],val_map[?FFk.val_mn],val_map[?FFk.val_mx])
	        h = (cmp[?FFk.xy][3] - cmp[?FFk.xy][1])*h_pct
			
	        ds_map_destroy(val_map)
			
	    }
		
	    var in_cmp = true // Used to return if mouse is inside button
	    if(mouse_x-M.FF.surface_xy[0] > cmp[?FFk.xy][0]-M.FF.margin.SM and mouse_x-M.FF.surface_xy[0] < cmp[?FFk.xy][2]+M.FF.margin.SM
	        and mouse_y-M.FF.surface_xy[1] > cmp[?FFk.xy][1]-M.FF.margin.SM and mouse_y-M.FF.surface_xy[1] < cmp[?FFk.xy][3]+M.FF.margin.SM
	        and cmp[?FFk.active] and !M.FF.frame.menu_override and !cmp[?FFk.override]) {
            
	        // BG
	        draw_set_alpha(cmp[?FFk.bga]*.8)
	        draw_rectangle_color(cmp[?FFk.xy][0],cmp[?FFk.xy][3]-h,cmp[?FFk.xy][2],cmp[?FFk.xy][3],
	            cmp[?FFk.bgc][0],cmp[?FFk.bgc][1],cmp[?FFk.bgc][2],cmp[?FFk.bgc][3],false)
			
	    } else {
			
	        // BG
	        draw_set_alpha(cmp[?FFk.bga])
	        draw_rectangle_color(cmp[?FFk.xy][0],cmp[?FFk.xy][3]-h,cmp[?FFk.xy][2],cmp[?FFk.xy][3],
	            cmp[?FFk.bgc][0],cmp[?FFk.bgc][1],cmp[?FFk.bgc][2],cmp[?FFk.bgc][3],false)
			
	        in_cmp = false
			
	    }
		
	#endregion
	
	// Return whether or not mouse inside btn
	return in_cmp
	
}

function vert_space_draw() {
	
	#region Params%CFG
		
	    var cmp = argument0
		
	#endregion
	
	switch(cmp[?FFk.type]) {
		
	    case FF_spacer.line: {
			
	        // Draw Full Line
	        draw_set_alpha(cmp[?FFk.fga])
	        var xx = lerp(cmp[?FFk.xy][0],cmp[?FFk.xy][2],.5)+1
	        draw_line_width_color(xx,cmp[?FFk.xy][1],xx,cmp[?FFk.xy][3],
	            cmp[?FFk.line_w],cmp[?FFk.fgc][0],cmp[?FFk.fgc][2])
			
	        break
			
	    }
		
	    case FF_spacer.none: {
			
	        // Nothing duh; sweet sweet simplicity
	        break
			
	    }
		
	}
	
	// Return false since this isn'true really an interactable component
	return false
	
}