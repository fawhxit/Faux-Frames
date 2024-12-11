/// @description
if(FF.debug) trace("Begin Draw")
#region Begin Draw
    
    #region Free All Surfaces
        
        if(!ds_map_empty(FF.surface_map)) {
            
            for(var ky = ds_map_find_first(FF.surface_map); !is_undefined(ky); ky = ds_map_find_next(FF.surface_map,ky))
                surface_free(FF.surface_map[?ky])
            
            ds_map_clear(FF.surface_map)
            
        }
        
    #endregion
    
    #region Screen
        
        draw_screen()
        
    #endregion
    
#endregion