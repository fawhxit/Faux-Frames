/// @description

if(FF.debug) trace("Step")
#region Step
    
    #region Game Logic
        
        if(FF.main.game.state == FF_game.play) {
            
            #region In-Game Menu Override Update
                
                var inv_i = get_frame(FF.command.inv.str + " : Player 0")
                var log_i = get_frame(FF.command.log.str + " : Player 0")
                FF.frame.ingame_override = false
                
                if((inv_i != noone and FF.frame.map_list[|inv_i][?FFk.active])
                    or (log_i != noone and FF.frame.map_list[|log_i][?FFk.active]))
                    FF.frame.ingame_override = true
                
            #endregion
            
            #region Dynamic Entities
                
                // Init
                var ent_cnt = ds_list_size(FF.entity.dynamic.map_list)
                
                #region Spawn
                    
                    if(ent_cnt < FF.entity.limit and FF.runtime_frame == 0) {
                        
                        // xx,yy,uid,scl
                        var arr = spawn_entity()
                            
                        if(arr != noone) {
                            
                            ds_list_add(FF.entity.dynamic.map_list,ds_map_create())
                            var ent = FF.entity.dynamic.map_list[|ds_list_size(FF.entity.dynamic.map_list)-1]
                            ent[?FFk.xx] = arr[0]
                            ent[?FFk.yy] = arr[1]
                            ent[?FFk.scl] = arr[3]
                            
                            if(arr[2] == FF.entity.apple.uid)
                                ent[?FFk.ref] = FF.entity.apple
                            else if(arr[2] == FF.entity.berry.uid)
                                ent[?FFk.ref] = FF.entity.berry
                            else if(arr[2] == FF.entity.branch.uid)
                                ent[?FFk.ref] = FF.entity.branch
                            else if(arr[2] == FF.entity.rock.uid)
                                ent[?FFk.ref] = FF.entity.rock
                            else if(arr[2] == FF.entity.sword.uid)
                                ent[?FFk.ref] = FF.entity.sword
                            else if(arr[2] == FF.entity.chestplate.uid)
                                ent[?FFk.ref] = FF.entity.chestplate
                                
                        }
                        
                    }
                    
                #endregion
                
            #endregion
            
            #region Player
                
                // Init Player Var (Single Player)
                var p = FF.player.map_list[|0]
                var stat_cfg = p[?FFk.stat_cfg]
                var att_cfg = p[?FFk.att_cfg]
                
                #region Controls
                    
                    #region Movement (+Stamina Updates)
                        
                        #region Toggles
                            
                            if(!FF.frame.ingame_override) {
                                
                                // Sprint Toggle Control
                                if(FF.command.sprint.toggle and keyboard_check_pressed(FF.command.sprint.ky))
                                    FF.command.sprint.toggle_on = !FF.command.sprint.toggle_on
                                else if(!FF.command.sprint.toggle) FF.command.sprint.toggle_on = false
                                
                                // Crouch Toggle Control
                                if(FF.command.crouch.toggle and keyboard_check_pressed(FF.command.crouch.ky))
                                    FF.command.crouch.toggle_on = !FF.command.crouch.toggle_on
                                else if(!FF.command.crouch.toggle) FF.command.crouch.toggle_on = false
                                
                            }
                            
                        #endregion
                        
                        #region Logic + Stamina 
                            
                            // STATUS: BALANCED
                            // Get Stamina Mod
                            var sta_mod = get_stat_mods(p,stat_cfg[?FFk.sta_cfg])
                            
                            // Add Stamina Mod to Base Stamina Delta
                            // If Stamina Mod is Negative, clamp to base delta minimum
                            var base_dlt = FF.stat.base.delta.stamina+sta_mod
                            if(sta_mod < 0) base_dlt = clamp(base_dlt+sta_mod,FF.stat.base.delta.minimum,FF.stat.base.delta.stamina)
                                        
                            // Calc Mod 2 and apply for actual delta
                            var sta_mod2 = round2((((base_dlt*stat_cfg[?FFk.thi_cfg][?FFk.pct]))*(1+stat_cfg[?FFk.need_pct])),2)
                            var sta_dlt = round2(base_dlt-sta_mod2,2)
                            
                            // Speed Init
                            var spd = 0
                            
                            if((keyboard_check(FF.command.up.ky) or keyboard_check(FF.command.down.ky)
                                or keyboard_check(FF.command.left.ky) or keyboard_check(FF.command.right.ky))
                                and !FF.frame.ingame_override) {
                                
                                spd = round2(stat_cfg[?FFk.spe_cfg][?FFk.val]-(round2(stat_cfg[?FFk.spe_cfg][?FFk.val]/2,1)*stat_cfg[?FFk.need_pct]),1)
                                if(FF.command.crouch.toggle_on or (!FF.command.crouch.toggle and keyboard_check(FF.command.crouch.ky))) {
                                    
                                    if(stat_cfg[?FFk.sta_cfg][?FFk.val] > stat_cfg[?FFk.sta_cfg][?FFk.val_mn])
                                        sta_dlt = sta_dlt*FF.stat.base.factor.crouch_stamina
                                    
                                    spd = spd*FF.stat.base.factor.crouch_speed
                                    
                                }
                                if(FF.command.sprint.toggle_on or (!FF.command.sprint.toggle and keyboard_check(FF.command.sprint.ky))) {
                                    
                                    if(stat_cfg[?FFk.sta_cfg][?FFk.val] > stat_cfg[?FFk.sta_cfg][?FFk.val_mn]) {
                                        
                                        sta_dlt += FF.stat.base.factor.sprint_stamina
                                        spd = spd*FF.stat.base.factor.sprint_speed
                                        
                                    } else if(FF.command.sprint.toggle_on)
                                        FF.command.sprint.toggle_on = false
                                    
                                }
                                
                                if(keyboard_check(FF.command.up.ky)) p[?FFk.yy] -= spd
                                if(keyboard_check(FF.command.down.ky)) p[?FFk.yy] += spd
                                if(keyboard_check(FF.command.left.ky)) p[?FFk.xx] -= spd
                                if(keyboard_check(FF.command.right.ky)) p[?FFk.xx] += spd
                                
                            }
                            
                            var sta_o = stat_cfg[?FFk.sta_cfg][?FFk.val]
                            stat_cfg[?FFk.sta_cfg][?FFk.val] = clamp(stat_cfg[?FFk.sta_cfg][?FFk.val]+sta_dlt,
                                                        stat_cfg[?FFk.sta_cfg][?FFk.val_mn],stat_cfg[?FFk.sta_cfg][?FFk.val_mx])
                            
                            #region Stamina-Thirst Regen Drain
                                
                                var thi_dlt2 = stat_cfg[?FFk.sta_cfg][?FFk.val] - sta_o
                                if(thi_dlt2 > 0) {
                                    thi_dlt2 = round2(thi_dlt2*.025,2)
                                    stat_cfg[?FFk.thi_cfg][?FFk.val] = clamp(stat_cfg[?FFk.thi_cfg][?FFk.val]+thi_dlt2,
                                                                    stat_cfg[?FFk.thi_cfg][?FFk.val_mn],stat_cfg[?FFk.thi_cfg][?FFk.val_mx])
                                }
                                
                            #endregion
                            
                        #endregion
                        
                    #endregion
                    
                    #region Hotkeys
                        
                        // Toggle Inventory
                        if(keyboard_check_pressed(FF.command.inv.ky)
                            and ((FF.frame.ingame_override and FF.frame.map_list[|inv_i][?FFk.active]) or !FF.frame.ingame_override)
                            and FF.frame.component_focus == noone and !FF.frame.menu_override) {
                            
                            var gfi = get_frame(FF.command.inv.str + FF.command.menu_infix + "0")
                            gfi = set_top_frame(gfi)
                            var frame = FF.frame.map_list[|gfi]
                            frame[?FFk.active] = !frame[?FFk.active]
                            FF.frame.focus = gfi
                            
                        // Toggle Journal
                        } else if(keyboard_check_pressed(FF.command.log.ky)
                            and ((FF.frame.ingame_override and FF.frame.map_list[|log_i][?FFk.active]) or !FF.frame.ingame_override)
                            and FF.frame.component_focus == noone and !FF.frame.menu_override) {
                            
                            var gfi = get_frame(FF.command.log.str + FF.command.menu_infix + "0")
                            gfi = set_top_frame(gfi)
                            var frame = FF.frame.map_list[|gfi]
                            frame[?FFk.active] = !frame[?FFk.active]
                            FF.frame.focus = gfi
                            
                        }
                        
                    #endregion
                    
                #endregion
                
                #region Passive Stat Changes
                    
                    #region Needs
                        
                        if(FF.runtime_second%2 == 0 and FF.runtime_frame == 0) {
                            
                            // Hunger
                            var hun_mod = get_stat_mods(p,stat_cfg[?FFk.hun_cfg])
                            var hun_dlt = round2(FF.stat.base.delta.hunger/(FF.stat.base.factor.need_divisor+hun_mod),2)
                            stat_cfg[?FFk.hun_cfg][?FFk.val] = clamp(stat_cfg[?FFk.hun_cfg][?FFk.val]+hun_dlt,
                                                            stat_cfg[?FFk.hun_cfg][?FFk.val_mn],stat_cfg[?FFk.hun_cfg][?FFk.val_mx])
                            stat_cfg[?FFk.hun_cfg][?FFk.pct] = pct(stat_cfg[?FFk.hun_cfg][?FFk.val],stat_cfg[?FFk.hun_cfg][?FFk.val_mn],
                                                            stat_cfg[?FFk.hun_cfg][?FFk.val_mx])
                            
                            // Thirst
                            var thi_mod = get_stat_mods(p,stat_cfg[?FFk.thi_cfg])
                            var thi_dlt = round2(FF.stat.base.delta.thirst/(FF.stat.base.factor.need_divisor+thi_mod),2)
                            stat_cfg[?FFk.thi_cfg][?FFk.val] = clamp(stat_cfg[?FFk.thi_cfg][?FFk.val]+thi_dlt,
                                                            stat_cfg[?FFk.thi_cfg][?FFk.val_mn],stat_cfg[?FFk.thi_cfg][?FFk.val_mx])
                            stat_cfg[?FFk.thi_cfg][?FFk.pct] = pct(stat_cfg[?FFk.thi_cfg][?FFk.val],stat_cfg[?FFk.thi_cfg][?FFk.val_mn],
                                                            stat_cfg[?FFk.thi_cfg][?FFk.val_mx])
                            
                            // Sleep
                            var sle_mod = get_stat_mods(p,stat_cfg[?FFk.sle_cfg])
                            var sle_dlt = round2(FF.stat.base.delta.sleep/(FF.stat.base.factor.need_divisor+sle_mod),2)
                            stat_cfg[?FFk.sle_cfg][?FFk.val] = clamp(stat_cfg[?FFk.sle_cfg][?FFk.val]+sle_dlt,
                                                            stat_cfg[?FFk.sle_cfg][?FFk.val_mn],stat_cfg[?FFk.sle_cfg][?FFk.val_mx])
                            stat_cfg[?FFk.sle_cfg][?FFk.pct] = pct(stat_cfg[?FFk.sle_cfg][?FFk.val],stat_cfg[?FFk.sle_cfg][?FFk.val_mn],
                                                            stat_cfg[?FFk.sle_cfg][?FFk.val_mx])
                            
                            stat_cfg[?FFk.need_pct] = round2(((stat_cfg[?FFk.hun_cfg][?FFk.pct] + stat_cfg[?FFk.thi_cfg][?FFk.pct]
                                            + stat_cfg[?FFk.sle_cfg][?FFk.pct])/3)*100,2)/100
                            
                        }
                        
                    #endregion
                    
                    #region Passive Health And Mana Change
                        
                        // STATUS: BALANCED
                        if(FF.runtime_frame == 0) {
                            
                            #region Health Change
                                
                                // Get Health Mod
                                var hea_mod = get_stat_mods(p,stat_cfg[?FFk.hea_cfg])
                                
                                // Add Health Mod to Base Health Delta
                                // If Health Mod is Negative, clamp to base delta minimum
                                var base_dlt = FF.stat.base.delta.vHealth+hea_mod
                                if(hea_mod < 0) base_dlt = clamp(base_dlt+hea_mod,FF.stat.base.delta.minimum,FF.stat.base.delta.vHealth)
                                
                                // Calc Mod 2 and apply for actual delta
                                var hea_mod2 = round2((((base_dlt*stat_cfg[?FFk.hun_cfg][?FFk.pct])*1.34)*(1+stat_cfg[?FFk.need_pct])),2)
                                var hea_dlt = round2(base_dlt-hea_mod2,2)
                                
                                // Get Old Value for Need Drain then Apply Change
                                var hea_o = stat_cfg[?FFk.hea_cfg][?FFk.val]
                                stat_cfg[?FFk.hea_cfg][?FFk.val] = clamp(stat_cfg[?FFk.hea_cfg][?FFk.val]+hea_dlt,
                                                                stat_cfg[?FFk.hea_cfg][?FFk.val_mn],stat_cfg[?FFk.hea_cfg][?FFk.val_mx])
                                
                                #region Hunger Regen Drain
                                    
                                    // Drain need when regen-ing; Based on percentage of change
                                    var hun_dlt2 = stat_cfg[?FFk.hea_cfg][?FFk.val] - hea_o
                                    if(hun_dlt2 > 0) {
                                        hun_dlt2 = round2(hun_dlt2*.2,2)
                                        stat_cfg[?FFk.hun_cfg][?FFk.val] = clamp(stat_cfg[?FFk.hun_cfg][?FFk.val]+hun_dlt2,
                                                                        stat_cfg[?FFk.hun_cfg][?FFk.val_mn],stat_cfg[?FFk.hun_cfg][?FFk.val_mx])
                                    }
                                    
                                #endregion
                                
                            #endregion
                            
                            #region Mana Change
                                
                                // Get Mana Mod
                                var man_mod = get_stat_mods(p,stat_cfg[?FFk.man_cfg])
                                
                                // Add Mana Mod to Base Mana Delta
                                // If Mana Mod is Negative, clamp to base delta minimum
                                base_dlt = FF.stat.base.delta.mana+man_mod
                                if(man_mod < 0) base_dlt = clamp(base_dlt+man_mod,FF.stat.base.delta.minimum,FF.stat.base.delta.mana)
                                
                                // Calc Mod 2 and apply for actual delta
                                var man_mod2 = round2((((base_dlt*stat_cfg[?FFk.sle_cfg][?FFk.pct])*1.67)*(1+stat_cfg[?FFk.need_pct])),2)
                                var man_dlt = round2(base_dlt-man_mod2,2)
                                
                                // Get Old Value for Need Drain then Apply Change
                                var man_o = stat_cfg[?FFk.man_cfg][?FFk.val]
                                stat_cfg[?FFk.man_cfg][?FFk.val] = clamp(stat_cfg[?FFk.man_cfg][?FFk.val]+man_dlt,
                                                                stat_cfg[?FFk.man_cfg][?FFk.val_mn],stat_cfg[?FFk.man_cfg][?FFk.val_mx])
                                
                                #region Sleep Regen Drain
                                    
                                    // Drain need when regen-ing; Based on percentage of change
                                    var sle_dlt2 = stat_cfg[?FFk.man_cfg][?FFk.val] - man_o
                                    if(sle_dlt2 > 0) {
                                        sle_dlt2 = round2(sle_dlt2*.25,2)
                                        stat_cfg[?FFk.sle_cfg][?FFk.val] = clamp(stat_cfg[?FFk.sle_cfg][?FFk.val]+sle_dlt2,
                                                                        stat_cfg[?FFk.sle_cfg][?FFk.val_mn],stat_cfg[?FFk.sle_cfg][?FFk.val_mx])
                                    }
                                    
                                #endregion
                                
                            #endregion
                            
                        }
                        
                    #endregion
                    
                #endregion
                
            #endregion
            
        }
        
    #endregion
    
#endregion