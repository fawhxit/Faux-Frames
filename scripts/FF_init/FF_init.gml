/*
 *
 *  Licensing:
 *
 *      M.FF. - Faux Frames v0.90; Third-party modular GUI system for GMS2
 *      Copyright (C) 2022 Fawhxldawg
 *      
 *      This program is free software: you can redistribute it and/or modify
 *      it under the terms of the GNU Affero General Public License as published
 *      by the Free Software Foundation, either version 3 of the License, or
 *      (at your option) any later version.
 *      
 *      This program is distributed in the hope that it will be useful,
 *      but WITHOUT ANY WARRANTY; without even the implied warranty of
 *      MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *      GNU Affero General Public License for more details.
 *      
 *      You should have received a copy of the GNU Affero General Public License
 *      along with this program.  If not, see <https://www.gnu.org/licenses/>.
 *
 */

function FF_init_frames() {
    
	#region Menus Init
        
        #region Main Menu
            
            // Make Frame; Static
            var gfi = gui_frame_create(M.FF.runtime_width*.34,M.FF.runtime_height*.5,M.FF.UID.main_menu)
            
            // Shorten Accessors
            var frame = M.FF.frame.map_list[|gfi]
            var cmp_cfg = frame[?FFk.cmpnt_cfg]
            
            // Config Frame
            frame[?FFk.bg] = true
            frame[?FFk.fg] = true
            frame[?FFk.mode] = FF_content.cmpnt
            frame[?FFk.autodrag] = true
            frame[?FFk.autosize] = true
            frame[?FFk.hvalign][0] = fa_left
            frame[?FFk.hvalign][1] = fa_bottom
            
            #region Config Components
                
                // Init
                cmp_cfg[?FFk.marginx] = M.FF.margin.BG
                cmp_cfg[?FFk.marginy] = M.FF.margin.BG
                cmp_cfg[?FFk.varr] = [[],[],[],[],[],[],[]] // Have no clue why I have to do this here now, GMEdit issue.
                
                #region Init H PCTs
                    
                    // Init
                    // Margin Height & PCT
                    var mar_h = (array_height_2d(cmp_cfg[?FFk.varr])+1)*cmp_cfg[?FFk.marginy] // Total Height of Margins
                    var mar_h_pct = mar_h/frame[?FFk.h]                                   // Percent of Height Margins Use
                    
                    // Init Remaining Height PCT
                    var varr_h = array_height_2d(cmp_cfg[?FFk.varr])     // No. of Rows
                    var rem_h_pct = 1-mar_h_pct                     // Remaining H PCT
                    
                    // Component Height PCTs
                    // Comp Counts
                    var spcr_cnt = 2                                        // No. of Spacer Components
                    var btn_cnt = 5                                         // No. of Button Components
                    var spcr_h_pct = rem_h_pct*0.05                         // Ea. Spacer Gets 5% Remaining H
                    rem_h_pct -= spcr_h_pct*spcr_cnt                        // Remove H Used by Spacers from Remaining
                    var btn_h_pct = rem_h_pct/btn_cnt                       // Divide remaining height for buttons
                    
                #endregion
                
                // Header 1
                cmp_cfg[?FFk.varr][0][0] = horiz_space_create([0,0,0,0],frame[?FFk.fgc],frame[?FFk.bga],frame[?FFk.fgc],frame[?FFk.bga],frame[?FFk.w]*.8,M.FF.margin.STR_H*2,FF_spacer.line,noone,true)
                var cmp = cmp_cfg[?FFk.varr][0][0]
                cmp[?FFk.w_pct] = 1
                cmp[?FFk.h_pct] = spcr_h_pct
                cmp[?FFk.str] = M.FF.main.game.name + " " + M.FF.main.game.ver
                cmp[?FFk.hvalign][0] = fa_middle
                cmp[?FFk.hvalign][1] = fa_center
                
                // Header 2
                cmp_cfg[?FFk.varr][1][0] = horiz_space_create([0,0,0,0],frame[?FFk.fgc],frame[?FFk.bga],frame[?FFk.fgc],frame[?FFk.bga],frame[?FFk.w]*.8,M.FF.margin.STR_H*2,FF_spacer.line,noone,true)
                cmp = cmp_cfg[?FFk.varr][1][0]
                cmp[?FFk.w_pct] = 1
                cmp[?FFk.h_pct] = spcr_h_pct
                cmp[?FFk.str] = "Main Menu"
                cmp[?FFk.hvalign][0] = fa_middle
                cmp[?FFk.hvalign][1] = fa_center
                
                // Menu buttons
                cmp_cfg[?FFk.varr][2][0] = button_create([0,0,0,0],invert_array(frame[?FFk.bgc]),frame[?FFk.bga],invert_array(frame[?FFk.fgc]),frame[?FFk.fga],"New Game",FF_action.new_game,true)
                cmp = cmp_cfg[?FFk.varr][2][0]
                cmp[?FFk.w_pct] = .5
                cmp[?FFk.h_pct] = btn_h_pct
                cmp[?FFk.hvalign][0] = fa_middle
                cmp[?FFk.hvalign][1] = fa_center
                cmp_cfg[?FFk.varr][3][0] = button_create([0,0,0,0],invert_array(frame[?FFk.bgc]),frame[?FFk.bga],invert_array(frame[?FFk.fgc]),frame[?FFk.fga],"Save",FF_action.save,false)
                cmp = cmp_cfg[?FFk.varr][3][0]
                cmp[?FFk.w_pct] = .5
                cmp[?FFk.h_pct] = btn_h_pct
                cmp[?FFk.hvalign][0] = fa_middle
                cmp[?FFk.hvalign][1] = fa_center
                cmp_cfg[?FFk.varr][4][0] = button_create([0,0,0,0],invert_array(frame[?FFk.bgc]),frame[?FFk.bga],invert_array(frame[?FFk.fgc]),frame[?FFk.fga],"Load",FF_action.load,false)
                cmp = cmp_cfg[?FFk.varr][4][0]
                cmp[?FFk.w_pct] = .5
                cmp[?FFk.h_pct] = btn_h_pct
                cmp[?FFk.hvalign][0] = fa_middle
                cmp[?FFk.hvalign][1] = fa_center
                cmp_cfg[?FFk.varr][5][0] = button_create([0,0,0,0],invert_array(frame[?FFk.bgc]),frame[?FFk.bga],invert_array(frame[?FFk.fgc]),frame[?FFk.fga],"Settings",FF_action.settings,true)
                cmp = cmp_cfg[?FFk.varr][5][0]
                cmp[?FFk.w_pct] = .5
                cmp[?FFk.h_pct] = btn_h_pct
                cmp[?FFk.hvalign][0] = fa_middle
                cmp[?FFk.hvalign][1] = fa_center
                cmp_cfg[?FFk.varr][6][0] = button_create([0,0,0,0],invert_array(frame[?FFk.bgc]),frame[?FFk.bga],invert_array(frame[?FFk.fgc]),frame[?FFk.fga],"Exit",FF_action.ex,true)
                cmp = cmp_cfg[?FFk.varr][6][0]
                cmp[?FFk.w_pct] = .5
                cmp[?FFk.h_pct] = btn_h_pct
                cmp[?FFk.hvalign][0] = fa_middle
                cmp[?FFk.hvalign][1] = fa_center
                
            #endregion
            
            // Menu Starts Active
            frame[?FFk.active] = true
            
        #endregion
        
        #region Settings Menu
            
            #region Video Tab
                
                // Make Frame; Tabbed; Dynamic; First
                var gfi = gui_frame_create(M.FF.runtime_width*.75,M.FF.runtime_height*.75,M.FF.UID.stg_video)
                
                // Shorten Accessors
                var frame = M.FF.frame.map_list[|gfi]
                var tab_cfg = frame[?FFk.tg_cfg]
                var cmp_cfg = frame[?FFk.cmpnt_cfg]
                
                // Config Frame
                frame[?FFk.bg] = true
                frame[?FFk.fg] = true
                frame[?FFk.focus] = true
                frame[?FFk.mode] = FF_content.cmpnt
                frame[?FFk.drag] = true
                frame[?FFk.title] = true
                frame[?FFk.autosize] = true
                frame[?FFk.tab_group] = true
                tab_cfg[?FFk.uid] = M.FF.UID.tg_stg
                
                #region Config Components
                    
                    // Init
                    cmp_cfg[?FFk.varr] = [[],[],[],[],[],[]]
                    cmp_cfg[?FFk.hvalign] = [fa_middle,fa_center]
                    
                    // Display/Resolution Header
                    cmp_cfg[?FFk.varr][0][0] = horiz_space_create([0,0,0,0],frame[?FFk.fgc],frame[?FFk.bga],frame[?FFk.fgc],frame[?FFk.bga],frame[?FFk.w]*.8,M.FF.margin.STR_H*2,FF_spacer.line,noone,true)
                    cmp = cmp_cfg[?FFk.varr][0][0]
                    cmp[?FFk.w_pct] = .975
                    cmp[?FFk.h_pct] = .01
                    cmp[?FFk.hvalign] = []
                    cmp[?FFk.hvalign][0] = fa_left
                    cmp[?FFk.hvalign][1] = fa_middle
                    cmp[?FFk.str] = "Display Mode & Resolution"
                    
                    // Display Picker; Resolution Dropdown
                    cmp_cfg[?FFk.varr][1][0] = picker_create([0,0,0,0],invert_array(frame[?FFk.bgc]),frame[?FFk.bga],invert_array(frame[?FFk.fgc]),frame[?FFk.fga],display_mode_arr(),noone,true)
                    cmp = cmp_cfg[?FFk.varr][1][0]
                    cmp[?FFk.w_pct] = .45
                    cmp[?FFk.h_pct] = .1
                    cmp[?FFk.hvalign] = []
                    cmp[?FFk.hvalign][0] = fa_middle
                    cmp[?FFk.hvalign][1] = fa_center
                    cmp_cfg[?FFk.varr][1][1] = dropdown_create([0,0,0,0],invert_array(frame[?FFk.bgc]),frame[?FFk.bga],invert_array(frame[?FFk.fgc]),frame[?FFk.fga],resolution_arr(),FF_action.rwh,true)
                    cmp = cmp_cfg[?FFk.varr][1][1]
                    cmp[?FFk.w_pct] = .45
                    cmp[?FFk.h_pct] = .1
                    cmp[?FFk.hvalign] = []
                    cmp[?FFk.hvalign][0] = fa_middle
                    cmp[?FFk.hvalign][1] = fa_center
                    cmp[?FFk.opt_cfg][?FFk.val] = 1     // Set to default resolution 1024x768
                    
                    // Custom Resolution Fields
                    cmp_cfg[?FFk.varr][2][0] = input_field_create([0,0,0,0],invert_array(frame[?FFk.bgc]),frame[?FFk.bga],invert_array(frame[?FFk.fgc]),frame[?FFk.fga],"Window Width:",FF_input.posnum,FF_action.set_rw,false)
                    cmp = cmp_cfg[?FFk.varr][2][0]
                    cmp[?FFk.w_pct] = .45
                    cmp[?FFk.h_pct] = .1
                    cmp[?FFk.hvalign] = []
                    cmp[?FFk.hvalign][0] = fa_middle
                    cmp[?FFk.hvalign][1] = fa_center
                    var npt = cmp_cfg[?FFk.varr][2][0][?FFk.inp_cfg]
                    npt[?FFk.limit] = 4
                    cmp_cfg[?FFk.varr][2][1] = input_field_create([0,0,0,0],invert_array(frame[?FFk.bgc]),frame[?FFk.bga],invert_array(frame[?FFk.fgc]),frame[?FFk.fga],"Window Height:",FF_input.posnum,FF_action.set_rh,false)
                    cmp = cmp_cfg[?FFk.varr][2][1]
                    cmp[?FFk.w_pct] = .45
                    cmp[?FFk.h_pct] = .1
                    cmp[?FFk.hvalign] = []
                    cmp[?FFk.hvalign][0] = fa_middle
                    cmp[?FFk.hvalign][1] = fa_center
                    npt = cmp_cfg[?FFk.varr][2][1][?FFk.inp_cfg]
                    npt[?FFk.limit] = 4
                    
                    // Vsync and Custom Resolution Toggles
                    cmp_cfg[?FFk.varr][3][0] = toggle_create([0,0,0,0],invert_array(frame[?FFk.bgc]),frame[?FFk.bga],invert_array(frame[?FFk.fgc]),frame[?FFk.fga],"VSync",M.FF.runtime_vertical_sync,[[FF_action.none],FF_action.vsync],true)
                    cmp = cmp_cfg[?FFk.varr][3][0]
                    cmp[?FFk.w_pct] = .075
                    cmp[?FFk.h_pct] = .075
                    cmp[?FFk.hvalign] = []
                    cmp[?FFk.hvalign][0] = fa_middle
                    cmp[?FFk.hvalign][1] = fa_center
                    cmp_cfg[?FFk.varr][3][1] = toggle_create([0,0,0,0],invert_array(frame[?FFk.bgc]),frame[?FFk.bga],invert_array(frame[?FFk.fgc]),frame[?FFk.fga],"Custom Resolution",false,
                                                [[FF_action.tog_inpf,FF_action.none,FF_action.none,FF_action.win,FF_action.win],cmp_cfg[?FFk.varr][2][0],cmp_cfg[?FFk.varr][2][1],
                                                cmp_cfg[?FFk.varr][1][0],cmp_cfg[?FFk.varr][1][1]],true)
                    cmp = cmp_cfg[?FFk.varr][3][1]
                    cmp[?FFk.w_pct] = .075
                    cmp[?FFk.h_pct] = .075
                    cmp[?FFk.hvalign] = []
                    cmp[?FFk.hvalign][0] = fa_middle
                    cmp[?FFk.hvalign][1] = fa_center
                    
                    // Graphics Header
                    cmp_cfg[?FFk.varr][4][0] = horiz_space_create([0,0,0,0],frame[?FFk.fgc],frame[?FFk.bga],frame[?FFk.fgc],frame[?FFk.bga],frame[?FFk.w]*.8,M.FF.margin.STR_H*2,FF_spacer.line,noone,true)
                    cmp = cmp_cfg[?FFk.varr][4][0]
                    cmp[?FFk.w_pct] = .975
                    cmp[?FFk.h_pct] = .01
                    cmp[?FFk.str] = "Graphics"
                    cmp[?FFk.hvalign] = []
                    cmp[?FFk.hvalign][0] = fa_left
                    cmp[?FFk.hvalign][1] = fa_middle
                    
                    // Graphics Drowdown; Apply Button
                    cmp_cfg[?FFk.varr][5][0] = dropdown_create([0,0,0,0],invert_array(frame[?FFk.bgc]),frame[?FFk.bga],invert_array(frame[?FFk.fgc]),frame[?FFk.fga],gfx_arr(),FF_action.aa,true)
                    cmp = cmp_cfg[?FFk.varr][5][0]
                    cmp[?FFk.w_pct] = .45
                    cmp[?FFk.h_pct] = .1
                    cmp[?FFk.hvalign] = []
                    cmp[?FFk.hvalign][0] = fa_middle
                    cmp[?FFk.hvalign][1] = fa_center
                    cmp_cfg[?FFk.varr][5][1] = button_create([0,0,0,0],invert_array(frame[?FFk.bgc]),frame[?FFk.bga],invert_array(frame[?FFk.fgc]),frame[?FFk.fga],"Apply",FF_action.gfx_apply,true)
                    cmp = cmp_cfg[?FFk.varr][5][1]
                    cmp[?FFk.w_pct] = .45
                    cmp[?FFk.h_pct] = .1
                    cmp[?FFk.hvalign] = []
                    cmp[?FFk.hvalign][0] = fa_middle
                    cmp[?FFk.hvalign][1] = fa_center
                    
                #endregion
                
                // Enable Title Buttons
                enable_title_buttons(frame)
                
            #endregion
            
            #region Audio Tab
                
                // Frame; Dynamic; Tabbed
                gfi = gui_frame_create(M.FF.runtime_width*.75,M.FF.runtime_height*.75,M.FF.UID.stg_audio)
                
                // Shorten Accessors
                frame = M.FF.frame.map_list[|gfi]
                var tab_cfg = frame[?FFk.tg_cfg]
                var cmp_cfg = frame[?FFk.cmpnt_cfg]
                
                // Config Frame
                frame[?FFk.bg] = true
                frame[?FFk.fg] = true
                frame[?FFk.focus] = true
                frame[?FFk.mode] = FF_content.cmpnt
                frame[?FFk.drag] = true
                frame[?FFk.title] = true
                frame[?FFk.autosize] = true
                frame[?FFk.tab_group] = true
                tab_cfg[?FFk.uid] = M.FF.UID.tg_stg
                
                #region Config Components
                    
                    // Init
                    cmp_cfg[?FFk.varr] = [[],[],[],[],[]] // Have no clue why I have to do this here now, GMEdit issue.
                    cmp_cfg[?FFk.hvalign] = [fa_middle,fa_center]
                    
                    // Volume Header
                    cmp_cfg[?FFk.varr][0][0] = horiz_space_create([0,0,0,0],frame[?FFk.fgc],frame[?FFk.bga],frame[?FFk.fgc],frame[?FFk.bga],frame[?FFk.w]*.8,M.FF.margin.STR_H*2,FF_spacer.line,noone,true)
                    cmp = cmp_cfg[?FFk.varr][0][0]
                    cmp[?FFk.w_pct] = .975
                    cmp[?FFk.h_pct] = .01
                    cmp[?FFk.hvalign] = []
                    cmp[?FFk.hvalign][0] = fa_left
                    cmp[?FFk.hvalign][1] = fa_bottom
                    cmp[?FFk.str] = "Volume Controls"
                    
                    // Volume Sliders
                    cmp_cfg[?FFk.varr][1][0] = slider_create([0,0,0,0],frame[?FFk.bgc],frame[?FFk.bga],frame[?FFk.fgc],frame[?FFk.fga],M.FF.main.vol_master.str,
                        M.FF.main.vol_master.sym,M.FF.main.vol_master.val,M.FF.main.vol_master.val_mn,M.FF.main.vol_master.val_mx,FF_action.vol_master,true)
                    cmp = cmp_cfg[?FFk.varr][1][0]
                    cmp[?FFk.w_pct] = .75
                    cmp[?FFk.h_pct] = .1
                    cmp[?FFk.hvalign] = []
                    cmp[?FFk.hvalign][0] = fa_middle
                    cmp[?FFk.hvalign][1] = fa_center
                    cmp_cfg[?FFk.varr][2][0] = slider_create([0,0,0,0],frame[?FFk.bgc],frame[?FFk.bga],frame[?FFk.fgc],frame[?FFk.fga],M.FF.main.vol_sfx.str,
                        M.FF.main.vol_sfx.sym,M.FF.main.vol_sfx.val,M.FF.main.vol_sfx.val_mn,M.FF.main.vol_sfx.val_mx,FF_action.vol_sfx,true)
                    cmp = cmp_cfg[?FFk.varr][2][0]
                    cmp[?FFk.w_pct] = .75
                    cmp[?FFk.h_pct] = .1
                    cmp[?FFk.hvalign] = []
                    cmp[?FFk.hvalign][0] = fa_middle
                    cmp[?FFk.hvalign][1] = fa_center
                    cmp_cfg[?FFk.varr][3][0] = slider_create([0,0,0,0],frame[?FFk.bgc],frame[?FFk.bga],frame[?FFk.fgc],frame[?FFk.fga],M.FF.main.vol_music.str,
                        M.FF.main.vol_music.sym,M.FF.main.vol_music.val,M.FF.main.vol_music.val_mn,M.FF.main.vol_music.val_mx,FF_action.vol_music,true)
                    cmp = cmp_cfg[?FFk.varr][3][0]
                    cmp[?FFk.w_pct] = .75
                    cmp[?FFk.h_pct] = .1
                    cmp[?FFk.hvalign] = []
                    cmp[?FFk.hvalign][0] = fa_middle
                    cmp[?FFk.hvalign][1] = fa_center
                    cmp_cfg[?FFk.varr][4][0] = slider_create([0,0,0,0],frame[?FFk.bgc],frame[?FFk.bga],frame[?FFk.fgc],frame[?FFk.fga],M.FF.main.vol_voice.str,
                        M.FF.main.vol_voice.sym,M.FF.main.vol_voice.val,M.FF.main.vol_voice.val_mn,M.FF.main.vol_voice.val_mx,FF_action.vol_voice,true)
                    cmp = cmp_cfg[?FFk.varr][4][0]
                    cmp[?FFk.w_pct] = .75
                    cmp[?FFk.h_pct] = .1
                    cmp[?FFk.hvalign] = []
                    cmp[?FFk.hvalign][0] = fa_middle
                    cmp[?FFk.hvalign][1] = fa_center
                    
                #endregion
                
                // Enable Title Buttons
                enable_title_buttons(frame)
                
            #endregion
            
            #region Game Tab
                
                // Frame; Dynamic; Tabbed
                gfi = gui_frame_create(M.FF.runtime_width*.75,M.FF.runtime_height*.75,M.FF.UID.stg_game)
                
                // Shorten Accessors
                frame = M.FF.frame.map_list[|gfi]
                var tab_cfg = frame[?FFk.tg_cfg]
                var cmp_cfg = frame[?FFk.cmpnt_cfg]
                
                // Config Frame
                frame[?FFk.bg] = true
                frame[?FFk.fg] = true
                frame[?FFk.focus] = true
                frame[?FFk.mode] = FF_content.cmpnt
                frame[?FFk.drag] = true
                frame[?FFk.title] = true
                frame[?FFk.autosize] = true
                frame[?FFk.tab_group] = true
                tab_cfg[?FFk.uid] = M.FF.UID.tg_stg
                
                #region Config Components
                    
                    // Init
                    cmp_cfg[?FFk.varr] = [[],[]]
                    
                    // Gameplay header
                    cmp_cfg[?FFk.varr][0][0] = horiz_space_create([0,0,0,0],frame[?FFk.fgc],frame[?FFk.bga],frame[?FFk.fgc],frame[?FFk.bga],frame[?FFk.w]*.8,M.FF.margin.STR_H*2,FF_spacer.line,noone,true)
                    cmp = cmp_cfg[?FFk.varr][0][0]
                    cmp[?FFk.w_pct] = .975
                    cmp[?FFk.h_pct] = .01
                    cmp[?FFk.hvalign] = []
                    cmp[?FFk.hvalign][0] = fa_left
                    cmp[?FFk.hvalign][1] = fa_top
                    cmp[?FFk.str] = "Gameplay Modifiers"
                    
                    // Difficulty Mult Slider
                    cmp_cfg[?FFk.varr][1][0] = slider_create([0,0,0,0],frame[?FFk.bgc],frame[?FFk.bga],frame[?FFk.fgc],frame[?FFk.fga],M.FF.main.difficulty_scale.str,
                        M.FF.main.difficulty_scale.sym,M.FF.main.difficulty_scale.val,M.FF.main.difficulty_scale.val_mn,M.FF.main.difficulty_scale.val_mx,FF_action.difficulty_scale,true)
                    cmp = cmp_cfg[?FFk.varr][1][0]
                    cmp[?FFk.w_pct] = .75
                    cmp[?FFk.h_pct] = .1
                    cmp[?FFk.hvalign] = []
                    cmp[?FFk.hvalign][0] = fa_left
                    cmp[?FFk.hvalign][1] = fa_bottom
                    
                #endregion
                
                // Enable Title Buttons
                enable_title_buttons(frame)
                
            #endregion
            
            #region Controls 1 Tab
                
                // Frame; Tabbed; Dynamic
                gfi = gui_frame_create(M.FF.runtime_width*.75,M.FF.runtime_height*.75,M.FF.UID.stg_control1)
                
                // Shorten Accessors
                frame = M.FF.frame.map_list[|gfi]
                var tab_cfg = frame[?FFk.tg_cfg]
                var cmp_cfg = frame[?FFk.cmpnt_cfg]
                
                // Config Frame
                frame[?FFk.bg] = true
                frame[?FFk.fg] = true
                frame[?FFk.focus] = true
                frame[?FFk.mode] = FF_content.cmpnt
                frame[?FFk.drag] = true
                frame[?FFk.title] = true
                frame[?FFk.autosize] = true
                frame[?FFk.tab_group] = true
                tab_cfg[?FFk.uid] = M.FF.UID.tg_stg
                
                #region Config Components
                    
                    // Init
                    cmp_cfg[?FFk.varr] = [[],[],[],[],[],[],[],[],[],[],[],[],[]]
                    cmp_cfg[?FFk.hvalign] = [fa_middle,fa_center]
                    
                    // Reassign Header
                    cmp_cfg[?FFk.varr][0][0] = horiz_space_create([0,0,0,0],frame[?FFk.fgc],frame[?FFk.bga],frame[?FFk.fgc],frame[?FFk.bga],frame[?FFk.w]*.8,M.FF.margin.STR_H*2,FF_spacer.line,noone,true)
                    cmp = cmp_cfg[?FFk.varr][0][0]
                    cmp[?FFk.w_pct] = .975
                    cmp[?FFk.h_pct] = .01
                    cmp[?FFk.hvalign] = []
                    cmp[?FFk.hvalign][0] = fa_left
                    cmp[?FFk.hvalign][1] = fa_bottom
                    cmp[?FFk.str] = "Reassign Controls"
                    
                    // Movement Sub Header
                    cmp_cfg[?FFk.varr][1][0] = horiz_space_create([0,0,0,0],frame[?FFk.fgc],frame[?FFk.bga],frame[?FFk.fgc],frame[?FFk.bga],frame[?FFk.w]*.8,M.FF.margin.STR_H*2,FF_spacer.bar_line,noone,true)
                    cmp = cmp_cfg[?FFk.varr][1][0]
                    cmp[?FFk.w_pct] = .975
                    cmp[?FFk.h_pct] = .1
                    cmp[?FFk.hvalign] = []
                    cmp[?FFk.hvalign][0] = fa_middle
                    cmp[?FFk.hvalign][1] = fa_center
                    cmp[?FFk.str] = "Movement"
                    
                    #region Movement Bind Buttons and Labels
                        
                        // First Row
                        cmp_cfg[?FFk.varr][2][0] = label_create([0,0,0,0],frame[?FFk.fgc],frame[?FFk.fga],M.FF.command.up.str + " : ",[fa_right,fa_center])
                        cmp = cmp_cfg[?FFk.varr][2][0]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp_cfg[?FFk.varr][2][1] = bind_button_create([0,0,0,0],invert_array(frame[?FFk.bgc]),frame[?FFk.bga],invert_array(frame[?FFk.fgc]),frame[?FFk.fga],M.FF.command.up,true)
                        cmp = cmp_cfg[?FFk.varr][2][1]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp[?FFk.hvalign] = []
                        cmp[?FFk.hvalign][0] = fa_middle
                        cmp[?FFk.hvalign][1] = fa_center
                        cmp_cfg[?FFk.varr][2][2] = label_create([0,0,0,0],frame[?FFk.fgc],frame[?FFk.fga],M.FF.command.left.str + " : ",[fa_right,fa_center])
                        cmp = cmp_cfg[?FFk.varr][2][2]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp_cfg[?FFk.varr][2][3] = bind_button_create([0,0,0,0],invert_array(frame[?FFk.bgc]),frame[?FFk.bga],invert_array(frame[?FFk.fgc]),frame[?FFk.fga],M.FF.command.left,true)
                        cmp = cmp_cfg[?FFk.varr][2][3]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp[?FFk.hvalign] = []
                        cmp[?FFk.hvalign][0] = fa_middle
                        cmp[?FFk.hvalign][1] = fa_center
                        
                        // Next Row
                        cmp_cfg[?FFk.varr][3][0] = label_create([0,0,0,0],frame[?FFk.fgc],frame[?FFk.fga],M.FF.command.down.str + " : ",[fa_right,fa_center])
                        cmp = cmp_cfg[?FFk.varr][3][0]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp_cfg[?FFk.varr][3][1] = bind_button_create([0,0,0,0],invert_array(frame[?FFk.bgc]),frame[?FFk.bga],invert_array(frame[?FFk.fgc]),frame[?FFk.fga],M.FF.command.down,true)
                        cmp = cmp_cfg[?FFk.varr][3][1]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp[?FFk.hvalign] = []
                        cmp[?FFk.hvalign][0] = fa_middle
                        cmp[?FFk.hvalign][1] = fa_center
                        cmp_cfg[?FFk.varr][3][2] = label_create([0,0,0,0],frame[?FFk.fgc],frame[?FFk.fga],M.FF.command.right.str + " : ",[fa_right,fa_center])
                        cmp = cmp_cfg[?FFk.varr][3][2]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp_cfg[?FFk.varr][3][3] = bind_button_create([0,0,0,0],invert_array(frame[?FFk.bgc]),frame[?FFk.bga],invert_array(frame[?FFk.fgc]),frame[?FFk.fga],M.FF.command.right,true)
                        cmp = cmp_cfg[?FFk.varr][3][3]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp[?FFk.hvalign] = []
                        cmp[?FFk.hvalign][0] = fa_middle
                        cmp[?FFk.hvalign][1] = fa_center
                        
                        // Next Row
                        cmp_cfg[?FFk.varr][4][0] = label_create([0,0,0,0],frame[?FFk.fgc],frame[?FFk.fga],M.FF.command.jump.str + " : ",[fa_right,fa_center])
                        cmp = cmp_cfg[?FFk.varr][4][0]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp_cfg[?FFk.varr][4][1] = bind_button_create([0,0,0,0],invert_array(frame[?FFk.bgc]),frame[?FFk.bga],invert_array(frame[?FFk.fgc]),frame[?FFk.fga],M.FF.command.jump,true)
                        cmp = cmp_cfg[?FFk.varr][4][1]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp[?FFk.hvalign] = []
                        cmp[?FFk.hvalign][0] = fa_middle
                        cmp[?FFk.hvalign][1] = fa_center
                        cmp_cfg[?FFk.varr][4][2] = label_create([0,0,0,0],frame[?FFk.fgc],frame[?FFk.fga],M.FF.command.crouch.str + " : ",[fa_right,fa_center])
                        cmp = cmp_cfg[?FFk.varr][4][2]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp_cfg[?FFk.varr][4][3] = bind_button_create([0,0,0,0],invert_array(frame[?FFk.bgc]),frame[?FFk.bga],invert_array(frame[?FFk.fgc]),frame[?FFk.fga],M.FF.command.crouch,true)
                        cmp = cmp_cfg[?FFk.varr][4][3]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp[?FFk.hvalign] = []
                        cmp[?FFk.hvalign][0] = fa_middle
                        cmp[?FFk.hvalign][1] = fa_center
                        
                        // Next Row
                        cmp_cfg[?FFk.varr][5][0] = label_create([0,0,0,0],frame[?FFk.fgc],frame[?FFk.fga],M.FF.command.sprint.str + " : ",[fa_right,fa_center])
                        cmp = cmp_cfg[?FFk.varr][5][0]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp_cfg[?FFk.varr][5][1] = bind_button_create([0,0,0,0],invert_array(frame[?FFk.bgc]),frame[?FFk.bga],invert_array(frame[?FFk.fgc]),frame[?FFk.fga],M.FF.command.sprint,true)
                        cmp = cmp_cfg[?FFk.varr][5][1]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp[?FFk.hvalign] = []
                        cmp[?FFk.hvalign][0] = fa_middle
                        cmp[?FFk.hvalign][1] = fa_center
                        cmp_cfg[?FFk.varr][5][2] = label_create([0,0,0,0],frame[?FFk.fgc],frame[?FFk.fga],"",[fa_middle,fa_center])
                        cmp = cmp_cfg[?FFk.varr][5][2]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp_cfg[?FFk.varr][5][3] = label_create([0,0,0,0],frame[?FFk.fgc],frame[?FFk.fga],"",[fa_middle,fa_center])
                        cmp = cmp_cfg[?FFk.varr][5][3]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        
                    #endregion
                    
                    // Interaction Sub Header
                    cmp_cfg[?FFk.varr][6][0] = horiz_space_create([0,0,0,0],frame[?FFk.fgc],frame[?FFk.bga],frame[?FFk.fgc],frame[?FFk.bga],frame[?FFk.w]*.8,M.FF.margin.STR_H*2,FF_spacer.bar_line,noone,true)
                    cmp = cmp_cfg[?FFk.varr][6][0]
                    cmp[?FFk.w_pct] = .975
                    cmp[?FFk.h_pct] = .1
                    cmp[?FFk.hvalign] = []
                    cmp[?FFk.hvalign][0] = fa_middle
                    cmp[?FFk.hvalign][1] = fa_center
                    cmp[?FFk.str] = "Interaction"
                    
                    #region Interaction Bind Buttons and Labels
                    
                        // First Row
                        cmp_cfg[?FFk.varr][7][0] = label_create([0,0,0,0],frame[?FFk.fgc],frame[?FFk.fga],M.FF.command.use.str + " : ",[fa_right,fa_center])
                        cmp = cmp_cfg[?FFk.varr][7][0]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp_cfg[?FFk.varr][7][1] = bind_button_create([0,0,0,0],invert_array(frame[?FFk.bgc]),frame[?FFk.bga],invert_array(frame[?FFk.fgc]),frame[?FFk.fga],M.FF.command.use,true)
                        cmp = cmp_cfg[?FFk.varr][7][1]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp[?FFk.hvalign] = []
                        cmp[?FFk.hvalign][0] = fa_middle
                        cmp[?FFk.hvalign][1] = fa_center
                        cmp_cfg[?FFk.varr][7][2] = label_create([0,0,0,0],frame[?FFk.fgc],frame[?FFk.fga],M.FF.command.confirm.str + " : ",[fa_right,fa_center])
                        cmp = cmp_cfg[?FFk.varr][7][2]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp_cfg[?FFk.varr][7][3] = bind_button_create([0,0,0,0],invert_array(frame[?FFk.bgc]),frame[?FFk.bga],invert_array(frame[?FFk.fgc]),frame[?FFk.fga],M.FF.command.confirm,true)
                        cmp = cmp_cfg[?FFk.varr][7][3]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp[?FFk.hvalign] = []
                        cmp[?FFk.hvalign][0] = fa_middle
                        cmp[?FFk.hvalign][1] = fa_center
                        
                        // Next Row
                        cmp_cfg[?FFk.varr][8][0] = label_create([0,0,0,0],frame[?FFk.fgc],frame[?FFk.fga],M.FF.command.cancel.str + " : ",[fa_right,fa_center])
                        cmp = cmp_cfg[?FFk.varr][8][0]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp_cfg[?FFk.varr][8][1] = bind_button_create([0,0,0,0],invert_array(frame[?FFk.bgc]),frame[?FFk.bga],invert_array(frame[?FFk.fgc]),frame[?FFk.fga],M.FF.command.cancel,true)
                        cmp = cmp_cfg[?FFk.varr][8][1]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp[?FFk.hvalign] = []
                        cmp[?FFk.hvalign][0] = fa_middle
                        cmp[?FFk.hvalign][1] = fa_center
                        // White Space Components (Empty Labels)
                        cmp_cfg[?FFk.varr][8][2] = label_create([0,0,0,0],frame[?FFk.fgc],frame[?FFk.fga],"",[fa_middle,fa_center])
                        cmp = cmp_cfg[?FFk.varr][8][2]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp_cfg[?FFk.varr][8][3] = label_create([0,0,0,0],frame[?FFk.fgc],frame[?FFk.fga],"",[fa_middle,fa_center])
                        cmp = cmp_cfg[?FFk.varr][8][3]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        
                    #endregion
                        
                    // Menu Sub Header
                    cmp_cfg[?FFk.varr][9][0] = horiz_space_create([0,0,0,0],frame[?FFk.fgc],frame[?FFk.bga],frame[?FFk.fgc],frame[?FFk.bga],frame[?FFk.w]*.8,M.FF.margin.STR_H*2,FF_spacer.bar_line,noone,true)
                    cmp = cmp_cfg[?FFk.varr][9][0]
                    cmp[?FFk.w_pct] = .975
                    cmp[?FFk.h_pct] = .1
                    cmp[?FFk.hvalign] = []
                    cmp[?FFk.hvalign][0] = fa_middle
                    cmp[?FFk.hvalign][1] = fa_center
                    cmp[?FFk.str] = "Menu"
                        
                    #region Menu Bind Buttons and Labels
                        
                        // First Row
                        cmp_cfg[?FFk.varr][10][0] = label_create([0,0,0,0],frame[?FFk.fgc],frame[?FFk.fga],M.FF.command.menu.str + " : ",[fa_right,fa_center])
                        cmp = cmp_cfg[?FFk.varr][10][0]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp_cfg[?FFk.varr][10][1] = bind_button_create([0,0,0,0],invert_array(frame[?FFk.bgc]),frame[?FFk.bga],invert_array(frame[?FFk.fgc]),frame[?FFk.fga],M.FF.command.menu,true)
                        cmp = cmp_cfg[?FFk.varr][10][1]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp[?FFk.hvalign] = []
                        cmp[?FFk.hvalign][0] = fa_middle
                        cmp[?FFk.hvalign][1] = fa_center
                        cmp_cfg[?FFk.varr][10][2] = label_create([0,0,0,0],frame[?FFk.fgc],frame[?FFk.fga],M.FF.command.inv.str + " : ",[fa_right,fa_center])
                        cmp = cmp_cfg[?FFk.varr][10][2]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp_cfg[?FFk.varr][10][3] = bind_button_create([0,0,0,0],invert_array(frame[?FFk.bgc]),frame[?FFk.bga],invert_array(frame[?FFk.fgc]),frame[?FFk.fga],M.FF.command.inv,true)
                        cmp = cmp_cfg[?FFk.varr][10][3]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp[?FFk.hvalign] = []
                        cmp[?FFk.hvalign][0] = fa_middle
                        cmp[?FFk.hvalign][1] = fa_center
                        
                        // Next Row
                        cmp_cfg[?FFk.varr][11][0] = label_create([0,0,0,0],frame[?FFk.fgc],frame[?FFk.fga],M.FF.command.char.str + " : ",[fa_right,fa_center])
                        cmp = cmp_cfg[?FFk.varr][11][0]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp_cfg[?FFk.varr][11][1] = bind_button_create([0,0,0,0],invert_array(frame[?FFk.bgc]),frame[?FFk.bga],invert_array(frame[?FFk.fgc]),frame[?FFk.fga],M.FF.command.char,true)
                        cmp = cmp_cfg[?FFk.varr][11][1]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp[?FFk.hvalign] = []
                        cmp[?FFk.hvalign][0] = fa_middle
                        cmp[?FFk.hvalign][1] = fa_center
                        cmp_cfg[?FFk.varr][11][2] = label_create([0,0,0,0],frame[?FFk.fgc],frame[?FFk.fga],M.FF.command.log.str + " : ",[fa_right,fa_center])
                        cmp = cmp_cfg[?FFk.varr][11][2]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp_cfg[?FFk.varr][11][3] = bind_button_create([0,0,0,0],invert_array(frame[?FFk.bgc]),frame[?FFk.bga],invert_array(frame[?FFk.fgc]),frame[?FFk.fga],M.FF.command.log,true)
                        cmp = cmp_cfg[?FFk.varr][11][3]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp[?FFk.hvalign] = []
                        cmp[?FFk.hvalign][0] = fa_middle
                        cmp[?FFk.hvalign][1] = fa_center
                        
                        // Next Row
                        cmp_cfg[?FFk.varr][12][0] = label_create([0,0,0,0],frame[?FFk.fgc],frame[?FFk.fga],M.FF.command.map.str + " : ",[fa_right,fa_center])
                        cmp = cmp_cfg[?FFk.varr][12][0]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp_cfg[?FFk.varr][12][1] = bind_button_create([0,0,0,0],invert_array(frame[?FFk.bgc]),frame[?FFk.bga],invert_array(frame[?FFk.fgc]),frame[?FFk.fga],M.FF.command.map,true)
                        cmp = cmp_cfg[?FFk.varr][12][1]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp[?FFk.hvalign] = []
                        cmp[?FFk.hvalign][0] = fa_middle
                        cmp[?FFk.hvalign][1] = fa_center
                        // White Space Components (Empty Labels)
                        cmp_cfg[?FFk.varr][12][2] = label_create([0,0,0,0],frame[?FFk.fgc],frame[?FFk.fga],"",[fa_middle,fa_center])
                        cmp = cmp_cfg[?FFk.varr][12][2]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp_cfg[?FFk.varr][12][3] = label_create([0,0,0,0],frame[?FFk.fgc],frame[?FFk.fga],"",[fa_middle,fa_center])
                        cmp = cmp_cfg[?FFk.varr][12][3]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        
                    #endregion
                    
                #endregion
                
                // Enable Title Buttons
                enable_title_buttons(frame)
                
            #endregion
            
            #region Controls 2 Tab
                
                // Framel Tabbed; Dynamic
                gfi = gui_frame_create(M.FF.runtime_width*.75,M.FF.runtime_height*.75,M.FF.UID.stg_control2)
                
                // Shorten Accessors
                frame = M.FF.frame.map_list[|gfi]
                var tab_cfg = frame[?FFk.tg_cfg]
                var cmp_cfg = frame[?FFk.cmpnt_cfg]
                
                // Config Frame
                frame[?FFk.bg] = true
                frame[?FFk.fg] = true
                frame[?FFk.focus] = true
                frame[?FFk.mode] = FF_content.cmpnt
                frame[?FFk.drag] = true
                frame[?FFk.title] = true
                frame[?FFk.autosize] = true
                frame[?FFk.tab_group] = true
                tab_cfg[?FFk.uid] = M.FF.UID.tg_stg
                
                #region Config Components
                    
                    cmp_cfg[?FFk.varr] = [[],[],[],[],[],[],[],[],[],[]]
                    cmp_cfg[?FFk.hvalign] = [fa_middle,fa_center]
                    
                    // Reassign cont'd Header
                    cmp_cfg[?FFk.varr][0][0] = horiz_space_create([0,0,0,0],frame[?FFk.fgc],frame[?FFk.bga],frame[?FFk.fgc],frame[?FFk.bga],frame[?FFk.w]*.8,M.FF.margin.STR_H*2,FF_spacer.line,noone,true)
                    cmp = cmp_cfg[?FFk.varr][0][0]
                    cmp[?FFk.w_pct] = .975
                    cmp[?FFk.h_pct] = .01
                    cmp[?FFk.hvalign] = []
                    cmp[?FFk.hvalign][0] = fa_left
                    cmp[?FFk.hvalign][1] = fa_bottom
                    cmp_cfg[?FFk.varr][0][0][?FFk.str] = "Reassign Controls (Continued)"
                    
                    // Combat/Other Sub Header
                    cmp_cfg[?FFk.varr][1][0] = horiz_space_create([0,0,0,0],frame[?FFk.fgc],frame[?FFk.bga],frame[?FFk.fgc],frame[?FFk.bga],frame[?FFk.w]*.8,M.FF.margin.STR_H*2,FF_spacer.bar_line,noone,true)
                    cmp = cmp_cfg[?FFk.varr][1][0]
                    cmp[?FFk.w_pct] = .975
                    cmp[?FFk.h_pct] = .1
                    cmp[?FFk.hvalign] = []
                    cmp[?FFk.hvalign][0] = fa_middle
                    cmp[?FFk.hvalign][1] = fa_center
                    cmp_cfg[?FFk.varr][1][0][?FFk.str] = "Combat/Other"
                    
                    #region Combat/Other Bind Buttons and Labels
                        
                        // First Row
                        cmp_cfg[?FFk.varr][2][0] = label_create([0,0,0,0],frame[?FFk.fgc],frame[?FFk.fga],M.FF.command.reload.str + " : ",[fa_right,fa_center])
                        cmp = cmp_cfg[?FFk.varr][2][0]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp_cfg[?FFk.varr][2][1] = bind_button_create([0,0,0,0],invert_array(frame[?FFk.bgc]),frame[?FFk.bga],invert_array(frame[?FFk.fgc]),frame[?FFk.fga],M.FF.command.reload,true)
                        cmp = cmp_cfg[?FFk.varr][2][1]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp[?FFk.hvalign] = []
                        cmp[?FFk.hvalign][0] = fa_middle
                        cmp[?FFk.hvalign][1] = fa_center
                        cmp_cfg[?FFk.varr][2][2] = label_create([0,0,0,0],frame[?FFk.fgc],frame[?FFk.fga],M.FF.command.light.str + " : ",[fa_right,fa_center])
                        cmp = cmp_cfg[?FFk.varr][2][2]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp_cfg[?FFk.varr][2][3] = bind_button_create([0,0,0,0],invert_array(frame[?FFk.bgc]),frame[?FFk.bga],invert_array(frame[?FFk.fgc]),frame[?FFk.fga],M.FF.command.light,true)
                        cmp = cmp_cfg[?FFk.varr][2][3]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp[?FFk.hvalign] = []
                        cmp[?FFk.hvalign][0] = fa_middle
                        cmp[?FFk.hvalign][1] = fa_center
                        
                        // Next Row
                        cmp_cfg[?FFk.varr][3][0] = label_create([0,0,0,0],frame[?FFk.fgc],frame[?FFk.fga],M.FF.command.drop.str + " : ",[fa_right,fa_center])
                        cmp = cmp_cfg[?FFk.varr][3][0]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp_cfg[?FFk.varr][3][1] = bind_button_create([0,0,0,0],invert_array(frame[?FFk.bgc]),frame[?FFk.bga],invert_array(frame[?FFk.fgc]),frame[?FFk.fga],M.FF.command.drop,true)
                        cmp = cmp_cfg[?FFk.varr][3][1]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp[?FFk.hvalign] = []
                        cmp[?FFk.hvalign][0] = fa_middle
                        cmp[?FFk.hvalign][1] = fa_center
                        cmp_cfg[?FFk.varr][3][2] = label_create([0,0,0,0],frame[?FFk.fgc],frame[?FFk.fga],M.FF.command.tthrow.str + " : ",[fa_right,fa_center])
                        cmp = cmp_cfg[?FFk.varr][3][2]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp_cfg[?FFk.varr][3][3] = bind_button_create([0,0,0,0],invert_array(frame[?FFk.bgc]),frame[?FFk.bga],invert_array(frame[?FFk.fgc]),frame[?FFk.fga],M.FF.command.tthrow,true)
                        cmp = cmp_cfg[?FFk.varr][3][3]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp[?FFk.hvalign] = []
                        cmp[?FFk.hvalign][0] = fa_middle
                        cmp[?FFk.hvalign][1] = fa_center
                        
                        // Next Row
                        cmp_cfg[?FFk.varr][4][0] = label_create([0,0,0,0],frame[?FFk.fgc],frame[?FFk.fga],M.FF.command.melee.str + " : ",[fa_right,fa_center])
                        cmp = cmp_cfg[?FFk.varr][4][0]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp_cfg[?FFk.varr][4][1] = bind_button_create([0,0,0,0],invert_array(frame[?FFk.bgc]),frame[?FFk.bga],invert_array(frame[?FFk.fgc]),frame[?FFk.fga],M.FF.command.melee,true)
                        cmp = cmp_cfg[?FFk.varr][4][1]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp[?FFk.hvalign] = []
                        cmp[?FFk.hvalign][0] = fa_middle
                        cmp[?FFk.hvalign][1] = fa_center
                        cmp_cfg[?FFk.varr][4][2] = label_create([0,0,0,0],frame[?FFk.fgc],frame[?FFk.fga],M.FF.command.primary.str + " : ",[fa_right,fa_center])
                        cmp = cmp_cfg[?FFk.varr][4][2]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp_cfg[?FFk.varr][4][3] = bind_button_create([0,0,0,0],invert_array(frame[?FFk.bgc]),frame[?FFk.bga],invert_array(frame[?FFk.fgc]),frame[?FFk.fga],M.FF.command.primary,true)
                        cmp = cmp_cfg[?FFk.varr][4][3]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp[?FFk.hvalign] = []
                        cmp[?FFk.hvalign][0] = fa_middle
                        cmp[?FFk.hvalign][1] = fa_center
                        
                        // Next Row
                        cmp_cfg[?FFk.varr][5][0] = label_create([0,0,0,0],frame[?FFk.fgc],frame[?FFk.fga],M.FF.command.alternate.str + " : ",[fa_right,fa_center])
                        cmp = cmp_cfg[?FFk.varr][5][0]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp_cfg[?FFk.varr][5][1] = bind_button_create([0,0,0,0],invert_array(frame[?FFk.bgc]),frame[?FFk.bga],invert_array(frame[?FFk.fgc]),frame[?FFk.fga],M.FF.command.alternate,true)
                        cmp = cmp_cfg[?FFk.varr][5][1]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp[?FFk.hvalign] = []
                        cmp[?FFk.hvalign][0] = fa_middle
                        cmp[?FFk.hvalign][1] = fa_center
                        cmp_cfg[?FFk.varr][5][2] = label_create([0,0,0,0],frame[?FFk.fgc],frame[?FFk.fga],M.FF.command.aim.str + " : ",[fa_right,fa_center])
                        cmp = cmp_cfg[?FFk.varr][5][2]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp_cfg[?FFk.varr][5][3] = bind_button_create([0,0,0,0],invert_array(frame[?FFk.bgc]),frame[?FFk.bga],invert_array(frame[?FFk.fgc]),frame[?FFk.fga],M.FF.command.aim,true)
                        cmp = cmp_cfg[?FFk.varr][5][3]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp[?FFk.hvalign] = []
                        cmp[?FFk.hvalign][0] = fa_middle
                        cmp[?FFk.hvalign][1] = fa_center
                        
                        // Next Row
                        cmp_cfg[?FFk.varr][6][0] = label_create([0,0,0,0],frame[?FFk.fgc],frame[?FFk.fga],M.FF.command.zoom_in.str + " : ",[fa_right,fa_center])
                        cmp = cmp_cfg[?FFk.varr][6][0]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp_cfg[?FFk.varr][6][1] = bind_button_create([0,0,0,0],invert_array(frame[?FFk.bgc]),frame[?FFk.bga],invert_array(frame[?FFk.fgc]),frame[?FFk.fga],M.FF.command.zoom_in,true)
                        cmp = cmp_cfg[?FFk.varr][6][1]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp[?FFk.hvalign] = []
                        cmp[?FFk.hvalign][0] = fa_middle
                        cmp[?FFk.hvalign][1] = fa_center
                        cmp_cfg[?FFk.varr][6][2] = label_create([0,0,0,0],frame[?FFk.fgc],frame[?FFk.fga],M.FF.command.zoom_out.str + " : ",[fa_right,fa_center])
                        cmp = cmp_cfg[?FFk.varr][6][2]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp_cfg[?FFk.varr][6][3] = bind_button_create([0,0,0,0],invert_array(frame[?FFk.bgc]),frame[?FFk.bga],invert_array(frame[?FFk.fgc]),frame[?FFk.fga],M.FF.command.zoom_out,true)
                        cmp = cmp_cfg[?FFk.varr][6][3]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp[?FFk.hvalign] = []
                        cmp[?FFk.hvalign][0] = fa_middle
                        cmp[?FFk.hvalign][1] = fa_center
                        
                        // Last Row
                        cmp_cfg[?FFk.varr][7][0] = label_create([0,0,0,0],frame[?FFk.fgc],frame[?FFk.fga],M.FF.command.next.str + " : ",[fa_right,fa_center])
                        cmp = cmp_cfg[?FFk.varr][7][0]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp_cfg[?FFk.varr][7][1] = bind_button_create([0,0,0,0],invert_array(frame[?FFk.bgc]),frame[?FFk.bga],invert_array(frame[?FFk.fgc]),frame[?FFk.fga],M.FF.command.next,true)
                        cmp = cmp_cfg[?FFk.varr][7][1]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp[?FFk.hvalign] = []
                        cmp[?FFk.hvalign][0] = fa_middle
                        cmp[?FFk.hvalign][1] = fa_center
                        cmp_cfg[?FFk.varr][7][2] = label_create([0,0,0,0],frame[?FFk.fgc],frame[?FFk.fga],M.FF.command.prev.str + " : ",[fa_right,fa_center])
                        cmp = cmp_cfg[?FFk.varr][7][2]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp_cfg[?FFk.varr][7][3] = bind_button_create([0,0,0,0],invert_array(frame[?FFk.bgc]),frame[?FFk.bga],invert_array(frame[?FFk.fgc]),frame[?FFk.fga],M.FF.command.prev,true)
                        cmp = cmp_cfg[?FFk.varr][7][3]
                        cmp[?FFk.w_pct] = .2
                        cmp[?FFk.h_pct] = .1
                        cmp[?FFk.hvalign] = []
                        cmp[?FFk.hvalign][0] = fa_middle
                        cmp[?FFk.hvalign][1] = fa_center
                        
                    #endregion
                    
                    // Other Settings Header
                    cmp_cfg[?FFk.varr][8][0] = horiz_space_create([0,0,0,0],frame[?FFk.fgc],frame[?FFk.bga],frame[?FFk.fgc],frame[?FFk.bga],frame[?FFk.w]*.8,M.FF.margin.STR_H*2,FF_spacer.bar_line,noone,true)
                    cmp = cmp_cfg[?FFk.varr][8][0]
                    cmp[?FFk.w_pct] = .975
                    cmp[?FFk.h_pct] = .1
                    cmp[?FFk.hvalign] = []
                    cmp[?FFk.hvalign][0] = fa_middle
                    cmp[?FFk.hvalign][1] = fa_center
                    cmp_cfg[?FFk.varr][8][0][?FFk.str] = "Other Control Settings"
                    
                    #region Crouch/Sprint Toggle Toggles
                        
                        // Single Row
                        cmp_cfg[?FFk.varr][9][0] = toggle_create([0,0,0,0],invert_array(frame[?FFk.bgc]),frame[?FFk.bga],invert_array(frame[?FFk.fgc]),frame[?FFk.fga],"Toggle Crouch",M.FF.command.crouch.toggle,[[FF_action.none],FF_action.tog_crouch],true)
                        cmp = cmp_cfg[?FFk.varr][9][0]
                        cmp[?FFk.w_pct] = .075
                        cmp[?FFk.h_pct] = .075
                        cmp[?FFk.hvalign] = []
                        cmp[?FFk.hvalign][0] = fa_middle
                        cmp[?FFk.hvalign][1] = fa_center
                        cmp_cfg[?FFk.varr][9][1] = toggle_create([0,0,0,0],invert_array(frame[?FFk.bgc]),frame[?FFk.bga],invert_array(frame[?FFk.fgc]),frame[?FFk.fga],"Toggle Sprint",M.FF.command.sprint.toggle,[[FF_action.none],FF_action.tog_sprint],true)
                        cmp = cmp_cfg[?FFk.varr][9][1]
                        cmp[?FFk.w_pct] = .075
                        cmp[?FFk.h_pct] = .075
                        cmp[?FFk.hvalign] = []
                        cmp[?FFk.hvalign][0] = fa_middle
                        cmp[?FFk.hvalign][1] = fa_center
                        
                    #endregion
                    
                #endregion
                
                // enable Title Buttons
                enable_title_buttons(frame)
                
            #endregion
            
            #region Console Tab
                
                // Frame; Dynamic; Tabbed
                var gfi = gui_frame_create(M.FF.runtime_width*.75,M.FF.runtime_height*.75,M.FF.UID.stg_console)
                
                // Shorten Accessors
                var frame = M.FF.frame.map_list[|gfi]
                var tab_cfg = frame[?FFk.tg_cfg]
                
                // Config Frame
                frame[?FFk.bg] = true
                frame[?FFk.fg] = true
                frame[?FFk.focus] = true
                frame[?FFk.mode] = FF_content.con
                frame[?FFk.drag] = true
                frame[?FFk.resize] = true
                frame[?FFk.title] = true
                frame[?FFk.scroll] = true
                frame[?FFk.output] = true
                frame[?FFk.input] = true
                frame[?FFk.tab_group] = true
                tab_cfg[?FFk.uid] = M.FF.UID.tg_stg
                tab_cfg[?FFk.hide_uid] = true
                
                // Enable Title Buttons
                enable_title_buttons(frame)
                
            #endregion
            
        #endregion
        
    #endregion
    
    #region Init Runtime Console
        
        // Frame; Static Top Middle
        var gfi = gui_frame_create(M.FF.runtime_width,M.FF.margin.RH2,M.FF.UID.rt_console)
        M.FF.runtime_console = M.FF.frame.map_list[|gfi]
        
        // Config Frame
        M.FF.runtime_console[?FFk.bg] = true
        M.FF.runtime_console[?FFk.fg] = true
        M.FF.runtime_console[?FFk.focus] = true
        M.FF.runtime_console[?FFk.focus_lock] = true
        M.FF.runtime_console[?FFk.mode] = FF_content.con
        M.FF.runtime_console[?FFk.resize] = true
        M.FF.runtime_console[?FFk.resize_w] = false
        M.FF.runtime_console[?FFk.autodrag] = true
        M.FF.runtime_console[?FFk.scroll] = true
        M.FF.runtime_console[?FFk.output] = true
        M.FF.runtime_console[?FFk.input] = true
        M.FF.runtime_console[?FFk.out_cfg] = ds_map_create()
        M.FF.runtime_console[?FFk.out_cfg][?FFk.arr] = [""]
        M.FF.runtime_console[?FFk.hvalign][0] = fa_middle
        M.FF.runtime_console[?FFk.hvalign][1] = fa_top
        M.FF.runtime_console[?FFk.marginy] = 0
        M.FF.runtime_console[?FFk.marginx] = 0
        
    #endregion
    
    // Finally (To update the global tab_group_active variable which is a map of arrays)
    update_tabs()
	
}