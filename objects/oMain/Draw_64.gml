/// @description
if(FF.debug) trace("Draw GUI")
#region Draw GUI
    
    #region In-Game GUI Stuff/Logic
        
        if(!FF.frame.ingame_override) {
        
        // We are doing Dynamic Entities here because
        // We need to draw tooltips on the GUI layer
        #region Dynamic Entities
                
                for(var i = 0; i < ds_list_size(FF.entity.dynamic.map_list); i++) {
                    
                    var e = FF.entity.dynamic.map_list[|i]
                    
                    #region Dynamic Entity Logic
                        
                        var xy = []
                        if(e[?FFk.ref].shape == FFv.circle) {
                            
                            xy[0] = (e[?FFk.xx]-(e[?FFk.ref].rsz*e[?FFk.scl]))-FF.margin.SM
                            xy[1] = (e[?FFk.yy]-(e[?FFk.ref].rsz*e[?FFk.scl]))-FF.margin.SM
                            xy[2] = (e[?FFk.xx]+(e[?FFk.ref].rsz*e[?FFk.scl]))+FF.margin.SM
                            xy[3] = (e[?FFk.yy]+(e[?FFk.ref].rsz*e[?FFk.scl]))+FF.margin.SM
                            
                        } else if(e[?FFk.ref].shape == FFv.rectangle) {
                            
                            xy[0] = (e[?FFk.xx]-((e[?FFk.ref].w/2)*e[?FFk.scl]))-FF.margin.SM
                            xy[1] = (e[?FFk.yy]-((e[?FFk.ref].h/2)*e[?FFk.scl]))-FF.margin.SM
                            xy[2] = (e[?FFk.xx]+((e[?FFk.ref].w/2)*e[?FFk.scl]))+FF.margin.SM
                            xy[3] = (e[?FFk.yy]+((e[?FFk.ref].h/2)*e[?FFk.scl]))+FF.margin.SM
                            
                        }
                        
                        if(mouse_x-FF.surface_xy[0] > xy[0] and mouse_x-FF.surface_xy[0] < xy[2]
                            and mouse_y-FF.surface_xy[1] > xy[1] and mouse_y-FF.surface_xy[1] < xy[3]) {
                            
                            #region Tooltip
                                
                                var type_str
                                if(e[?FFk.ref].type == FFv.food) type_str = "Food"
                                else if(e[?FFk.ref].type == FFv.resource) type_str = "Resource"
                                else if(e[?FFk.ref].type == FFv.weapon_tool) type_str = "Weapon/Tool"
                                else if(e[?FFk.ref].type == FFv.clothe_armor) type_str = "Clothe/Armor"
                                
                                var str_arr = [string(e[?FFk.ref].str)+" :",
                                    ["Weight : "+string(e[?FFk.ref].weight)],
                                    ["Type : "+type_str]]
                                
                                if(e[?FFk.ref].stack)
                                    str_arr[3] = ["Stack Limit: "+string(e[?FFk.ref].stack_lim)]
                                
                                // We pass console as the frame since we need
                                // to use some frame's colors/alphas and FF.runtime_console is
                                // the global console
                                draw_tool_tip(FF.runtime_console,str_arr)
                                
                            #endregion
                            
                            #region Pick Up
                                
                                if(FF.MBLP) {
                                    
                                    // Using 0 for singleplayer
                                    if(add_to_inv(0,e)) ds_list_delete(FF.entity.dynamic.map_list,i)
                                    
                                }
                                
                            #endregion
                            
                        }
                        
                    #endregion
                    
                }
            
        #endregion
        
        }
        
    #endregion
    
    if(!FF.frame.draw_break) draw_gui_frames()
    else if(FF.debug) trace("FF.frame.draw_break GUI Frames")
    
#endregion
