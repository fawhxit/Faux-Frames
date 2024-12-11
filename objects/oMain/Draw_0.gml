/// @description
if(FF.debug) trace("Draw")
#region Draw
    
    #region Game
        
        if(FF.main.game.state == FF_game.play
            or FF.main.game.state == FF_game.pause) {
            
            #region Draw Entities
                
                for(var i = 0; i < ds_list_size(FF.entity.map_list); i++) {
                    
                    var e = FF.entity.map_list[|i]
                    
                    draw_set_alpha(1)
                    if(e[?FFk.type] == FFv.food)
                        draw_circle_color(e[?FFk.xx],e[?FFk.yy],e[?FFk.rsz],FF.color.bronze.rgb,FF.color.brown.rgb,false)
                    else if(e[?FFk.type] == FFv.water)
                        draw_circle_color(e[?FFk.xx],e[?FFk.yy],e[?FFk.rsz],FF.color.blue.dark.rgb,FF.color.blue.rgb,false)
                    else if(e[?FFk.type] == FFv.lava)
                        draw_circle_color(e[?FFk.xx],e[?FFk.yy],e[?FFk.rsz],FF.color.orange.rgb,FF.color.ginger.rgb,false)
                    else if(e[?FFk.type] == FFv.bed)
                        draw_circle_color(e[?FFk.xx],e[?FFk.yy],e[?FFk.rsz],FF.color.gray.dark.rgb,FF.color.gray.darker.rgb,false)
                    
                    #region Entity Logic
                        
                        for(var i2 = 0; i2 < ds_list_size(FF.player.map_list); i2++) {
                            
                            var p2 = FF.player.map_list[|i2]
                            
                            if(p2[?FFk.xx] < e[?FFk.xx]+e[?FFk.rsz] and p2[?FFk.xx] > e[?FFk.xx]-e[?FFk.rsz]
                                and p2[?FFk.yy] < e[?FFk.yy]+e[?FFk.rsz] and p2[?FFk.yy] > e[?FFk.yy]-e[?FFk.rsz]) {
                                    
                                if(e[?FFk.type] == FFv.food)
                                    p2[?FFk.stat_cfg][?FFk.hun_cfg][?FFk.val] = clamp(p2[?FFk.stat_cfg][?FFk.hun_cfg][?FFk.val]-1,
                                        p2[?FFk.stat_cfg][?FFk.hun_cfg][?FFk.val_mn],p2[?FFk.stat_cfg][?FFk.hun_cfg][?FFk.val_mx])
                                else if(e[?FFk.type] == FFv.water)
                                    p2[?FFk.stat_cfg][?FFk.thi_cfg][?FFk.val] = clamp(p2[?FFk.stat_cfg][?FFk.thi_cfg][?FFk.val]-1,
                                        p2[?FFk.stat_cfg][?FFk.thi_cfg][?FFk.val_mn],p2[?FFk.stat_cfg][?FFk.thi_cfg][?FFk.val_mx])
                                else if(e[?FFk.type] == FFv.lava)
                                    p2[?FFk.stat_cfg][?FFk.hea_cfg][?FFk.val] = clamp(p2[?FFk.stat_cfg][?FFk.hea_cfg][?FFk.val]-1,
                                        p2[?FFk.stat_cfg][?FFk.hea_cfg][?FFk.val_mn],p2[?FFk.stat_cfg][?FFk.hea_cfg][?FFk.val_mx])
                                else if(e[?FFk.type] == FFv.bed)
                                    p2[?FFk.stat_cfg][?FFk.sle_cfg][?FFk.val] = clamp(p2[?FFk.stat_cfg][?FFk.sle_cfg][?FFk.val]-1,
                                        p2[?FFk.stat_cfg][?FFk.sle_cfg][?FFk.val_mn],p2[?FFk.stat_cfg][?FFk.sle_cfg][?FFk.val_mx])
                                
                            }
                            
                        }
                        
                    #endregion
                    
                }
                
            #endregion
            
            #region Draw Dynamic Entities
                
                for(var i = 0; i < ds_list_size(FF.entity.dynamic.map_list); i++) {
                    
                    var e = FF.entity.dynamic.map_list[|i]
                    
                    // Init Draw Rules
                    draw_set_alpha(1)
                    draw_set_halign(fa_middle)
                    draw_set_valign(fa_center)
                    
                    if(e[?FFk.ref].shape == FFv.circle)
                        draw_circle_color(e[?FFk.xx],e[?FFk.yy],e[?FFk.ref].rsz*e[?FFk.scl],e[?FFk.ref].col.rgb,e[?FFk.ref].col.rgb,false)
                    else if(e[?FFk.ref].shape == FFv.rectangle) {
                        
                        // Init
                        var w2 = round(e[?FFk.ref].w/2)
                        var h2 = round(e[?FFk.ref].h/2)
                        var col = e[?FFk.ref].col.rgb
                        
                        draw_rectangle_color(e[?FFk.xx]-w2,e[?FFk.yy]-h2,e[?FFk.xx]+w2,e[?FFk.yy]+h2,col,col,col,col,false)
                        
                    }
                    
                }
                
            #endregion
            
            #region Draw Player
                
                if(!ds_list_empty(FF.player.map_list)) {
                
                    var p = FF.player.map_list[|0]
                    draw_set_alpha(1)
                    
                    // Draw Body
                    draw_set_color(p[?FFk.col_skin].rgb)
                    draw_circle(p[?FFk.xx],p[?FFk.yy],p[?FFk.rsz],false)
                    
                    // Draw Underwear (outline)
                    draw_set_color(p[?FFk.col_und].rgb)
                    draw_circle(p[?FFk.xx],p[?FFk.yy],p[?FFk.rsz],true)
                    draw_circle(p[?FFk.xx],p[?FFk.yy],p[?FFk.rsz]+1,true)
                    draw_circle(p[?FFk.xx],p[?FFk.yy],p[?FFk.rsz]+2,true)
                    draw_circle(p[?FFk.xx],p[?FFk.yy],p[?FFk.rsz]+3,true)
                    draw_circle(p[?FFk.xx],p[?FFk.yy],p[?FFk.rsz]+4,true)
                    
                    // Draw Hair
                    var xy = []
                    if(p[?FFk.gender] == FFv.male) {
                        
                        xy[0] = p[?FFk.xx]-(p[?FFk.rsz]*.25)
                        xy[1] = p[?FFk.yy]-(p[?FFk.rsz]*1.34)
                        xy[2] = p[?FFk.xx]+(p[?FFk.rsz]*.25)
                        
                    } else {
                        
                        xy[0] = p[?FFk.xx]-p[?FFk.rsz]
                        xy[1] = p[?FFk.yy]-(p[?FFk.rsz]*1.05)
                        xy[2] = p[?FFk.xx]+p[?FFk.rsz]
                        
                    }
                        xy[3] = p[?FFk.yy]-(p[?FFk.rsz]*.6)
                    var w = xy[3]-xy[1]
                    var l = xy[2]-xy[0]
                    draw_set_color(p[?FFk.col_hair].rgb)
                    draw_rectangle(xy[0],xy[1],xy[2],xy[3],false)
                    if(p[?FFk.gender] == FFv.female) {
                        
                        draw_rectangle(xy[0]-(w/2),xy[1],xy[0]+(w/2),xy[1]+l+w,false)
                        draw_rectangle(xy[2]+(w/2),xy[1],xy[2]-(w/2),xy[1]+l+w,false)
                        
                    }
                    
                    // Draw Eyes
                    draw_set_color(p[?FFk.col_eye].rgb)
                    draw_circle(p[?FFk.xx]-(p[?FFk.rsz]/4),p[?FFk.yy]-(p[?FFk.rsz]/4),p[?FFk.rsz]/4,false)
                    draw_circle(p[?FFk.xx]+(p[?FFk.rsz]/4),p[?FFk.yy]-(p[?FFk.rsz]/4),p[?FFk.rsz]/4,false)
                    
                    // Draw Mouth
                    draw_set_color(p[?FFk.col_eye].rgb)
                    draw_line_width(p[?FFk.xx]-(p[?FFk.rsz]/2),p[?FFk.yy]+(p[?FFk.rsz]/2),
                        p[?FFk.xx]+(p[?FFk.rsz]/2),p[?FFk.yy]+(p[?FFk.rsz]/2),5)
                    
                }
                
            #endregion
            
            #region Pause Fade
            
                if(FF.main.game.state == FF_game.pause) {
                    
                    draw_set_alpha(.67)
                    draw_set_color(FF.color.black.rgb)
                    draw_rectangle(1,1,FF.runtime_width,FF.runtime_height,false)
                    
                }
            
            #endregion
            
        }
        
        if(FF.debug) trace("End Draw Game")
        
    #endregion
    
#endregion