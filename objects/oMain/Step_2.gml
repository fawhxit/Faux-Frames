/// @description
if(FF.debug) trace("End Step")
#region End Step
    
    #region Updates and Iterations
        
        #region Mouse
            
            // Mouse
            FF.mouse_x_delta = mouse_x-FF.mouse_x_old
            FF.mouse_y_delta = mouse_y-FF.mouse_y_old
            FF.mouse_x_old = mouse_x
            FF.mouse_y_old = mouse_y
            
        #endregion
        
        #region Window/Keyboard Iterators (Frames/Seconds/Minutes)
            
            // Keyboard Key Hold Logic
            kb_hold_iter()
            
            FF.runtime_frame += 1 // Frame Iterate
            if(FF.runtime_frame_delay > 0) FF.runtime_frame_delay -= 1 // Second Delay Deiterate
            
            if(FF.runtime_frame >= room_speed) { // Second Iterate
            
                FF.runtime_frame = 0
                FF.runtime_second += 1
                if(FF.runtime_second_delay > 0) FF.runtime_second_delay -= 1 // Second Delay Deiterate
                
                if(FF.runtime_second >= 60) { // Minute Iterate
                
                    FF.runtime_second = 0
                    FF.runtime_minute += 1
                    if(FF.runtime_minute_delay > 0) FF.runtime_minute_delay -= 1 // Minute Delay Deiterate
                    
                    if(FF.runtime_minute >= 60) { // Hour Iterate
                        FF.runtime_minute = 0
                        FF.runtime_hour += 1
                        if(FF.runtime_hour_delay > 0) FF.runtime_hour_delay -= 1 // Delay Deiterate
                    }
                    
                }
                
            }
            
        #endregion
        
        #region Keyboard (Locks n Such)
            
            if(keyboard_check_pressed(20)) FF.caps_lock = !FF.caps_lock
            
        #endregion
        
    #endregion
    
#endregion