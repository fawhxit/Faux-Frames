/// @description
if(FF.debug) trace("End Draw GUI")
#region End Draw GUI
    
    if(!FF.frame.draw_break) draw_gui_frames2()
    else if(FF.debug) trace("FF.frame.draw_break GUI Frames2")
    
    #region Mouse Drag
        
        if(FF.mouse_drag_list != noone) {
            
            var a = 1
            draw_set_halign(fa_middle)
            draw_set_valign(fa_bottom)
            var txt = "ERR"
            if(ds_exists(FF.mouse_drag_list,ds_type_list)) {
                txt = FF.mouse_drag_list[|0][?FFk.ref].str + " x" + ds_list_size(FF.mouse_drag_list)
            } else txt = FF.mouse_drag_list[?FFk.ref].str
            var txtx = mouse_x
            var txty = mouse_y - FF.margin.SM
            var txtw = 200
            draw_text_ext_color(txtx,txty,txt,FF.margin.STR_H,txtw,c_white,c_white,
                c_white,c_white,a)
            
            /*
            
            // Compatibility Check
            var slot_compat = false
            if(FF.mouse_drag_destination != noone) {
                
                // Init
                var dest_slot = noone
                
                // Slot has type?
                if(FF.mouse_drag_destination[?FFk.ref] != noone) {
                    
                    // Get slot type
                    dest_slot = FF.mouse_drag_destination[?FFk.ref].uid
                    
                    // Get item type
                    var item_slots = noone
                    // Stack..
                    if(ds_exists(FF.mouse_drag_list,ds_type_list))
                        item_slots = FF.mouse_drag_list[|0][?FFk.ref].slots
                    // Non-stack..
                    else item_slots = FF.mouse_drag_list[?FFk.ref].slots
                    
                    // No Slots Defined for Item, anything can go in certain slots..
                    if(item_slots == noone and (dest_slot == FF_slot.r_hand
                        or dest_slot == FF_slot.l_hand)) {
                        
                        slot_compat = true
                        
                    // Atleast 1 slot defined..
                    } else for(var i = 0; i < array_length_1d(item_slots); i++) {
                        
                        if(item_slots[i] == dest_slot) {
                            
                            slot_compat = true
                            break
                            
                        }
                        
                    }
                    
                } else slot_compat = true // No slot type for slot? Anything goes..
                
            }
            
            */
            
            /* LEGACY LEGACY LEGACY
            // Put
            if(FF.MBRP and FF.runtime_frame_delay == 0) {
                
                // Move to Empty Slot..
                if(FF.mouse_drag_destination != noone and FF.mouse_drag_destination[?FFk.val] == noone
                    and FF.mouse_drag_destination[?FFk.val_arr] == noone and slot_compat) {
                    
                    if(ds_exists(FF.mouse_drag_list,ds_type_list)) {
                        
                        var pop = list_pop(FF.mouse_drag_list)
                        
                        FF.mouse_drag_destination[?FFk.val_arr] = []
                        FF.mouse_drag_destination[?FFk.val_arr][0] = pop
                        
                        // Is list only 1 size? Same as Releasing All.
                        if(ds_list_empty(FF.mouse_drag_list)) {
                            
                            ds_list_destroy(FF.mouse_drag_list)
                            FF.mouse_drag_list = noone
                            FF.mouse_drag_destination = noone
                            FF.mouse_drag_source = noone
                            
                        }
                    
                    // Putting non-stackable? Same as Releasing All.
                    } else {
                        
                        FF.mouse_drag_destination[?FFk.val] = FF.mouse_drag_list
                        
                        FF.mouse_drag_list = noone
                        FF.mouse_drag_destination = noone
                        FF.mouse_drag_source = noone
                        
                    }
                
                // Pick up More? (Control)
                } else if(FF.key_control and FF.mouse_drag_destination[?FFk.val_arr] != noone
                    and ds_exists(FF.mouse_drag_list,ds_type_list)) {
                    
                    // Pick up 1 more from stack..
                    var e = array_pop(FF.mouse_drag_destination[?FFk.val_arr])
                    
                    if(e != noone) {
                        
                        ds_list_add(FF.mouse_drag_list,e[0])
                        FF.mouse_drag_destination[?FFk.val_arr] = e[1]
                        
                    }
                    
                // Try merging stacks if they match..
                } else if(FF.mouse_drag_destination != noone and FF.mouse_drag_destination[?FFk.val_arr] != noone
                    and ds_exists(FF.mouse_drag_list,ds_type_list) and slot_compat) {
                    
                    // Shorten Refs
                    var DDr = FF.mouse_drag_destination[?FFk.val_arr][0][?FFk.ref]
                    var DLr = FF.mouse_drag_list[|0][?FFk.ref]
                    
                    // Init Stack Sizes/Free
                    var DD_sz = array_length_1d(FF.mouse_drag_destination[?FFk.val_arr])
                    var DL_sz = ds_list_size(FF.mouse_drag_list)
                    var free = DDr.stack_lim - DD_sz
                    
                    // If stacks match and can fit atleast 1 in destination..
                    if(DDr.uid == DLr.uid and free > 0 and DL_sz > 0) {
                        
                        var pop = list_pop(FF.mouse_drag_list)
                        
                        FF.mouse_drag_destination[?FFk.val_arr][DD_sz] = pop
                        
                        // Is list only 1 size? Same as Releasing All.
                        if(ds_list_empty(FF.mouse_drag_list)) {
                            
                            ds_list_destroy(FF.mouse_drag_list)
                            FF.mouse_drag_list = noone
                            FF.mouse_drag_destination = noone
                            FF.mouse_drag_source = noone
                            
                        }
                        
                    }
                    
                }
                
            }
            */
            
            /* LEGACY LEGACY LEGACY
            // Release All
            if(FF.MBLP and FF.runtime_frame_delay == 0) {
                
                // Move to Empty Slot..
                if(FF.mouse_drag_destination != noone and FF.mouse_drag_destination[?FFk.val] == noone
                    and FF.mouse_drag_destination[?FFk.val_arr] == noone and slot_compat) {
                    
                    if(ds_exists(FF.mouse_drag_list,ds_type_list)) {
                        
                        FF.mouse_drag_destination[?FFk.val_arr] = list_to_array(FF.mouse_drag_list)
                        ds_list_destroy(FF.mouse_drag_list)
                        
                    } else FF.mouse_drag_destination[?FFk.val] = FF.mouse_drag_list
                    
                    FF.mouse_drag_list = noone
                    FF.mouse_drag_destination = noone
                    FF.mouse_drag_source = noone
                    
                // Try merging stacks if they match..
                } else if(FF.mouse_drag_destination != noone and FF.mouse_drag_destination[?FFk.val_arr] != noone
                    and ds_exists(FF.mouse_drag_list,ds_type_list) and slot_compat) {
                    
                    // Shorten Refs
                    var DDr = FF.mouse_drag_destination[?FFk.val_arr][0][?FFk.ref]
                    var DLr = FF.mouse_drag_list[|0][?FFk.ref]
                    
                    // Init Stack Sizes/Free
                    var DD_sz = array_length_1d(FF.mouse_drag_destination[?FFk.val_arr])
                    var DL_sz = ds_list_size(FF.mouse_drag_list)
                    var free = DDr.stack_lim - DD_sz
                    
                    // If stacks match and can fit atleast 1 in destination..
                    if(DDr.uid == DLr.uid and free > 0 and DL_sz > 0) {
                        
                        for(var i = 0; i < free; i++) {
                            
                            // Add to destination, and remove from dragged
                            FF.mouse_drag_destination[?FFk.val_arr][array_length_1d(FF.mouse_drag_destination[?FFk.val_arr])] = FF.mouse_drag_list[|0]
                            ds_list_delete(FF.mouse_drag_list,0)
                            
                            // If all have been added, cleanup and break
                            if(ds_list_empty(FF.mouse_drag_list)) {
                                
                                ds_list_destroy(FF.mouse_drag_list)
                                FF.mouse_drag_list = noone
                                FF.mouse_drag_source = noone
                                FF.mouse_drag_destination = noone
                                break
                                
                            }
                            
                        }
                        
                    }
                    
                }
                
                // Otherwise Remove Remainder to Old
                if(FF.mouse_drag_list != noone and FF.mouse_drag_source != noone) {
                    
                    if(ds_exists(FF.mouse_drag_list,ds_type_list)) {
                        
                        if(FF.mouse_drag_source[?FFk.val_arr] == noone)
                            FF.mouse_drag_source[?FFk.val_arr] = list_to_array(FF.mouse_drag_list)
                        else {
                            
                            var arr = list_to_array(FF.mouse_drag_list)
                            array_copy(FF.mouse_drag_source[?FFk.val_arr],array_length_1d(FF.mouse_drag_source[?FFk.val_arr]),
                                arr,0,array_length_1d(arr))
                            
                        }
                        
                        ds_list_destroy(FF.mouse_drag_list)
                        
                    } else FF.mouse_drag_source[?FFk.val] = FF.mouse_drag_list
                    
                    FF.mouse_drag_list = noone
                    FF.mouse_drag_destination = noone
                    FF.mouse_drag_source = noone
                    
                }
                
            }
            */
            
        }
        
    #endregion
    
    #region Debug Stuff
        
        if FF.debug {
            
            // Init
            var str = ""
            if FF.runtime_hour < 10 then str += "0"
            str += FF.runtime_hour + " : "
            if FF.runtime_minute < 10 then str += "0"
            str += FF.runtime_minute + " : "
            if FF.runtime_second < 10 then str += "0"
            str += FF.runtime_second + " : "
            if FF.runtime_frame < 10 then str += "0"
            str += FF.runtime_frame
            draw_set_halign(fa_left)
            draw_set_valign(fa_top)
            draw_text_ext_color(FF.margin.SM,FF.margin.SM,str,FF.margin.STR_H,FF.margin.RW4,
                FF.runtime_foreground_color[0],FF.runtime_foreground_color[1],FF.runtime_foreground_color[2],FF.runtime_foreground_color[3],FF.runtime_foreground_alpha)
                
        }
        
    #endregion
    
    #region Break Ends
    
        if(FF.runtime_frame_delay <= 0) FF.frame.draw_break = false
    
    #endregion
    
    // Ensure FF.frame.focus is active
    if(FF.frame.focus != noone and !FF.frame.map_list[|FF.frame.focus][?FFk.active]) FF.frame.focus = noone
    
#endregion