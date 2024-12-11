/// @description

if(FF.debug) trace("Begin Step")
#region Begin Step
    
    #region Update Input Checks
        
        #region Runtime
            
            // Window
            FF.margin.RW2 = round(FF.runtime_width/2)
            FF.margin.RW4 = round(FF.runtime_width/4)
            FF.margin.RW8 = round(FF.runtime_width/8)
            FF.margin.RW16 = round(FF.runtime_width/16)
            FF.margin.RH2 = round(FF.runtime_height/2)
            FF.margin.RH4 = round(FF.runtime_height/4)
            FF.margin.RH8 = round(FF.runtime_height/8)
            FF.margin.RH16 = round(FF.runtime_height/16)
            
            // Main
            FF.main.scroll_spd = FF.margin.STR_H
            
        #endregion
        
        #region Mouse
            
            // Buttons/Wheel Checks
            // MB Left
            FF.MBL = mouse_check_button(mb_left)
            FF.MBLP = mouse_check_button_pressed(mb_left)
            FF.MBLR = mouse_check_button_released(mb_left)
            
            // MB Middle
            FF.MBM = mouse_check_button(mb_middle)
            FF.MBMP = mouse_check_button_pressed(mb_middle)
            FF.MBMR = mouse_check_button_released(mb_middle)
            
            // MB Right
            FF.MBR = mouse_check_button(mb_right)
            FF.MBRP = mouse_check_button_pressed(mb_right)
            FF.MBRR = mouse_check_button_released(mb_right)
            
            // Wheel
            FF.MWU = mouse_wheel_up()
            FF.MWD = mouse_wheel_down()
            
        #endregion
        
        #region Keyboard
            
            // Key Checks
            // General
            FF.key_enter = keyboard_check(vk_enter)
            FF.key_enter_p = keyboard_check_pressed(vk_enter)
            FF.key_back = keyboard_check(vk_backspace)
            FF.key_back_p = keyboard_check_pressed(vk_backspace)
            // Mod
            FF.key_shift = keyboard_check(vk_shift)
            FF.key_control = keyboard_check(vk_control)
            FF.key_insert_p = keyboard_check_pressed(vk_insert)
            // Arrow
            FF.key_up = keyboard_check(vk_up)
            FF.key_down = keyboard_check(vk_down)
            FF.key_left = keyboard_check(vk_left)
            FF.key_right = keyboard_check(vk_right)
            FF.key_arrow_p = (keyboard_check_pressed(vk_up) or keyboard_check_pressed(vk_down) or keyboard_check_pressed(vk_left) or keyboard_check_pressed(vk_right))
            
        #endregion
        
    #endregion
    
    // Ensure FF.frame.focus is active
    if(FF.frame.focus != noone and !FF.frame.map_list[|FF.frame.focus][?FFk.active]) FF.frame.focus = noone
    
    if(keyboard_check_pressed(vk_f1)) {
        
        FF.runtime_console[?FFk.active] = !FF.runtime_console[?FFk.active]
        if(FF.runtime_console[?FFk.active]) {
            set_top_frame(get_frame(FF.UID.rt_console))
            FF.frame.focus = get_frame(FF.UID.rt_console)
            keyboard_string = FF.runtime_console[?FFk.con_cfg][?FFk.inp_cfg][?FFk.str]
        } else FF.frame.focus = noone
        
    } else if(FF.main.game.state != FF_game.none and FF.main.game.state != FF_game.pause and keyboard_check_pressed(FF.command.menu.ky)) {
        
        #region Toggle Main Menu n game state
            
            var mm = FF.frame.map_list[|get_frame(FF.UID.main_menu)]
            mm[?FFk.active] = true
            FF.main.game.state_prv = FF.main.game.state
            FF.main.game.state = FF_game.pause
            
        #endregion
        
        #region Insert resume button into menu
            
            var varr = mm[?FFk.cmpnt_cfg][?FFk.varr]
            var first_btn = cmpnt_find_type_first(varr,FF_component.btn)
            var btn_h = varr[first_btn[0]][first_btn[1]][?FFk.h_pct]
            if(first_btn != noone) {
                
                if(varr[first_btn[0]][first_btn[1]][?FFk.action] != FF_action.resume) {
                    
                    // Move everything up in the cmpnt array to fit resume button in
                    for(var iy = array_height_2d(varr)-1; iy >= first_btn[0]; iy--) 
                        varr[iy+1] = varr[iy]
                    
                    // Insert new button for resume
                    varr[first_btn[0]] = []
                    varr[first_btn[0]][0] = button_create([0,0,0,0],invert_array(mm[?FFk.bgc]),mm[?FFk.bga],invert_array(mm[?FFk.fgc]),mm[?FFk.fga],"Resume",FF_action.resume,true)
                    varr[first_btn[0]][0][?FFk.w_pct] = .5
                    varr[first_btn[0]][0][?FFk.h_pct] = btn_h
                    varr[first_btn[0]][0][?FFk.hvalign][0] = fa_middle
                    varr[first_btn[0]][0][?FFk.hvalign][1] = fa_center
                        
                }
                
            } else FF.runtime_console[?FFk.out_cfg][?FFk.arr][array_length_1d(FF.runtime_console[?FFk.out_cfg][?FFk.arr])] = "ERROR: COULDN'T FIND FIRST BUTTON IN MENU."
            
        #endregion
        
        #region Pop GUI Holds
            
            for(var i = 0; i < ds_list_size(FF.frame.map_list); i++) {
                
                var frame = FF.frame.map_list[|i]
                if(frame[?FFk.uid] == "Main") continue // Skip Main Menu
                else if(frame[?FFk.active]) {
                    
                    ds_list_add(FF.frame.hold_list,frame)
                    frame[?FFk.active] = false
                    
                }
                
            }
            
        #endregion
        
        FF.frame.focus = noone
        FF.frame.draw_break = true
        
    }
    
#endregion