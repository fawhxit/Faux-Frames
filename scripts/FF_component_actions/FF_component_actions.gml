function button_action() {
	
	// Params
	var cmp = argument0
	
	// Logic
	switch(cmp[?FFk.action]) {
		
	    case FF_action.resume: {
			
	        // Ensure settings are closed; close console and close main menu
	        if(!is_tab_group_active(M.FF.UID.tg_stg)) {
				
	            var mm = M.FF.frame.map_list[|get_frame(M.FF.UID.main_menu)]
	            mm[?FFk.active] = false
	            M.FF.runtime_console[?FFk.active] = false
	            M.FF.main.game.state = M.FF.main.game.state_prv
				
	            for(var i = 0; i < ds_list_size(M.FF.frame.hold_list); i++) {
					
	                var e = M.FF.frame.hold_list[|i]
	                e[?FFk.active] = true
	                M.FF.frame.focus = get_frame(e[?FFk.uid])
					
	            }
				
	            ds_list_clear(M.FF.frame.hold_list)
				
	            M.FF.frame.draw_break = true
				
	        }
			
	        break
			
	    }
		
	    case FF_action.new_game: {
			
	        // Ensure settings are closed; close console and close main menu
	        if(!is_tab_group_active(M.FF.UID.tg_stg)) {
				
	            var mm = M.FF.frame.map_list[|get_frame(M.FF.UID.main_menu)]
	            mm[?FFk.active] = false
	            M.FF.runtime_console[?FFk.active] = false
				
	            // Set Game State to Play
	            M.FF.main.game.state = FF_game.char_create
				
	            #region Init Game
					
	                #region Init Players
						
	                    // Ensure M.FF.player.map_list is Empty
	                    if(!ds_list_empty(M.FF.player.map_list)) {
							
	                        for(var i = 0; i < ds_list_size(M.FF.player.map_list)-1; i++)
	                            ds_map_destroy(M.FF.player.map_list[|i])
							
	                        ds_list_clear(M.FF.player.map_list)
	                        M.FF.player.focus = noone
							
	                    }
						
	                    #region Single Player
							
	                        // Init Player
	                        M.FF.player.map_list[|0] = ds_map_create()
	                        init_char(0)
	                        // Create Player
	                        var gfi = prompt_player_creation(M.FF.margin.RW2,M.FF.margin.RH2,
	                            [fa_middle,fa_center],0)
							
	                    #endregion
						
	                #endregion
					
	                #region Init Entities
						
	                    // Ensure M.FF.entity.map_list is Empty
	                    if(!ds_list_empty(M.FF.entity.map_list)) {
							
	                        for(var i = 0; i < ds_list_size(M.FF.entity.map_list)-1; i++)
	                            ds_map_destroy(M.FF.entity.map_list[|i])
							
	                        ds_list_clear(M.FF.entity.map_list)
	                        M.FF.entity.focus = noone
							
	                    }
						
	                    M.FF.entity.map_list[|0] = ds_map_create()
	                    var e = M.FF.entity.map_list[|0]
						
	                    e[?FFk.xx] = M.FF.margin.RW4
	                    e[?FFk.yy] = M.FF.runtime_height-M.FF.margin.RH4
	                    e[?FFk.rsz] = 50
	                    e[?FFk.type] = FFv.food
						
	                    M.FF.entity.map_list[|1] = ds_map_create()
	                    var e = M.FF.entity.map_list[|1]
						
	                    e[?FFk.xx] = M.FF.margin.RW2
	                    e[?FFk.yy] = M.FF.runtime_height-M.FF.margin.RH4
	                    e[?FFk.rsz] = 50
	                    e[?FFk.type] = FFv.water
						
	                    M.FF.entity.map_list[|2] = ds_map_create()
	                    var e = M.FF.entity.map_list[|2]
						
	                    e[?FFk.xx] = M.FF.runtime_width-M.FF.margin.RW4
	                    e[?FFk.yy] = M.FF.runtime_height-M.FF.margin.RH4
	                    e[?FFk.rsz] = 50
	                    e[?FFk.type] = FFv.lava
						
	                    M.FF.entity.map_list[|3] = ds_map_create()
	                    var e = M.FF.entity.map_list[|3]
						
	                    e[?FFk.xx] = M.FF.runtime_width-M.FF.margin.RW4
	                    e[?FFk.yy] = M.FF.margin.RH4
	                    e[?FFk.rsz] = 100
	                    e[?FFk.type] = FFv.bed
						
	                #endregion
					
	            #endregion
				
	        }
			
	        break
			
	    }
		
	    case FF_action.save: {
			
	        break
			
	    }
		
	    case FF_action.load: {
			
	        break
			
	    }
		
	    case FF_action.settings: {
			
	        if(!is_tab_group_active(M.FF.UID.tg_stg)) {
				
	            // Open Video frame since it is our first tab
	            var gfi = get_frame(M.FF.UID.stg_video)
	            gfi = set_top_frame(gfi)
	            var e = M.FF.frame.map_list[|gfi]
				
	            // Re Centerish Position
	            e[?FFk.w] = M.FF.runtime_width*.75
	            e[?FFk.h] = M.FF.runtime_height*.75
	            e[?FFk.xy][0] = M.FF.runtime_width*.125
	            e[?FFk.xy][1] = M.FF.runtime_height*.125
				
	            // Make active and set focus
	            e[?FFk.active] = true
	            if(e[?FFk.focus]) M.FF.frame.focus = gfi
				
	            M.FF.runtime_frame_delay = 1
				
	        }
			
	        break
			
	    }
		
	    case FF_action.ex: {
			
	        game_end()
			
	        break
			
	    }
		
	    case FF_action.gfx_apply: {
			
	        #region Resolution Update
				
	            M.FF.runtime_width = M.FF.runtime_width_next
	            M.FF.runtime_height = M.FF.runtime_height_next
	            M.FF.margin.RW2 = round(M.FF.runtime_width/2)
	            M.FF.margin.RW4 = round(M.FF.runtime_width/4)
	            M.FF.margin.RW8 = round(M.FF.runtime_width/8)
	            M.FF.margin.RW16 = round(M.FF.runtime_width/16)
	            M.FF.margin.RH2 = round(M.FF.runtime_height/2)
	            M.FF.margin.RH4 = round(M.FF.runtime_height/4)
	            M.FF.margin.RH8 = round(M.FF.runtime_height/8)
	            M.FF.margin.RH16 = round(M.FF.runtime_height/16)
				
	        #endregion
			
	        // AA + VSync Update
	        display_reset(M.FF.runtime_anti_alias,M.FF.runtime_vertical_sync)
			
	        break
			
	    }
		
	    case FF_action.char_done: {
			
	        #region Single Player
				
	            init_log(0)
	            init_inv(0)
	            fini_char(0)
				
	            // Close Creation Window
	            var gfi = get_frame(M.FF.UID.char_basic)
	            var e = M.FF.frame.map_list[|gfi]
	            e[?FFk.active] = false
	            ds_map_destroy(e)
	            ds_list_delete(M.FF.frame.map_list,gfi)
				
	            var gfi = get_frame(M.FF.UID.char_appear)
	            var e = M.FF.frame.map_list[|gfi]
	            e[?FFk.active] = false
	            ds_map_destroy(e)
	            ds_list_delete(M.FF.frame.map_list,gfi)
				
	            var gfi = get_frame(M.FF.UID.char_att)
	            var e = M.FF.frame.map_list[|gfi]
	            e[?FFk.active] = false
	            ds_map_destroy(e)
	            ds_list_delete(M.FF.frame.map_list,gfi)
				
	            var e = M.FF.frame.map_list[|get_frame(M.FF.command.inv.str + " : Player 0")]
	            e[?FFk.cmpnt_cfg][?FFk.varr][1][0][?FFk.ref] = M.FF.player.map_list[|0]
				
	            M.FF.frame.focus = noone
	            M.FF.frame.menu_override = false
	            M.FF.frame.component_focus = noone
				
	            // Finally (To update the global tab_group_active variable which is a map of arrays)
	            update_tabs()
				
	            M.FF.player.focus = noone
				
	            // Set Game State to True (Playing)
	            M.FF.main.game.state = FF_game.play
				
	            init_player_hud_stats(0)
				
	        #endregion
			
	        M.FF.frame.draw_break = true
			
	        break
			
	    }
		
	    case FF_action.char_cancel: {
			
	        var mm = M.FF.frame.map_list[|get_frame(M.FF.UID.main_menu)]
	        mm[?FFk.active] = true
	        M.FF.runtime_console[?FFk.active] = false
			
	        // Set Game State to NN (Main Menu/Not Paused)
	        M.FF.main.game.state = FF_game.none
			
	        #region Init Game
				
	            // Close Creation Window
	            var gfi = get_frame(M.FF.UID.char_basic)
	            var e = M.FF.frame.map_list[|gfi]
	            e[?FFk.active] = false
	            ds_map_destroy(e)
	            ds_list_delete(M.FF.frame.map_list,gfi)
				
	            var gfi = get_frame(M.FF.UID.char_appear)
	            var e = M.FF.frame.map_list[|gfi]
	            e[?FFk.active] = false
	            ds_map_destroy(e)
	            ds_list_delete(M.FF.frame.map_list,gfi)
				
	            var gfi = get_frame(M.FF.UID.char_att)
	            var e = M.FF.frame.map_list[|gfi]
	            e[?FFk.active] = false
	            ds_map_destroy(e)
	            ds_list_delete(M.FF.frame.map_list,gfi)
				
	            M.FF.frame.focus = noone
	            M.FF.frame.menu_override = false
	            M.FF.frame.component_focus = noone
				
	            // Finally (To update the global tab_group_active variable which is a map of arrays)
	            update_tabs()
				
	            M.FF.player.focus = noone
				
	            // Ensure M.FF.player.map_list is Empty
	            if(!ds_list_empty(M.FF.player.map_list)) {
					
	                for(var i = 0; i < ds_list_size(M.FF.player.map_list); i++)
	                    ds_map_destroy(M.FF.player.map_list[|i])
					
	                ds_list_clear(M.FF.player.map_list)
	                M.FF.player.focus = noone
					
	            }
				
	            // Ensure M.FF.entity.map_list is Empty
	            if(!ds_list_empty(M.FF.entity.map_list)) {
					
	                for(var i = 0; i < ds_list_size(M.FF.entity.map_list)-1; i++)
	                    ds_map_destroy(M.FF.entity.map_list[|i])
					
	                ds_list_clear(M.FF.entity.map_list)
	                M.FF.entity.focus = noone
					
	            }
				
	        #endregion
			
	        M.FF.frame.draw_break = true
			
	        break
			
	    }
		
	    case FF_action.journal_add: {
			
	        // If parent set..
	        if(!is_undefined(cmp[?FFk.parent]) or cmp[?FFk.parent] != noone) {
				
	            var l = cmp[?FFk.parent][?FFk.cmp_list]
	            var btn = entry_button_create([],cmp[?FFk.bgc],cmp[?FFk.bga],cmp[?FFk.fgc],cmp[?FFk.fga],"Entry "+string(cmp[?FFk.i]),FF_action.journal_entry,true)
	            btn[?FFk.w_pct] = 1
	            btn[?FFk.h_pct] = .1
	            btn[?FFk.hvalign] = [fa_left,fa_center]
	            btn[?FFk.parent] = cmp[?FFk.parent]
	            btn[?FFk.ref] = ds_map_create()
	            var ref = btn[?FFk.ref]
	            ref[?FFk.uid] = "Entry "+string(cmp[?FFk.i])
	            ref[?FFk.map_xy] = noone
	            ref[?FFk.color] = cloth_color_arr()[0]
	            ref[?FFk.str_arr] = noone
	            ds_list_add(l,btn)
				
	        }
			
	        break
			
	    }
		
	    default: break
		
	}
	
	cmp[?FFk.i] += 1
	
	return noone
	
}

function bind_button_action() {
	
	var cmp = argument0
	
	M.FF.frame.menu_override = true
	M.FF.frame.component_focus = cmp
	
	return noone
	
}

function color_picker_action() {
	
	// Args
	var cmp = argument0
	var opt = cmp[?FFk.opt_cfg]
	
	// Logic
	switch(cmp[?FFk.action]) {
		
	    case FF_action.col_hair: {
			
	        if(M.FF.player.focus != noone) {
				
	            var p = M.FF.player.map_list[|M.FF.player.focus]
	            p[?FFk.col_hair] = opt[?FFk.arr][opt[?FFk.val]]
				
	        }
			
	        break
			
	    }
		
	    case FF_action.col_eye: {
			
	        if(M.FF.player.focus != noone) {
				
	            var p = M.FF.player.map_list[|M.FF.player.focus]
	            p[?FFk.col_eye] = opt[?FFk.arr][opt[?FFk.val]]
				
	        }
			
			
	        break
			
	    }
		
	    case FF_action.col_skin: {
			
	        if(M.FF.player.focus != noone) {
				
	            var p = M.FF.player.map_list[|M.FF.player.focus]
	            p[?FFk.col_skin] = opt[?FFk.arr][opt[?FFk.val]]
				
	        }
			
			
	        break
			
	    }
		
	    case FF_action.col_und: {
			
	        if(M.FF.player.focus != noone) {
				
	            var p = M.FF.player.map_list[|M.FF.player.focus]
	            p[?FFk.col_und] = opt[?FFk.arr][opt[?FFk.val]]
				
	        }
			
	        break
			
	    }
		
	    default: break
		
	}
	
	// Return
	return noone
	
}

function cmp_list_action() {
	
	var action = argument0
	switch(action) {
		
	    default: break
		
	}
	
	return noone
	
}

function container_action() { // ISSUE HERE
	
	// Params
	var cmp = argument0
	
	// Action Logic
	/*
	switch(cmp[?FFk.action]) {
		
	    #region Journal Container
			
	        case FF_action.journal_entry: {
                
	            #region Component Gets
					
	                var varr = cmp[?FFk.cmpnt_cfg][?FFk.varr]
	                var title_inpf = varr[0][0]
	                var pin_btn = varr[1][0]        // TODO : Need Map
	                var color_pick = varr[1][1]     
	                var note_multf = varr[3][0]     // TODO : Need Multiline
					
	            #endregion
				
	            if(cmp[?FFk.ref] != noone) {
					
	                title_inpf[?FFk.active] = true
	                pin_btn[?FFk.active] = true
	                color_pick[?FFk.active] = true
	                note_multf[?FFk.active] = true
					
	                if(cmp[?FFk.load]) {
						
	                    title_inpf[?FFk.inp_cfg][?FFk.str] = cmp[?FFk.ref][?FFk.uid]
	                    // TODO Pin
	                    goto_color(color_pick,cmp[?FFk.ref][?FFk.color])
	                    // TODO Notes
	                    cmp[?FFk.load] = false
						
	                } else {
						
	                    cmp[?FFk.ref][?FFk.uid] = title_inpf[?FFk.inp_cfg][?FFk.str]
	                    // TODO Pin
	                    cmp[?FFk.ref][?FFk.color] = cloth_color_arr()[color_pick[?FFk.opt_cfg][?FFk.val]]
	                    // TODO Notes
						
	                }
					
	            } else {
					
	                title_inpf[?FFk.inp_cfg][?FFk.str] = ""
	                // TODO Pin
	                goto_color(color_pick,cloth_color_arr()[0])
	                // TODO Notes
	                cmp[?FFk.load] = false
					
	                title_inpf[?FFk.active] = false
	                pin_btn[?FFk.active] = false
	                color_pick[?FFk.active] = false
	                note_multf[?FFk.active] = false
					
	            }
				
	            break
				
	        }
			
	    #endregion
		
	    default: break
		
	}
	*/
	
	// Return
	return noone
	
}

function dropwdown_action() {
	
	#region Params&CFG
		
	    var cmp = argument0
	    var opt = cmp[?FFk.opt_cfg]
	    var menu = cmp[?FFk.menu_cfg]
	    var cell = cmp[?FFk.cell_cfg]
		
	#endregion
	
	// Logic
	switch(cmp[?FFk.action]) {
		
	    case FF_action.rwh: {
			
	        M.FF.runtime_width_next = opt[?FFk.arr][opt[?FFk.val]].w
	        M.FF.runtime_height_next = opt[?FFk.arr][opt[?FFk.val]].h
			
	        break
			
	    }
		
	    case FF_action.aa: {
			
	        M.FF.runtime_anti_alias = opt[?FFk.arr][opt[?FFk.val]].val
	        break
			
	    }
		
	    default: break
		
	}
	
	// Return
	return noone
	
}

function entry_button_action() {
	
	var cmp = argument0
	
	switch(cmp[?FFk.action]) {
		
	    case FF_action.journal_entry: {
			
	        // If ref set..
	        if(!is_undefined(cmp[?FFk.ref]) or cmp[?FFk.ref] != noone) {
				
	            var ref = cmp[?FFk.ref]
	            var varr = cmp[?FFk.parent][?FFk.parent][?FFk.cmpnt_cfg][?FFk.varr]
	            var contain = varr[1][2]
				
	            if(ref != contain[?FFk.ref]) {
					
	                contain[?FFk.ref] = ref
	                contain[?FFk.load] = true
					
	            } else contain[?FFk.ref] = noone
				
	        }
			
	        break
			
	    }
		
	    default: break
		
	}
	
	return noone
	
}

function horiz_space_action() {
	
	var action = argument0
	
	switch(action) {
		
	    default: break
		
	}
	
	return noone
	
}

function input_field_action() {
	
	#region Params
		
	    var cmp = argument0
	    var npt = cmp[?FFk.inp_cfg]
	    var crt = npt[?FFk.carot_cfg]
		
	#endregion
	
	switch(cmp[?FFk.action]) {
		
	    case FF_action.set_rw: {
			
	        // Set Width Next
	        if(npt[?FFk.str] != "" and npt[?FFk.str] != noone) {
				
	            npt[?FFk.str] = string(clamp(int64(npt[?FFk.str]),800,3840))
	            M.FF.runtime_width_next = int64(npt[?FFk.str])
				
	        }
			
	        break
			
	    }
		
	    case FF_action.set_rh: {
			
	        // Set Height Next
	        if(npt[?FFk.str] != "" and npt[?FFk.str] != noone) {
				
	            npt[?FFk.str] = string(clamp(int64(npt[?FFk.str]),600,2160))
	            M.FF.runtime_height_next = int64(npt[?FFk.str])
				
	        }
			
	        break
			
	    }
		
	    case FF_action.char_fname: {
			
	        if(M.FF.player.focus != noone) {
				
	            var p = M.FF.player.map_list[|M.FF.player.focus]
	            p[?FFk.fname] = npt[?FFk.str]
				
	        }
			
	        break
			
	    }
		
	    case FF_action.char_lname: {
			
	        if(M.FF.player.focus != noone) {
				
	            var p = M.FF.player.map_list[|M.FF.player.focus]
	            p[?FFk.lname] = npt[?FFk.str]
				
	        }
			
	        break
			
	    }
		
	    case FF_action.journal_uid: {
			
	        if(!is_undefined(cmp[?FFk.ref]) and cmp[?FFk.ref] != noone) {
				
	            cmp[?FFk.ref][?FFk.uid] = npt[?FFk.str]
				
	        }
			
	        break
			
	    }
		
	    default: break
		
	}
	
	return noone
	
}

function iterator_action() {
	
	// Args
	var cmp = argument0
	var dlt = argument1
	var opt = cmp[?FFk.opt_cfg]
	
	// Logic
	switch(cmp[?FFk.action]) {
		
	    case FF_action.iter_fat:
	    case FF_action.iter_cha:
	    case FF_action.iter_int:
	    case FF_action.iter_dex:
	    case FF_action.iter_str:
	    case FF_action.iter_end: {
			
	        if(M.FF.player.focus != noone) {
				
	            // Init
	            var p = M.FF.player.map_list[|M.FF.player.focus]
	            var stat = p[?FFk.att_cfg]
				
	            if(dlt == 1) { // Up Iter
					
	                if(stat[?FFk.used] == stat[?FFk.total]) // Cancel
	                    return noone
	                else {
						
	                    stat[?FFk.used] += 1
	                    stat[?FFk.free] -= 1
	                    opt[?FFk.val] += 1
						
	                }
					
	            } else { // Down Iter
					
	                if(stat[?FFk.free] == stat[?FFk.total]) // Cancel
	                    return noone
	                else {
						
	                    stat[?FFk.used] -= 1
	                    stat[?FFk.free] += 1
	                    opt[?FFk.val] -= 1
						
	                }
					
	            }
				
	        }
			
	        break
			
	    }
		
	    default: break
		
	}
	
	// Return
	return noone
	
}

function label_action() {
	
	var action = argument0
	
	switch(action) {
		
	    default: break
		
	}
	
	return noone
	
}

function multi_field_action() {
	
	var cmp = argument0
	
	switch(cmp[?FFk.action]) {
		
	    default: break
		
	}
	
	return noone
	
}

function picker_action() {
	
	// Args
	var action = argument0
	
	// Logic
	switch(action) {
		
	    default: break
		
	}
	
	// Return
	return noone
	
}

function preview_action() {
	
	var action = argument0
	switch(action) {
		
	    default: break
		
	}
	
	return noone
	
}

function slider_action() {
	
	// Args
	var cmp = argument0
	
	// Logic
	switch(cmp[?FFk.action]) {
		
	    #region Main Data Sliders
			
	        case FF_action.vol_master: {
				
	            // Ensure Slider Paramaters Match Requested
	            cmp[?FFk.str] = M.FF.main.vol_master.str
	            cmp[?FFk.val_mn] = M.FF.main.vol_master.val_mn
	            cmp[?FFk.val_mx] = M.FF.main.vol_master.val_mx
	            cmp[?FFk.sym] = M.FF.main.vol_master.sym
				
	            // Ensure Clamp
	            cmp[?FFk.val] = clamp(cmp[?FFk.val],M.FF.main.vol_master.val_mn,M.FF.main.vol_master.val_mx)
				
	            // Apply
	            M.FF.main.vol_master.val = cmp[?FFk.val]
				
	            break
				
	        }
			
	        case FF_action.vol_sfx: {
				
	            // Ensure Slider Paramaters Match Requested
	            cmp[?FFk.str] = M.FF.main.vol_sfx.str
	            cmp[?FFk.val_mn] = M.FF.main.vol_sfx.val_mn
	            cmp[?FFk.val_mx] = M.FF.main.vol_sfx.val_mx
	            cmp[?FFk.sym] = M.FF.main.vol_sfx.sym
				
	            // Ensure Clamp
	            cmp[?FFk.val] = clamp(cmp[?FFk.val],M.FF.main.vol_sfx.val_mn,M.FF.main.vol_sfx.val_mx)
				
	            // Apply
	            M.FF.main.vol_sfx.val = cmp[?FFk.val]
				
	            break
				
	        }
			
	        case FF_action.vol_music: {
				
	            // Ensure Slider Paramaters Match Requested
	            cmp[?FFk.str] = M.FF.main.vol_music.str
	            cmp[?FFk.val_mn] = M.FF.main.vol_music.val_mn
	            cmp[?FFk.val_mx] = M.FF.main.vol_music.val_mx
	            cmp[?FFk.sym] = M.FF.main.vol_music.sym
				
	            // Ensure Clamp
	            cmp[?FFk.val] = clamp(cmp[?FFk.val],M.FF.main.vol_music.val_mn,M.FF.main.vol_music.val_mx)
				
	            // Apply
	            M.FF.main.vol_music.val = cmp[?FFk.val]
				
	            break
				
	        }
			
	        case FF_action.vol_voice: {
				
	            // Ensure Slider Paramaters Match Requested
	            cmp[?FFk.str] = M.FF.main.vol_voice.str
	            cmp[?FFk.val_mn] = M.FF.main.vol_voice.val_mn
	            cmp[?FFk.val_mx] = M.FF.main.vol_voice.val_mx
	            cmp[?FFk.sym] = M.FF.main.vol_voice.sym
				
	            // Ensure Clamp
	            cmp[?FFk.val] = clamp(cmp[?FFk.val],M.FF.main.vol_voice.val_mn,M.FF.main.vol_voice.val_mx)
				
	            // Apply
	            M.FF.main.vol_voice.val = cmp[?FFk.val]
				
	            break
				
	        }
			
	        case FF_action.difficulty_scale: {
				
	            // Ensure Slider Paramaters Match Requested
	            cmp[?FFk.str] = M.FF.main.difficulty_scale.str
	            cmp[?FFk.val_mn] = M.FF.main.difficulty_scale.val_mn
	            cmp[?FFk.val_mx] = M.FF.main.difficulty_scale.val_mx
	            cmp[?FFk.sym] = M.FF.main.difficulty_scale.sym
				
	            // Ensure Clamp
	            cmp[?FFk.val] = clamp(cmp[?FFk.val],M.FF.main.difficulty_scale.val_mn,M.FF.main.difficulty_scale.val_mx)
				
	            // Apply
	            M.FF.main.difficulty_scale.val = cmp[?FFk.val]
				
	            break
				
	        }
			
	    #endregion
		
	    default: break
		
	}
	
	// Return
	return noone
	
}

function slot_grid_action() {
	
	var action = argument0
	switch(action) {
		
	    default: break
		
	}
	
	return noone
	
}

function toggle_action() {
	
	// Arg
	var cmp = argument0
	
	// Init
	var action = cmp[?FFk.action]
	
	// Do Logic
	if(action != noone) {
		
	    switch(action[0][0]) {
			
	        #region Complex
				
	            #region Toggle Input Fields
					
	                case FF_action.tog_inpf: {
						
	                    for(var i = 1; i < array_length_1d(action); i++) {
							
	                        if(action[0][i] == FF_action.none) action[i][?FFk.active] = cmp[?FFk.state]         // Toggle Non-Inverse
	                        else if(action[0][i] == FF_action.inv) action[i][?FFk.active] = !cmp[?FFk.state]  // Toggle Inverse
	                        else if(action[0][i] == FF_action.win) {                                      // Toggle Display Mode Picker
								
	                            if(action[i][?FFk.cmpnt_type] == FF_component.pckr) {
									
	                                action[i][?FFk.opt_cfg][?FFk.val] = 0                                       // Set to windowed mode
	                                action[i][?FFk.active] = !cmp[?FFk.state]                           // Inverse Active of State
									
	                            } else action[i][?FFk.active] = !cmp[?FFk.state]
								
	                        }
							
						}
						
	                    break
						
	                }
					
	            #endregion
				
	            #region Toggle Toggles
					
	                case FF_action.tog_tog: {
						
	                    for(var i = 1; i < array_length_1d(action); i++) {
							
	                        if(action[0][i] == FF_action.none) action[i][?FFk.state] = true                      // Toggle Non-Inverse
	                        else if(action[0][i] == FF_action.inv) action[i][?FFk.state] = false                // Toggle Inverse
	                        else if(action[0][i] == FF_action.char_male and M.FF.player.focus != noone) {                 // Gender Toggle Male
								
	                            cmp[?FFk.state] = true
	                            M.FF.player.map_list[|M.FF.player.focus][?FFk.gender] = FFv.male
								
	                        } else if(action[0][i] == FF_action.char_female and M.FF.player.focus != noone) {             // Gender Toggle Female
								
	                            cmp[?FFk.state] = true
	                            M.FF.player.map_list[|M.FF.player.focus][?FFk.gender] = FFv.female
								
	                        }
							
	                    }
						
	                    break
						
	                }
					
	            #endregion
				
	        #endregion
			
	        #region Non-Complex
				
	            case FF_action.none: {
					
	                switch(action[1]) {
						
	                    case FF_action.vsync: {
							
	                        M.FF.runtime_vertical_sync = cmp[?FFk.state]
	                        break
							
	                    }
						
	                    case FF_action.tog_crouch: {
							
	                        M.FF.command.crouch.toggle = cmp[?FFk.state]
	                        break
							
	                    }
						
	                    case FF_action.tog_sprint: {
							
	                        M.FF.command.sprint.toggle = cmp[?FFk.state]
	                        break
							
	                    }
						
	                    case FF_action.char_gender: {
							
	                        if(M.FF.player.focus != noone) {
								
	                            var p = M.FF.player.map_list[|M.FF.player.focus]
	                            p[?FFk.gender] = npt[?FFk.str]
								
	                        }
							
	                        break
							
	                    }
						
	                }
					
	                break
					
	            }
				
	        #endregion
			
	        default: break
			
	    }
		
	}
	
	return noone
	
}

function vert_bar_action() {
	
	// Params
	var action = argument0
	
	// Logic
	switch(action) {
		
	    default: break
		
	}
	
	return noone
	
}

function vert_space_action() {
	
	// Params
	var action = argument0
	
	// Logic
	switch(action) {
    
	    default: break
    
	}
	
	return noone
	
}