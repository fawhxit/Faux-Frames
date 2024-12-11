function gui_frame_create() {

	#region Init
    
	    // Args
	    var w = argument0
	    var h = argument1
	    var uid = argument2

	    if(M.FF.debug) trace("Begin Create Frame: " + uid)
    
	    // Delete old frame w/ matching UID
	    var gfi = get_frame(uid)
	    if(gfi != noone) ds_list_delete(M.FF.frame.map_list,gfi)
    
	    // Add to M.FF.frame.map_list, get element to init
	    var i = ds_list_size(M.FF.frame.map_list)
	    M.FF.frame.map_list[|i] = ds_map_create()
	    var e = M.FF.frame.map_list[|i]
    
	    // Add Args
	    e[?FFk.w] = w
	    e[?FFk.h] = h
	    e[?FFk.uid] = uid

	#endregion

	#region Default Flags
    
	    e[?FFk.bg] = false
	    e[?FFk.fg] = false
	    e[?FFk.active] = false
	    e[?FFk.drag] = false
	    e[?FFk.autodrag] = false
	    e[?FFk.focus] = false
	    e[?FFk.scroll] = false
	    e[?FFk.resize] = false
	    e[?FFk.resize_w] = true      // Resize_w and h are true 
	    e[?FFk.resize_h] = true      // Because they depend on resize anyway
	    e[?FFk.autosize] = false
	    e[?FFk.title] = false
	    e[?FFk.xbtn] = false
	    e[?FFk.pbtn] = false
	    e[?FFk.mbtn] = false
	    e[?FFk.output] = false
	    e[?FFk.input] = false
	    e[?FFk.drag_override] = false
	    e[?FFk.tab_group] = false
	    e[?FFk.owner] = noone     // Player Specific Frame

	#endregion

	#region Default Color/Alpha
    
	    e[?FFk.bga] = 1
	    e[?FFk.bgc] = [M.FF.color.black.rgb,M.FF.color.black.rgb,M.FF.color.gray.darker.rgb,M.FF.color.gray.darker.rgb]
	    e[?FFk.fga] = 1
	    e[?FFk.fgc] = [M.FF.color.white.rgb,M.FF.color.white.rgb,M.FF.color.gray.lighter.rgb,M.FF.color.gray.lighter.rgb]
    
	#endregion

	#region Init XX/YY/W/H // Updatees
    
	    // Frame Auto Align
	    e[?FFk.hvalign] = [fa_middle,fa_center]
    
	    var w2 = e[?FFk.w]/2
	    var h2 = e[?FFk.h]/2
    
	    // Use: when we want to refrence frame from center origin
	    e[?FFk.xy] = []
	    e[?FFk.xy][0] = M.FF.margin.RW2 - w2                              // Updatee
	    e[?FFk.xy][1] = M.FF.margin.RH2 - h2                              // Updatee
	    e[?FFk.xy][2] = e[?FFk.xy][0] + e[?FFk.w]                     // Updatee
	    e[?FFk.xy][3] = e[?FFk.xy][1] + e[?FFk.h]                     // Updatee
	    e[?FFk.wo] = e[?FFk.w]                                      // Updatee
	    e[?FFk.ho] = e[?FFk.h]                                      // Updatee
	    e[?FFk.xx] = lerp(e[?FFk.xy][0],e[?FFk.xy][2],0.5)            // Updatee
	    e[?FFk.yy] = lerp(e[?FFk.xy][1],e[?FFk.xy][3],0.5)            // Updatee
	    e[?FFk.marginx] = M.FF.margin.BG
	    e[?FFk.marginy] = M.FF.margin.BG
	    e[?FFk.content_ho] = 0

	#endregion

	#region Label/Tab Defaults;
    
	    e[?FFk.ttl_cfg] = ds_map_create()
	    var ttl = e[?FFk.ttl_cfg]
	    ttl[?FFk.uid] = string(uid)
	    ttl[?FFk.xy] = []
	    ttl[?FFk.xy][0] = (e[?FFk.xy][0])                           // Updatee
	    ttl[?FFk.xy][1] = (e[?FFk.xy][1])                           // Updatee
	    ttl[?FFk.xy][2] = (e[?FFk.xy][2])                           // Updatee
	    ttl[?FFk.xy][3] = ((e[?FFk.xy][1])+(M.FF.margin.STR_H*1.5))           // Updatee
	    ttl[?FFk.w] = ttl[?FFk.xy][2]-ttl[?FFk.xy][0]                 // Updatee
	    ttl[?FFk.h] = ttl[?FFk.xy][3]-ttl[?FFk.xy][1]                 // Updatee
	    ttl[?FFk.xx] = lerp(ttl[?FFk.xy][0],ttl[?FFk.xy][2],0.5)      // Updatee
	    ttl[?FFk.yy] = lerp(ttl[?FFk.xy][1],ttl[?FFk.xy][3],0.5)      // Updatee
	    ttl[?FFk.w_mn] = string_width(ttl[?FFk.uid])                // label_active min width (for minimizing frame)
	    ttl[?FFk.bga] = 1
	    ttl[?FFk.bgc] = [c_dkgray,c_dkgray,c_black,c_black]
	    ttl[?FFk.fga] = 1
	    ttl[?FFk.fgc] = [c_ltgray,c_ltgray,c_white,c_white]
	    ttl[?FFk.bgc_o] = []
	    ttl[?FFk.bgc_o] = array_dupe(ttl[?FFk.bgc_o],ttl[?FFk.bgc])
	    ttl[?FFk.fgc_o] = []
	    ttl[?FFk.fgc_o] = array_dupe(ttl[?FFk.fgc_o],ttl[?FFk.fgc])
	    ttl[?FFk.str_cfg] = ds_map_create()
	    ttl[?FFk.str_cfg][?FFk.bga] = ttl[?FFk.bga]
	    ttl[?FFk.str_cfg][?FFk.bgc] = ttl[?FFk.bgc]
	    ttl[?FFk.str_cfg][?FFk.fga] = ttl[?FFk.fga]
	    ttl[?FFk.str_cfg][?FFk.fgc] = ttl[?FFk.fgc]
	    ttl[?FFk.pbtn] = false
	    ttl[?FFk.mbtn] = false
	    e[?FFk.tg_cfg] = ds_map_create()
	    var tg = e[?FFk.tg_cfg]
	    tg[?FFk.uid] = noone
	    tg[?FFk.xy] = []
	    tg[?FFk.xy][0] = (e[?FFk.xy][0])                            // Updatee
	    tg[?FFk.xy][1] = (ttl[?FFk.xy][3])                          // Updatee
	    tg[?FFk.xy][2] = (e[?FFk.xy][2])                            // Updatee
	    tg[?FFk.xy][3] = ((tg[?FFk.xy][1])+(M.FF.margin.STR_H*1.5))           // Updatee
	    tg[?FFk.w] = tg[?FFk.xy][2]-tg[?FFk.xy][0]                    // Updatee
	    tg[?FFk.h] = tg[?FFk.xy][3]-tg[?FFk.xy][1]                    // Updatee
	    tg[?FFk.xx] = lerp(tg[?FFk.xy][0],tg[?FFk.xy][2],0.5)         // Updatee
	    tg[?FFk.yy] = lerp(tg[?FFk.xy][0],tg[?FFk.xy][2],0.5)         // Updatee

	#endregion

	#region Content Inits
    
	    // Content Mode Flag
	    e[?FFk.mode] = FF_content.none
    
	    #region Console Defaults
        
	        e[?FFk.con_cfg] = ds_map_create()
        
	        // Console
	        var con = e[?FFk.con_cfg]
	        con[?FFk.fga] = e[?FFk.fga]
	        con[?FFk.fgc] = e[?FFk.fgc]
	        con[?FFk.bga] = e[?FFk.bga]
	        con[?FFk.bgc] = e[?FFk.bgc]
	        con[?FFk.sep] = M.FF.margin.STR_H
	        con[?FFk.marginx] = M.FF.margin.SM
	        con[?FFk.marginy] = M.FF.margin.SM
	        con[?FFk.xy] = []
	        con[?FFk.xy][0] = e[?FFk.xy][0] + con[?FFk.marginx]       // Updatee
	        con[?FFk.xy][1] = e[?FFk.xy][1] + con[?FFk.marginy]       // Updatee
	        if(e[?FFk.title]) con[?FFk.xy][1] += ttl[?FFk.h]          // Updatee
	        if(e[?FFk.tab_group]) con[?FFk.xy][1] += tg[?FFk.h]       // Updatee
	        con[?FFk.xy][2] = e[?FFk.xy][2] - con[?FFk.marginx]       // Updatee
	        con[?FFk.xy][3] = e[?FFk.xy][3] - con[?FFk.marginy]       // Updatee
	        con[?FFk.w] = con[?FFk.xy][2] - con[?FFk.xy][0]           // Updatee
	        con[?FFk.h] = con[?FFk.xy][3] - con[?FFk.xy][1]           // Updatee
	        con[?FFk.xx] = lerp(con[?FFk.xy][0],con[?FFk.xy][2],0.5)  // Updatee
	        con[?FFk.yy] = lerp(con[?FFk.xy][1],con[?FFk.xy][3],0.5)  // Updatee
	        con[?FFk.offx] = 0                                    // Updatee
	        con[?FFk.offy] = 0                                    // Updatee
	        con[?FFk.hvalign] = []
	        con[?FFk.hvalign][0] = fa_left
	        con[?FFk.hvalign][1] = fa_top
	        con[?FFk.out_cfg] = noone
	        con[?FFk.inp_cfg] = ds_map_create()
        
	        // Input
	        var npt = con[?FFk.inp_cfg]
	        npt[?FFk.arr] = array_create(1,"")
	        npt[?FFk.arri] = 0
	        npt[?FFk.xy] = array_create(4,0)
	        npt[?FFk.xy][0] = e[?FFk.xy][0]
	        npt[?FFk.xy][1] = e[?FFk.xy][3]-(M.FF.margin.STR_H+(M.FF.margin.SM*2))
	        npt[?FFk.xy][2] = e[?FFk.xy][2]
	        npt[?FFk.xy][3] = e[?FFk.xy][3]
	        npt[?FFk.str] = ""
	        npt[?FFk.time] = true
	        npt[?FFk.carot_cfg] = ds_map_create()
        
	        // Carot
	        var crt = npt[?FFk.carot_cfg]
	        crt[?FFk.xy] = array_create(4,0)
	        crt[?FFk.xy][0] = (npt[?FFk.xy][0]+M.FF.margin.SM)+string_width(npt[?FFk.str])
	        crt[?FFk.xy][1] = npt[?FFk.xy][1]+M.FF.margin.SM
	        crt[?FFk.xy][2] = (npt[?FFk.xy][0]+(M.FF.margin.SM+M.FF.margin.STR_H))+string_width(npt[?FFk.str])
	        crt[?FFk.xy][3] = npt[?FFk.xy][3]-M.FF.margin.SM
    
	    #endregion
    
	    #region Components
        
	        e[?FFk.cmpnt_cfg] = ds_map_create()
        
	        var cmpn = e[?FFk.cmpnt_cfg]
	        cmpn[?FFk.varr] = [[]]
	        cmpn[?FFk.marginx] = M.FF.margin.SM
	        cmpn[?FFk.marginy] = M.FF.margin.BG
	        cmpn[?FFk.hvalign] = [fa_middle,fa_center]
        
	    #endregion

	#endregion

	if(M.FF.debug) trace("End Create Frame: " + uid + " index @ " + i)

	// Return index of new frame map
	return i

}

function get_frame() {

	// Args
	var uid = argument0

	// Find Frame by UID; Return index in list
	for(var i = 0; i < ds_list_size(M.FF.frame.map_list); i++) {
    
	    var e = M.FF.frame.map_list[|i]
    
	    if(e[?FFk.uid] == uid) return i
    
	}

	// If not found return noone
	return noone

}

function draw_gui_frames() {

	if(M.FF.debug) trace("Begin Draw Frames 1")

	// Ensure M.FF.frame.focus is Top
	if(M.FF.frame.focus != noone) set_top_frame(M.FF.frame.focus)
	var GFIF_nxt = M.FF.frame.focus

	for(var i = 0; i < ds_list_size(M.FF.frame.map_list); i++) {
    
	    if(M.FF.debug_frames) trace("Begin " + M.FF.frame.map_list[|i][?FFk.uid])
    
	    // Init
	    var e = M.FF.frame.map_list[|i]
    
	    // Skip Inactive Frames
	    if(!e[?FFk.active]) continue
    
	    // If a focus lock frame was closed and M.FF.frame.focus is noone,
	    // but there is another focus locked frame
	    // switch M.FF.frame.focus to top most focus lock
	    if(M.FF.frame.focus == noone and e[?FFk.focus_lock])
	        GFIF_nxt = i
    
	    #region Init CFG Vars
        
	        var ttl = e[?FFk.ttl_cfg]         // Title
	        var tg = e[?FFk.tg_cfg]           // Tag Group
	        var con = e[?FFk.con_cfg]         // Console
	        var out = con[?FFk.out_cfg]         // Output
	        var npt = con[?FFk.inp_cfg]        // Input
	        var crt = npt[?FFk.carot_cfg]     // Carot
	        var cmpn = e[?FFk.cmpnt_cfg]      // Component
        
	    #endregion
    
	    #region Mouse Control Logic; First so changes can be applied before drawing
        
	        if(mouse_x-M.FF.surface_xy[0] > e[?FFk.xy][0]-M.FF.margin.SM and mouse_x-M.FF.surface_xy[0] < e[?FFk.xy][2]+M.FF.margin.SM
	            and mouse_y-M.FF.surface_xy[1] > e[?FFk.xy][1]-M.FF.margin.SM and mouse_y-M.FF.surface_xy[1] < e[?FFk.xy][3]+M.FF.margin.SM) {
            
	            #region Set Focus
                
	                if((e[?FFk.focus] or e[?FFk.focus_lock]) and (M.FF.MBLP)) {
                    
	                    if(M.FF.frame.focus != noone) {
                        
	                        if(!M.FF.frame.map_list[|M.FF.frame.focus][?FFk.focus_lock])
	                            GFIF_nxt = i
                        
	                    } else GFIF_nxt = i
                    
	                }
                
	            #endregion
            
	            #region Focused
                
	                if(M.FF.frame.focus == i or !e[?FFk.focus]) {
                    
	                    #region Drag and Resize
                        
	                        // Ensure Minimum Width if title
	                        if(e[?FFk.title]) e[?FFk.w] = clamp(e[?FFk.w],ttl[?FFk.w_mn],M.FF.runtime_width)
                        
	                        // drag_override is true if mouse is inside a button in the frame
	                        // So that way if user is clicking a button it doesn'true drag_active/resize_active the frame
	                        if(M.FF.MBL and !ttl[?FFk.pbtn] and !e[?FFk.drag_override]) {
                            
	                            if(e[?FFk.resize] and !ttl[?FFk.mbtn] and M.FF.key_control) {
                                
	                                var wo = e[?FFk.w]
	                                var ho = e[?FFk.h]
                                
	                                // Ensure min frame width/height; if label_active, width is min label_active size + btns
	                                // Otherwise min is just 1/8th window size
	                                if(e[?FFk.title] and e[?FFk.resize_w]) e[?FFk.w] = clamp(e[?FFk.w]+M.FF.mouse_x_delta,ttl[?FFk.w_mn],M.FF.runtime_width)
	                                else if(e[?FFk.resize_w]) e[?FFk.w] = clamp(e[?FFk.w]+M.FF.mouse_x_delta,M.FF.margin.RW8,M.FF.runtime_width)
	                                if(e[?FFk.resize_h]) e[?FFk.h] = clamp(e[?FFk.h]+M.FF.mouse_y_delta,M.FF.margin.RH8,M.FF.runtime_height)
                                
	                                if(e[?FFk.w] != wo)
	                                    e[?FFk.xy][2] = e[?FFk.xy][0] + e[?FFk.w]     // Updatee
                                    
	                                if(e[?FFk.h] != ho)
	                                    e[?FFk.xy][3] = e[?FFk.xy][1] + e[?FFk.h]     // Updatee
                                
	                                e[?FFk.wo] = wo                   // Updatee
	                                e[?FFk.ho] = ho                   // Updatee
                                
	                            } else if(e[?FFk.drag]) {
                                
	                                // Add Deltas to XY
	                                e[?FFk.xy][0] += M.FF.mouse_x_delta              // Updatee
	                                e[?FFk.xy][1] += M.FF.mouse_y_delta              // Updatee
	                                e[?FFk.xy][2] += M.FF.mouse_x_delta              // Updatee
	                                e[?FFk.xy][3] += M.FF.mouse_y_delta              // Updatee
                                
	                            }
                            
	                        }
                        
	                    #endregion
                    
	                    #region Scroll
                        
	                        if(e[?FFk.scroll]) {
                            
	                            if(M.FF.MWU) {
                                
	                                // Scroll wheel up; +Shift for faster
	                                if(M.FF.key_shift) con[?FFk.offy] += M.FF.main.scroll_spd*2
	                                else con[?FFk.offy] += M.FF.main.scroll_spd
                                
	                            } else if(M.FF.MWD) {
                                
	                                // Scroll wheel down; +Shift for faster
	                                if(M.FF.key_shift) con[?FFk.offy] -= M.FF.main.scroll_spd*2
	                                else con[?FFk.offy] -= M.FF.main.scroll_spd
                                
	                            }
                            
	                        }
                        
	                    #endregion
                    
	                }
                
	            #endregion
            
	        } else if(M.FF.frame.focus == i and M.FF.MBLR and !M.FF.frame.map_list[|M.FF.frame.focus][?FFk.focus_lock]) GFIF_nxt = noone // Reset focus_active if clicked off
        
	    #endregion
    
	    #region General Inits/ Updatees
        
	        // Commonly Used
	        var w2 = round(e[?FFk.w]/2)
	        var h2 = round(e[?FFk.h]/2)
	        var ho2 = round(e[?FFk.content_ho]/2)
        
	        // XX/YY/W/H
	        // X
	        if(!e[?FFk.resize_w]) e[?FFk.w] = M.FF.runtime_width - (e[?FFk.marginx]*2)
	        if(!e[?FFk.drag] and e[?FFk.autodrag] and (e[?FFk.hvalign][0] == fa_middle
	            or e[?FFk.hvalign][0] == fa_center)) e[?FFk.xy][0] = M.FF.margin.RW2-w2                 // Updatee
	        else if(!e[?FFk.drag] and e[?FFk.autodrag]
	            and e[?FFk.hvalign][0] == fa_left) e[?FFk.xy][0] = e[?FFk.marginx]                // Updatee
	        else if(!e[?FFk.drag] and e[?FFk.autodrag]
	            and e[?FFk.hvalign][0] == fa_right) e[?FFk.xy][0] = M.FF.runtime_width-(e[?FFk.w]+e[?FFk.marginx])  // Updatee
        
	        // Y
	        if(!e[?FFk.resize_h]) e[?FFk.h] = M.FF.runtime_height - (e[?FFk.marginy]*2)
	        if(!e[?FFk.drag] and e[?FFk.autodrag] and (e[?FFk.hvalign][1] == fa_center
	            or e[?FFk.hvalign][1] == fa_middle) and !(!e[?FFk.resize] and e[?FFk.autosize]))
	            e[?FFk.xy][1] = M.FF.margin.RH2-h2                                                        // Updatee
	        else if(!e[?FFk.drag] and e[?FFk.autodrag] and (e[?FFk.hvalign][1] == fa_center
	            or e[?FFk.hvalign][1] == fa_middle) and (!e[?FFk.resize] and e[?FFk.autosize]))
	            e[?FFk.xy][1] = M.FF.margin.RH2-ho2                                                       // Updatee
	        else if(!e[?FFk.drag] and e[?FFk.autodrag]
	            and e[?FFk.hvalign][1] == fa_top) e[?FFk.xy][1] = e[?FFk.marginy]                     // Updatee
	        else if(!e[?FFk.drag] and e[?FFk.autodrag]
	            and e[?FFk.hvalign][1] == fa_bottom) {
                
	                e[?FFk.xy][1] = M.FF.runtime_height-(e[?FFk.h]+e[?FFk.marginy])    // Updatee
	                e[?FFk.xy][1] += e[?FFk.h]-e[?FFk.content_ho]     // Incase Frame is additionally resized from components
                
	        }
        
	        e[?FFk.xy][2] = e[?FFk.xy][0] + e[?FFk.w]                 // Updatee
	        e[?FFk.xy][3] = e[?FFk.xy][1] + e[?FFk.h]                 // Updatee
	        e[?FFk.xx] = lerp(e[?FFk.xy][0],e[?FFk.xy][2],0.5)        // Updatee
	        e[?FFk.yy] = lerp(e[?FFk.xy][1],e[?FFk.xy][3],0.5)        // Updatee
        
	        #region Console Updates
            
	            con[?FFk.xy][0] = e[?FFk.xy][0] + con[?FFk.marginx]       // Updatee
	            con[?FFk.xy][1] = e[?FFk.xy][1] + con[?FFk.marginy]       // Updatee
	            if(e[?FFk.title]) con[?FFk.xy][1] += ttl[?FFk.h]          // Updatee
	            if(e[?FFk.tab_group]) con[?FFk.xy][1] += tg[?FFk.h]       // Updatee
	            con[?FFk.xy][2] = e[?FFk.xy][2] - con[?FFk.marginx]       // Updatee
	            con[?FFk.xy][3] = e[?FFk.xy][3] - con[?FFk.marginy]       // Updatee
	            con[?FFk.w] = con[?FFk.xy][2] - con[?FFk.xy][0]           // Updatee
	            con[?FFk.h] = con[?FFk.xy][3] - con[?FFk.xy][1]           // Updatee
	            con[?FFk.xx] = lerp(con[?FFk.xy][0],con[?FFk.xy][2],0.5)  // Updatee
	            con[?FFk.yy] = lerp(con[?FFk.xy][1],con[?FFk.xy][3],0.5)  // Updatee
            
	        #endregion
        
	        #region Update Label&Tabs Coordinates; Also used by content adjustments
            
	            // Title Updatees
	            ttl[?FFk.xy][0] = (e[?FFk.xy][0])                           // Updatee
	            ttl[?FFk.xy][1] = (e[?FFk.xy][1])                           // Updatee
	            ttl[?FFk.xy][2] = (e[?FFk.xy][2])                           // Updatee
	            ttl[?FFk.xy][3] = ((e[?FFk.xy][1])+(M.FF.margin.STR_H*1.5))           // Updatee
	            ttl[?FFk.w] = ttl[?FFk.xy][2]-ttl[?FFk.xy][0]                 // Updatee
	            ttl[?FFk.h] = ttl[?FFk.xy][3]-ttl[?FFk.xy][1]                 // Updatee
	            ttl[?FFk.xx] = lerp(ttl[?FFk.xy][0],ttl[?FFk.xy][2],0.5)      // Updatee
	            ttl[?FFk.yy] = lerp(ttl[?FFk.xy][1],ttl[?FFk.xy][3],0.5)      // Updatee
            
	            // Tab Updatees
	            tg[?FFk.xy][0] = (e[?FFk.xy][0])                            // Updatee
	            tg[?FFk.xy][1] = (ttl[?FFk.xy][3])                          // Updatee
	            tg[?FFk.xy][2] = (e[?FFk.xy][2])                            // Updatee
	            tg[?FFk.xy][3] = ((tg[?FFk.xy][1])+(M.FF.margin.STR_H*1.5))           // Updatee
	            tg[?FFk.w] = tg[?FFk.xy][2]-tg[?FFk.xy][0]                    // Updatee
	            tg[?FFk.h] = tg[?FFk.xy][3]-tg[?FFk.xy][1]                    // Updatee
	            tg[?FFk.xx] = lerp(tg[?FFk.xy][0],tg[?FFk.xy][2],0.5)         // Updatee
	            tg[?FFk.yy] = lerp(tg[?FFk.xy][0],tg[?FFk.xy][2],0.5)         // Updatee
            
	            // Used later in label_active drawing incase tab_group_active width is greater than label_active
	            var t_min_w = 0
            
	        #endregion
        
	        #region Additional Console Inits
            
	            if(e[?FFk.mode] == FF_content.con) {
                
	                // Update Input Coordinates;
	                npt[?FFk.xy][0] = e[?FFk.xy][0]
	                npt[?FFk.xy][1] = e[?FFk.xy][3]-(M.FF.margin.STR_H*1.5)
	                npt[?FFk.xy][2] = e[?FFk.xy][2]
	                npt[?FFk.xy][3] = e[?FFk.xy][3]
                
	                // Carot
	                crt[?FFk.xy][0] = (npt[?FFk.xy][0]+(M.FF.margin.SM+2))+string_width(npt[?FFk.str])
	                crt[?FFk.xy][1] = npt[?FFk.xy][1]+M.FF.margin.SM
	                crt[?FFk.xy][2] = (npt[?FFk.xy][0]+(M.FF.margin.STR_H))+string_width(npt[?FFk.str])
	                crt[?FFk.xy][3] = npt[?FFk.xy][3]-M.FF.margin.SM
	                var incy = npt[?FFk.xy][1]+((npt[?FFk.xy][3]-npt[?FFk.xy][1])/2)
                
	            }
            
	        #endregion
        
	        // Init General Content Positioning Vars
	        var content_h = 0
	        if(e[?FFk.title]) content_h += ttl[?FFk.xy][3]-ttl[?FFk.xy][1]
	        if(e[?FFk.tab_group]) content_h += tg[?FFk.xy][3]-tg[?FFk.xy][1]
        
	    #endregion
    
	    #region BG; Drawn first so it is on bottom
        
	        if(e[?FFk.bg]) { // Draw unless bg disabled
            
	            // Init y1 (if title or tabs are active)
	            var y1 = e[?FFk.xy][1]
	            if(e[?FFk.title]) y1 = ttl[?FFk.xy][3]
	            if(e[?FFk.tab_group]) y1 = tg[?FFk.xy][3]
            
	            // Init y2 (if autosizing use old content_h)
	            var y2 = e[?FFk.xy][3]
	            if(!e[?FFk.resize] and e[?FFk.autosize]) y2 = e[?FFk.xy][1] + e[?FFk.content_ho]
            
	            // Draw Background
	            draw_set_alpha(e[?FFk.bga])
	            draw_rectangle_color(e[?FFk.xy][0],y1,e[?FFk.xy][2],y2,
	                e[?FFk.bgc][0],e[?FFk.bgc][1],e[?FFk.bgc][2],e[?FFk.bgc][3],false)
            
	            // If title or tabs draw black background under them (to prevent transparency)
	            if(e[?FFk.title] or e[?FFk.tab_group])
	                draw_rectangle_color(e[?FFk.xy][0],e[?FFk.xy][1],e[?FFk.xy][2],y1,
	                    M.FF.color.black.rgb,M.FF.color.black.rgb,M.FF.color.black.rgb,M.FF.color.black.rgb,false)
            
	        }
        
	    #endregion
		
	    switch(e[?FFk.mode]) { 
        
	        case FF_content.con: {
            
	            if(M.FF.debug_frames) trace("Begin Content (Console)")
            
	            #region Console Mode
                
	                #region String Output; // Skip if mbtn_minimized so offset y isn'true changed
                
	                    if(e[?FFk.output] and !ttl[?FFk.mbtn]) {
                        
	                        // Init
	                        var a
	                        if(M.FF.frame.focus == i or !e[?FFk.focus]) a = con[?FFk.fga]
	                        else a = con[?FFk.fga]/2
	                        draw_set_halign(con[?FFk.hvalign][0])
	                        draw_set_valign(con[?FFk.hvalign][1])
                        
	                        var arri_h1 = 0 // to hold the first string's height
	                        if(out == noone) {
                            
	                            #region Runtime Console
                            
	                                for(var arri = 0; arri < array_length_1d(M.FF.runtime_console[?FFk.out_cfg][?FFk.arr]); arri++) {
                                    
	                                    //  get height of current string
	                                    var arri_h = string_height_ext(M.FF.runtime_console[?FFk.out_cfg][?FFk.arr][arri],con[?FFk.sep],con[?FFk.w])
	                                    if(arri == 0) arri_h1 = arri_h // Save the height of first string in array for use later in clamping yoffset
                                    
	                                    // Draw a string from the array while it would still be inside the frame.
	                                    if(e[?FFk.xy][1]+con[?FFk.offy]+content_h > (e[?FFk.xy][1])
	                                        and e[?FFk.xy][1]+con[?FFk.offy]+content_h+arri_h < (e[?FFk.xy][3]))
	                                        draw_text_ext_color(con[?FFk.xy][0]+con[?FFk.offx],(e[?FFk.xy][1]+con[?FFk.offy])+content_h,
	                                            M.FF.runtime_console[?FFk.out_cfg][?FFk.arr][arri],con[?FFk.sep],con[?FFk.w],con[?FFk.fgc][0],
	                                            con[?FFk.fgc][1],con[?FFk.fgc][2],con[?FFk.fgc][3],a)
                                    
	                                    // Add last string height to the total height
	                                    content_h += arri_h
                                    
	                                    // Scroll Clamping; using the strings total height, frame height, first and last string heights..
	                                    // We can keep the beginning of the text and end of the text with in the frame while scrolling
	                                    if(arri == array_length_1d(M.FF.runtime_console[?FFk.out_cfg][?FFk.arr])-1 and e[?FFk.scroll])
	                                        con[?FFk.offy] = clamp(con[?FFk.offy],-(content_h-(arri_h+M.FF.margin.STR_H)),e[?FFk.h]-(arri_h1+M.FF.margin.STR_H))
                                    
	                                }
                                
	                            #endregion
                            
	                        } else {
                            
	                            #region Instance Console
                                
	                                for(var arri = 0; arri < array_length_1d(out[?FFk.arr]); arri++) {
                                    
	                                    //  get height of current string
	                                    var arri_h = string_height_ext(out[?FFk.arr][arri],con[?FFk.sep],con[?FFk.w])
	                                    if(arri = 0) arri_h1 = arri_h // Save the height of first string in array for use later in clamping yoffset
                                    
	                                    // Draw a string from the array while it would still be inside the frame.
	                                    if(e[?FFk.xy][1]+con[?FFk.offy]+content_h > (e[?FFk.xy][1])
	                                        and e[?FFk.xy][1]+con[?FFk.offy]+content_h+arri_h < (e[?FFk.xy][3]))
	                                        draw_text_ext_color(con[?FFk.xy][0]+con[?FFk.offx],(e[?FFk.xy][1]+con[?FFk.offy])+content_h,
	                                            out[?FFk.arr][arri],con[?FFk.sep],con[?FFk.w],con[?FFk.fgc][0],
	                                            con[?FFk.fgc][1],con[?FFk.fgc][2],con[?FFk.fgc][3],a)
                                    
	                                    // Add last string height to the total height
	                                    content_h += arri_h
                                    
	                                    // Scroll Clamping; using the strings total height, frame height, first and last string heights..
	                                    // We can keep the beginning of the text and end of the text with in the frame while scrolling
	                                    if(arri == array_length_1d(out[?FFk.arr])-1 and e[?FFk.scroll])
	                                        con[?FFk.offy] = clamp(con[?FFk.offy],-(content_h-(arri_h+M.FF.margin.STR_H)),e[?FFk.h]-(arri_h1+M.FF.margin.STR_H))
                                    
	                                }
                                
	                            #endregion
                            
	                        }
                        
	                    }
                    
	                #endregion
                
	                #region String inp_str
                    
	                    if(e[?FFk.input] and !ttl[?FFk.mbtn]) {
                        
	                        // BG
	                        draw_set_alpha(e[?FFk.bga])
	                        draw_rectangle_color(npt[?FFk.xy][0],npt[?FFk.xy][1],npt[?FFk.xy][2],npt[?FFk.xy][3],
	                            con[?FFk.bgc][0],con[?FFk.bgc][1],con[?FFk.bgc][2],con[?FFk.bgc][3],false)
                        
	                        // FG
	                        if(M.FF.frame.focus == i or !e[?FFk.focus]) draw_set_alpha(con[?FFk.fga])
	                        else draw_set_alpha(con[?FFk.fga]/2)
	                        draw_line_color(npt[?FFk.xy][0],npt[?FFk.xy][1],npt[?FFk.xy][2],npt[?FFk.xy][1],
	                            con[?FFk.fgc][0],con[?FFk.fgc][2])
                        
	                        #region Input Logic
                            
	                            // Trim whitespace
	                            keyboard_string = string_trim2(keyboard_string,true,true,false)
                            
	                            // Trim inp_str if bigger than frame
	                            while (crt[?FFk.xy][2] >= npt[?FFk.xy][2]-M.FF.margin.SM) {
                                
	                                // Trim from Input and update inp_str again
	                                keyboard_string = string_copy(keyboard_string,0,string_length(keyboard_string)-1)
	                                npt[?FFk.str] = keyboard_string
                                
	                                // Reupdate Carot POS
	                                crt[?FFk.xy][0] = (npt[?FFk.xy][0]+(M.FF.margin.SM+2))+string_width(npt[?FFk.str])
	                                crt[?FFk.xy][2] = (npt[?FFk.xy][0]+(M.FF.margin.STR_H))+string_width(npt[?FFk.str])
                                
	                            }
                            
	                            // Update Input
	                            if(M.FF.frame.focus == i) npt[?FFk.str] = keyboard_string
                            
	                            // Enter Input
	                            if(M.FF.key_enter_p and npt[?FFk.str] != "" and M.FF.frame.focus == i) {
                                
	                                var outi = 0
	                                if(out == noone) outi = array_length_1d(M.FF.runtime_console[?FFk.out_cfg][?FFk.arr])
	                                else outi = array_length_1d(out[?FFk.arr])
	                                npt[?FFk.arr][npt[?FFk.arri]] = string_trim2(npt[?FFk.str],true,true,true)
                                
	                                var str = ""
	                                if(npt[?FFk.time]) {
	                                    var hrs = floor(M.FF.runtime_minute/60)
	                                    var mns = M.FF.runtime_minute%60
	                                    var scs = M.FF.runtime_second%60
	                                    if(hrs < 10) str += "[0"+string(hrs)+":"
	                                    else str += "["+string(hrs)+":"
	                                    if(mns < 10) str += "0"
	                                    str += string(mns)+":"
	                                    if(scs < 10) str += "0"
	                                    str += string(scs)+"] "
	                                }
	                                str += " > " + string_trim2(npt[?FFk.arr][npt[?FFk.arri]],true,true,true)
                                
	                                if(out == noone) {
                                    
	                                    if(M.FF.runtime_console[?FFk.out_cfg][?FFk.arr][outi-1] == "") M.FF.runtime_console[?FFk.out_cfg][?FFk.arr][outi-1] = str
	                                    else M.FF.runtime_console[?FFk.out_cfg][?FFk.arr][outi] = str
                                    
	                                } else {
                                    
	                                    if(out[?FFk.arr][outi-1] == "") out[?FFk.arr][outi-1] = str
	                                    else out[?FFk.arr][outi] = str
                                    
	                                }
                                
	                                npt[?FFk.arri] += 1
	                                keyboard_string = ""
                                
	                                #region Y Offset reset
                                    
	                                    if((e[?FFk.xy][1]+con[?FFk.offy])+content_h > npt[?FFk.xy][1]-M.FF.margin.STR_H*1.5) {
	                                        // Input Field (Bottom)
	                                        con[?FFk.offy] = ((npt[?FFk.xy][1]-e[?FFk.xy][1])-(M.FF.margin.STR_H*1.5))-content_h
	                                    } else if((e[?FFk.tab_group] and (e[?FFk.xy][1]+con[?FFk.offy])+content_h < tg[?FFk.xy][3])) {
	                                        // Tabs (Top)
	                                        con[?FFk.offy] = ((tg[?FFk.xy][3]-tg[?FFk.xy][1])+(M.FF.margin.STR_H*1.5))-content_h
	                                    } else if((e[?FFk.title] and (e[?FFk.xy][1]+con[?FFk.offy])+content_h < ttl[?FFk.xy][3])) {
	                                        // Title (Top)
	                                        con[?FFk.offy] = ((ttl[?FFk.xy][3]-ttl[?FFk.xy][1])+(M.FF.margin.STR_H*1.5))-content_h
	                                    } else if((e[?FFk.xy][1]+con[?FFk.offy])+content_h < e[?FFk.xy][1]) {
	                                        // None (Top)
	                                        con[?FFk.offy] = (e[?FFk.xy][1]+(M.FF.margin.STR_H*1.5))-content_h
	                                    }
                                    
	                                #endregion
                                
	                            }
                            
	                        #endregion
                        
	                        // Carot
	                        if((M.FF.frame.focus == i or !e[?FFk.focus]) and M.FF.runtime_frame <= room_speed/2) {
	                            draw_set_alpha(e[?FFk.fga])
	                            draw_rectangle_color(crt[?FFk.xy][0],crt[?FFk.xy][1],crt[?FFk.xy][2],crt[?FFk.xy][3],
	                                con[?FFk.fgc][0],con[?FFk.fgc][1],con[?FFk.fgc][2],con[?FFk.fgc][3],false)
	                        }
                        
	                        // Text
	                        var a
	                        if(M.FF.frame.focus == i or !e[?FFk.focus]) a = e[?FFk.fga]
	                        else a = e[?FFk.fga]/2
	                        draw_set_halign(fa_left)
	                        draw_set_valign(fa_middle)
	                        draw_text_color(npt[?FFk.xy][0]+M.FF.margin.SM,incy,npt[?FFk.str],
	                            con[?FFk.fgc][0],con[?FFk.fgc][1],con[?FFk.fgc][2],con[?FFk.fgc][3],a)
                            
	                    }
                    
	                #endregion
                
	            #endregion
            
	            if(M.FF.debug_frames) trace("End Content (Console)")
            
	            break
            
	        }
        
	        case FF_content.cmpnt: {
            
	            if(M.FF.debug_frames) trace("Begin Content (Component)")
            
	            var in_cmp = false
	            if(cmpn[?FFk.varr] != noone and !ttl[?FFk.mbtn]) {
                
	                var ret_arr = draw_components(e,[content_h,i,in_cmp])
					
				    // ABORT ABORT ABORT ABORT ABORT
				    if(M.FF.frame.draw_break) break
				    // ABORT ABORT ABORT ABORT ABORT
					
	                // Unpack
	                e[?FFk.content_ho] = ret_arr[0]
	                i = ret_arr[1]
	                in_cmp = ret_arr[2]
                    
	                if(!e[?FFk.resize] and e[?FFk.autosize]) {
                    
	                    // Init Width to Set
	                    if(e[?FFk.title]) e[?FFk.w] = clamp(e[?FFk.w],ttl[?FFk.w_mn],M.FF.runtime_width)
	                    else e[?FFk.w] = clamp(e[?FFk.w],M.FF.margin.RW8,M.FF.runtime_width)
                    
	                    // Apply New Height + Width
	                    e[?FFk.xy][2] = e[?FFk.xy][0] + e[?FFk.w]
	                    e[?FFk.xy][3] = e[?FFk.xy][1] + e[?FFk.content_ho]
                    
	                }
                
	                /* Legacy
	                // Resize Frame?
	                if(!e[?FFk.resize] and e[?FFk.autosize]) {
                    
	                    // Init Width to Set
	                    if(e[?FFk.title]) e[?FFk.w] = clamp(e[?FFk.w],ttl[?FFk.w_mn],M.FF.runtime_width)
	                    else e[?FFk.w] = clamp(e[?FFk.w],M.FF.margin.RW8,M.FF.runtime_width)
                    
	                    // Apply New Height + Width
	                    e[?FFk.xy][3] = content_h + cmpn[?FFk.marginy]
	                    e[?FFk.xy][2] = e[?FFk.xy][0] + e[?FFk.w]
	                    e[?FFk.h] = e[?FFk.xy][3] - e[?FFk.xy][1]
                    
	                }
	                */
                
	                if(in_cmp or !M.FF.MBL) e[?FFk.drag_override] = in_cmp
                
	            }
            
	            if(M.FF.debug_frames) trace("End Content (Component)")
            
	            break
            
	        }
        
	    }
    
	    // ABORT ABORT ABORT ABORT ABORT
	    if(M.FF.frame.draw_break) break
	    // ABORT ABORT ABORT ABORT ABORT
    
	    #region Tabs; Change frames
        
	        if(e[?FFk.tab_group] and !ttl[?FFk.mbtn]) {
            
	            var tar = M.FF.frame.tab_array_map[?tg[?FFk.uid]]
	            var sz = array_length_1d(tar)
	            var tw = (tg[?FFk.xy][2]-tg[?FFk.xy][0])/sz
	            var totw = 0
	            var in_t = false
            
	            for(var tari = 0; tari < sz; tari++) {
                
	                var uid = tar[tari]
	                var tmx = tg[?FFk.xy][0]+(((tg[?FFk.xy][0]+tw)-tg[?FFk.xy][0])/2)
	                var tmy = tg[?FFk.xy][1]+((tg[?FFk.xy][3]-tg[?FFk.xy][1])/2)
	                var xy = [tg[?FFk.xy][0]+totw,tg[?FFk.xy][1],tg[?FFk.xy][0]+tw+totw,tg[?FFk.xy][3]]
	                in_t = mouse_x-M.FF.surface_xy[0] > xy[0] and mouse_x-M.FF.surface_xy[0] < xy[2] and mouse_y-M.FF.surface_xy[1] > xy[1] and mouse_y-M.FF.surface_xy[1] < xy[3]
	                if(in_t) e[?FFk.drag_override] = true
                
	                if(e[?FFk.uid] != uid) { // Unselected Tab
                    
	                    // BG
	                    draw_set_alpha(ttl[?FFk.bga])
	                    if(M.FF.frame.focus == i or !e[?FFk.focus]) {
                        
	                        if(in_t and M.FF.MBL) {
                            
	                            if(array_equals(ttl[?FFk.bgc],ttl[?FFk.bgc_o]))
	                                ttl[?FFk.bgc] = invert_array(ttl[?FFk.bgc])
                            
	                        } else {
                            
	                            if(!array_equals(ttl[?FFk.bgc],ttl[?FFk.bgc_o]))
	                                ttl[?FFk.bgc] = array_dupe(ttl[?FFk.bgc],ttl[?FFk.bgc_o])
                            
	                        }
                        
	                    } else draw_set_alpha(ttl[?FFk.bga]/2)
	                    draw_rectangle_color(xy[0],xy[1],xy[2],xy[3],ttl[?FFk.bgc][0],
	                        ttl[?FFk.bgc][1],ttl[?FFk.bgc][2],ttl[?FFk.bgc][3],false)
                    
	                    // FG
	                    if(M.FF.frame.focus == i or !e[?FFk.focus]) draw_set_alpha(ttl[?FFk.fga])
	                    else draw_set_alpha(ttl[?FFk.fga]/2)
	                    draw_rectangle_color(xy[0],xy[1],xy[2],xy[3],ttl[?FFk.fgc][0],
	                        ttl[?FFk.fgc][1],ttl[?FFk.fgc][2],ttl[?FFk.fgc][3],true)
                    
	                    // Text
	                    var a
	                    if(M.FF.frame.focus == i or !e[?FFk.focus]) a = ttl[?FFk.fga]
	                    else a = ttl[?FFk.fga]/2
	                    draw_set_halign(fa_middle)
	                    draw_set_valign(fa_center)
	                    draw_text_color(tmx+totw,tmy,uid,ttl[?FFk.fgc][0],ttl[?FFk.fgc][1],
	                        ttl[?FFk.fgc][2],ttl[?FFk.fgc][3],a)
                    
	                    if(in_t and M.FF.MBLR and M.FF.runtime_frame_delay == 0) {
                        
	                        var gfi = get_frame(uid)
	                        gfi = set_top_frame(gfi)
	                        var e2 = M.FF.frame.map_list[|gfi]
	                        M.FF.frame.focus = gfi
	                        GFIF_nxt = gfi
                        
	                        // Set up opening tab
	                        e2[?FFk.xy] = e[?FFk.xy]
	                        e2[?FFk.ttl_cfg][?FFk.pbtn] = ttl[?FFk.pbtn]
	                        // If going to changing between different modes
	                        if(e2[?FFk.resize] != e[?FFk.resize]) {
                            
	                            e2[?FFk.xy][2] = e2[?FFk.xy][0] + e[?FFk.ttl_cfg][?FFk.w_mn]
	                            e2[?FFk.xy][3] = e2[?FFk.xy][1] + M.FF.runtime_height*.5
                            
	                        }
                        
	                        // Clear Keyboard String
	                        keyboard_string = ""
                        
	                        // Close previous tab
	                        e[?FFk.active] = false
	                        e2[?FFk.active] = true
                        
	                        // Set short frame delay (prevent double clicking)
	                        M.FF.runtime_frame_delay = 2
                        
	                    }
                    
	                } else { // Selected Tab
                    
	                    // BG
	                    if(M.FF.frame.focus == i or !e[?FFk.focus])
	                        draw_set_alpha(ttl[?FFk.bga])
	                    else draw_set_alpha(ttl[?FFk.bga]/2)
	                    draw_rectangle_color(xy[0],xy[1],xy[2],xy[3],ttl[?FFk.fgc][0],
	                        ttl[?FFk.fgc][1],ttl[?FFk.fgc][2],ttl[?FFk.fgc][3],false)
                    
	                    // FG
	                    if(M.FF.frame.focus == i or !e[?FFk.focus]) draw_set_alpha(ttl[?FFk.fga])
	                    else draw_set_alpha(ttl[?FFk.fga]/2)
	                    draw_rectangle_color(xy[0],xy[1],xy[2],xy[3],ttl[?FFk.fgc][0],
	                        ttl[?FFk.fgc][1],ttl[?FFk.fgc][2],ttl[?FFk.fgc][3],true)
                    
	                    // Text
	                    var a
	                    if(M.FF.frame.focus == i or !e[?FFk.focus]) a = ttl[?FFk.fga]
	                    else a = ttl[?FFk.fga]/2
	                    draw_set_halign(fa_middle)
	                    draw_set_valign(fa_center)
	                    draw_text_color(tmx+totw,tmy,uid,ttl[?FFk.bgc][0],ttl[?FFk.bgc][1],
	                        ttl[?FFk.bgc][2],ttl[?FFk.bgc][3],a)
                    
	                }
                
	                // Update Vars
	                totw += tw
	                t_min_w += string_width(uid)*2+(M.FF.margin.SM*2)
                
	            }
            
	            // Un-invert bgc if haven't already
	            if(!array_equals(ttl[?FFk.bgc],ttl[?FFk.bgc_o]))
	                ttl[?FFk.bgc] = array_dupe(ttl[?FFk.bgc],ttl[?FFk.bgc_o])
            
	            // Update drag_override; Unless mouse is being clicked
	            // Avoids dragging again after moving out if mouse is still clicked
	            if(in_t or !M.FF.MBL) e[?FFk.drag_override] = in_t
            
	        }
        
	    #endregion
    
	    #region Title; Drawn last so it always on top
        
	        if(e[?FFk.title]) {
            
	            // Init Button coordinates
	            // Exit Button
	            var xbtn_xy
	            xbtn_xy[0] = ttl[?FFk.xy][2]-M.FF.margin.SM // Coordinates are backwards since button is right-aligned
	            xbtn_xy[1] = ttl[?FFk.xy][3]-M.FF.margin.SM // i.e. Drawing Bottom-Right to Top-Left
	            xbtn_xy[2] = xbtn_xy[0]-M.FF.margin.STR_H
	            xbtn_xy[3] = ttl[?FFk.xy][1]+M.FF.margin.SM
	            var xbtnx = xbtn_xy[2]+((xbtn_xy[0]-xbtn_xy[2])/2)
	            var xbtny = xbtn_xy[3]+((xbtn_xy[1]-xbtn_xy[3])/2)
            
	            // Pin Button
	            var pbtn_xy
	            pbtn_xy[0] = xbtn_xy[2]-M.FF.margin.SM // Coordinates are backwards since button is right-aligned
	            pbtn_xy[1] = xbtn_xy[1] // i.e. Drawing Bottom-Right to Top-Left
	            pbtn_xy[2] = pbtn_xy[0]-M.FF.margin.STR_H
	            pbtn_xy[3] = xbtn_xy[3]
	            var pbtnx = pbtn_xy[2]+((pbtn_xy[0]-pbtn_xy[2])/2)
	            var pbtny = pbtn_xy[3]+((pbtn_xy[1]-pbtn_xy[3])/2)
            
	            // Minimize Button
	            var mbtn_xy
	            mbtn_xy[0] = pbtn_xy[2]-M.FF.margin.SM // Coordinates are backwards since button is right-aligned
	            mbtn_xy[1] = pbtn_xy[1] // i.e. Drawing Bottom-Right to Top-Left
	            mbtn_xy[2] = mbtn_xy[0]-M.FF.margin.STR_H
	            mbtn_xy[3] = pbtn_xy[3]
	            var mbtnx = mbtn_xy[2]+((mbtn_xy[0]-mbtn_xy[2])/2)
	            var mbtny = (mbtn_xy[3]+((mbtn_xy[1]-mbtn_xy[3])/2))-M.FF.margin.SM
	            var btns_w = (xbtn_xy[0]-mbtn_xy[2])+(M.FF.margin.SM*2) // Get total of buttons width to add to lbl_mn_w
	            ttl[?FFk.w_mn] = string_width(ttl[?FFk.uid])+btns_w+M.FF.margin.SM // Update lbl_mn_w
	            if(e[?FFk.tab_group]) ttl[?FFk.w_mn] += string_width(" " + tg[?FFk.uid])
            
	            // BG
	            draw_set_alpha(ttl[?FFk.bga])
	            draw_rectangle_color(ttl[?FFk.xy][0],ttl[?FFk.xy][1],ttl[?FFk.xy][2],ttl[?FFk.xy][3],
	                ttl[?FFk.bgc][0],ttl[?FFk.bgc][1],ttl[?FFk.bgc][2],ttl[?FFk.bgc][3],false)
            
	            // FG
	            if(M.FF.frame.focus == i or !e[?FFk.focus]) draw_set_alpha(ttl[?FFk.fga])
	            else draw_set_alpha(ttl[?FFk.fga]/2)
	            draw_line_color(ttl[?FFk.xy][0],ttl[?FFk.xy][3],ttl[?FFk.xy][2],ttl[?FFk.xy][3],
	                ttl[?FFk.fgc][0],ttl[?FFk.fgc][2])
            
	            // Label
	            var l_str_x = ttl[?FFk.xy][0]+M.FF.margin.SM
	            var l_str_y = ttl[?FFk.xy][1]+((ttl[?FFk.xy][3]-ttl[?FFk.xy][1])/2)
	            draw_set_halign(fa_left)
	            draw_set_valign(fa_center)
	            var a
	            if(M.FF.frame.focus == i or !e[?FFk.focus]) a = ttl[?FFk.bga]
	            else a = ttl[?FFk.bga]/2
	            if(e[?FFk.tab_group] and !tg[?FFk.hide_uid]) draw_text_color(l_str_x,l_str_y,ttl[?FFk.uid] + " " + tg[?FFk.uid],
	                ttl[?FFk.str_cfg][?FFk.fgc][0],ttl[?FFk.str_cfg][?FFk.fgc][1],ttl[?FFk.str_cfg][?FFk.fgc][2],ttl[?FFk.str_cfg][?FFk.fgc][3],a)
	            else draw_text_color(l_str_x,l_str_y,ttl[?FFk.uid],ttl[?FFk.str_cfg][?FFk.fgc][0],ttl[?FFk.str_cfg][?FFk.fgc][1],
	                ttl[?FFk.str_cfg][?FFk.fgc][2],ttl[?FFk.str_cfg][?FFk.fgc][3],a)
            
	            #region Label Buttons
                
	                // We don'true draw any buttons at all if none of them are enabled
	                if(e[?FFk.xbtn] or e[?FFk.pbtn] or e[?FFk.mbtn]) {
                    
	                    #region X Button
                        
	                        // Mouse In Logic
	                        if(mouse_x-M.FF.surface_xy[0] > xbtn_xy[2] and mouse_x-M.FF.surface_xy[0] < xbtn_xy[0]
	                            and mouse_y-M.FF.surface_xy[1] > xbtn_xy[3] and mouse_y-M.FF.surface_xy[1] < xbtn_xy[1]
	                            and (M.FF.frame.focus == i or !e[?FFk.focus])
	                            and e[?FFk.xbtn]) {
                            
	                            // Highlight/Fill
	                            draw_set_alpha(ttl[?FFk.fga])
	                            if(M.FF.MBL) {
                                
	                                if(array_equals(ttl[?FFk.fgc],ttl[?FFk.fgc_o]))
	                                    ttl[?FFk.fgc] = invert_array(ttl[?FFk.fgc])
                                
	                            } else {
                                
	                                if(!array_equals(ttl[?FFk.fgc],ttl[?FFk.fgc_o]))
	                                    ttl[?FFk.fgc] = array_dupe(ttl[?FFk.fgc],ttl[?FFk.fgc_o])
                                
	                            }
	                            draw_rectangle_color(xbtn_xy[0],xbtn_xy[1],xbtn_xy[2],xbtn_xy[3],ttl[?FFk.fgc][0],
	                                ttl[?FFk.fgc][1],ttl[?FFk.fgc][2],ttl[?FFk.fgc][3],false)
                            
	                            // Close out Frame
	                            if(M.FF.MBLR) {
                                
	                                e[?FFk.active] = false
	                                ttl[?FFk.pbtn] = false
	                                M.FF.frame.focus = noone
	                                GFIF_nxt = noone
                                
	                            }
                            
	                        } else { // Mouse Out Logic
                            
	                            // Highlight/Fill
	                            if((M.FF.frame.focus == i or !e[?FFk.focus]) and e[?FFk.xbtn]) {
                                
	                                draw_set_alpha(ttl[?FFk.fga])
                                
	                            } else {
                                
	                                draw_set_alpha(ttl[?FFk.fga]/2)
                                
	                                if(!array_equals(ttl[?FFk.fgc],ttl[?FFk.fgc_o]))
	                                    ttl[?FFk.fgc] = array_dupe(ttl[?FFk.fgc],ttl[?FFk.fgc_o])
                                
	                            }
	                            draw_rectangle_color(xbtn_xy[0],xbtn_xy[1],xbtn_xy[2],xbtn_xy[3],ttl[?FFk.fgc][0],
	                                ttl[?FFk.fgc][1],ttl[?FFk.fgc][2],ttl[?FFk.fgc][3],false)
                            
	                        }
                        
	                        // Icon/Char
	                        var a
	                        if((M.FF.frame.focus == i or !e[?FFk.focus]) and e[?FFk.xbtn]) a = ttl[?FFk.fga]
	                        else a = ttl[?FFk.fga]/2
	                        draw_set_halign(fa_middle)
	                        draw_set_valign(fa_center)
	                        draw_text_color(xbtnx,xbtny,"x",ttl[?FFk.bgc][0],ttl[?FFk.bgc][1],
	                            ttl[?FFk.bgc][2],ttl[?FFk.bgc][3],a)
                        
	                        // Un-invert colors when done drawing this if haven't already
	                        if(!array_equals(ttl[?FFk.fgc],ttl[?FFk.fgc_o]))
	                            ttl[?FFk.fgc] = array_dupe(ttl[?FFk.fgc],ttl[?FFk.fgc_o])
                        
	                    #endregion
                    
	                    #region Pin Button
                        
	                        // Mouse In Logic
	                        if(mouse_x-M.FF.surface_xy[0] > pbtn_xy[2] and mouse_x-M.FF.surface_xy[0] < pbtn_xy[0]
	                            and mouse_y-M.FF.surface_xy[1] > pbtn_xy[3] and mouse_y-M.FF.surface_xy[1] < pbtn_xy[1]
	                            and (M.FF.frame.focus == i or !e[?FFk.focus])
	                            and e[?FFk.pbtn]) {
                            
	                            // Highlight/Fill
	                            draw_set_alpha(ttl[?FFk.fga])
	                            if(M.FF.MBL) {
                                
	                                if(!ttl[?FFk.pbtn]) draw_set_alpha(ttl[?FFk.fga]*.5)
                                
	                                if(array_equals(ttl[?FFk.fgc],ttl[?FFk.fgc_o]))
	                                    ttl[?FFk.fgc] = invert_array(ttl[?FFk.fgc])
                                
	                            } else {
                                
	                                if(!ttl[?FFk.pbtn]) draw_set_alpha(ttl[?FFk.fga]*.75)
                                
	                                if(!array_equals(ttl[?FFk.fgc],ttl[?FFk.fgc_o]))
	                                    ttl[?FFk.fgc] = array_dupe(ttl[?FFk.fgc],ttl[?FFk.fgc_o])
                                
	                            }
	                            if(ttl[?FFk.pbtn]) draw_rectangle_color(pbtn_xy[0],pbtn_xy[1],pbtn_xy[2],pbtn_xy[3],
	                                ttl[?FFk.fgc][0],ttl[?FFk.fgc][1],ttl[?FFk.fgc][2],ttl[?FFk.fgc][3],false)
	                            else draw_rectangle_color(pbtn_xy[0],pbtn_xy[1],pbtn_xy[2],pbtn_xy[3],
	                                ttl[?FFk.fgc][0],ttl[?FFk.fgc][1],ttl[?FFk.fgc][2],ttl[?FFk.fgc][3],true)
                            
	                            // Toggle on release
	                            if(M.FF.MBLR) ttl[?FFk.pbtn] = !ttl[?FFk.pbtn]
                            
	                        } else { // Mouse out Logic
                            
	                            // Highlight/Fill
	                            if((M.FF.frame.focus == i or !e[?FFk.focus]) and e[?FFk.pbtn]) draw_set_alpha(ttl[?FFk.fga])
	                            else draw_set_alpha(ttl[?FFk.fga]/2)
	                            if(ttl[?FFk.pbtn]) draw_rectangle_color(pbtn_xy[0],pbtn_xy[1],pbtn_xy[2],pbtn_xy[3],
	                                ttl[?FFk.fgc][0],ttl[?FFk.fgc][1],ttl[?FFk.fgc][2],ttl[?FFk.fgc][3],false)
	                            else draw_rectangle_color(pbtn_xy[0],pbtn_xy[1],pbtn_xy[2],pbtn_xy[3],
	                                ttl[?FFk.fgc][0],ttl[?FFk.fgc][1],ttl[?FFk.fgc][2],ttl[?FFk.fgc][3],true)
                            
	                        }
                        
	                        // Un-invert colors when done drawing this if haven't already
	                        if(!array_equals(ttl[?FFk.fgc],ttl[?FFk.fgc_o]))
	                            ttl[?FFk.fgc] = array_dupe(ttl[?FFk.fgc],ttl[?FFk.fgc_o])
                        
	                    #endregion
                    
	                    #region Min Button
                        
	                        // Mouse In Logic
	                        if(mouse_x-M.FF.surface_xy[0] > mbtn_xy[2] and mouse_x-M.FF.surface_xy[0] < mbtn_xy[0]
	                            and mouse_y-M.FF.surface_xy[1] > mbtn_xy[3] and mouse_y-M.FF.surface_xy[1] < mbtn_xy[1]
	                            and (M.FF.frame.focus == i or !e[?FFk.focus])
	                            and e[?FFk.mbtn]) {
                            
	                            // Highlight/Fill
	                            draw_set_alpha(ttl[?FFk.fga])
	                            if(M.FF.MBL) {
                                
	                                if(array_equals(ttl[?FFk.fgc],ttl[?FFk.fgc_o]))
	                                    ttl[?FFk.fgc] = invert_array(ttl[?FFk.fgc])
                                
	                            } else {
                                
	                                if(!array_equals(ttl[?FFk.fgc],ttl[?FFk.fgc_o]))
	                                    ttl[?FFk.fgc] = array_dupe(ttl[?FFk.fgc],ttl[?FFk.fgc_o])
                                
	                            }
	                            draw_rectangle_color(mbtn_xy[0],mbtn_xy[1],mbtn_xy[2],mbtn_xy[3],ttl[?FFk.fgc][0],
	                                ttl[?FFk.fgc][1],ttl[?FFk.fgc][2],ttl[?FFk.fgc][3],false)
                            
	                            // Toggle Minimize
	                            if(M.FF.MBLR) frame_minimize(e)
                            
	                        } else { // Mouse Out Logic
                            
	                            // Highlight/Fill
	                            if((M.FF.frame.focus == i or !e[?FFk.focus]) and e[?FFk.mbtn]) draw_set_alpha(ttl[?FFk.fga])
	                            else draw_set_alpha(ttl[?FFk.fga]/2)
	                            draw_rectangle_color(mbtn_xy[0],mbtn_xy[1],mbtn_xy[2],mbtn_xy[3],ttl[?FFk.fgc][0],
	                                ttl[?FFk.fgc][1],ttl[?FFk.fgc][2],ttl[?FFk.fgc][3],false)
                            
	                        }
                        
	                        // Icon/Char
	                        var a
	                        if((M.FF.frame.focus == i or !e[?FFk.focus]) and e[?FFk.mbtn]) a = ttl[?FFk.fga]
	                        else a = ttl[?FFk.fga]/2
	                        draw_set_halign(fa_middle)
	                        draw_set_valign(fa_center)
	                        draw_text_color(mbtnx,mbtny,"_",ttl[?FFk.bgc][0],ttl[?FFk.bgc][1],
	                            ttl[?FFk.bgc][2],ttl[?FFk.bgc][3],a)
                        
	                        // Un-invert colors when done drawing this if haven't already
	                        if(!array_equals(ttl[?FFk.fgc],ttl[?FFk.fgc_o]))
	                            ttl[?FFk.fgc] = array_dupe(ttl[?FFk.fgc],ttl[?FFk.fgc_o])
                        
	                    #endregion
                    
	                }
                
	            #endregion
            
	        }
        
	        // Update Label Min Width if tab_group_active width is greater; Whether there is label_active or not
	        ttl[?FFk.w_mn] = max(ttl[?FFk.w_mn],t_min_w)
        
	    #endregion
    
	    #region Stretch Indicator
        
	        if((M.FF.frame.focus == i or !e[?FFk.focus]) and M.FF.key_control and !ttl[?FFk.pbtn] and e[?FFk.resize]) {
            
	            // Init Triangle X/Y; Bottom Right Corner
	            var xx1 = (e[?FFk.xy][2])-M.FF.margin.SM
	            var yy1 = (e[?FFk.xy][3])-M.FF.margin.SM
	            var xx2 = xx1-M.FF.margin.BG
	            var yy2 = yy1
	            var xx3 = xx1
	            var yy3 = yy1-M.FF.margin.BG
            
	            draw_set_alpha(e[?FFk.fga])
	            draw_set_color(e[?FFk.fgc][0])
	            draw_triangle(xx1,yy1,xx2,yy2,xx3,yy3,false)
            
	        }
        
	    #endregion
    
	    #region FG; Drawn Last so it is on top
        
	        if(e[?FFk.fg]) { // Draw unless fg disabled
            
	            if(M.FF.frame.focus == i or !e[?FFk.focus]) draw_set_alpha(e[?FFk.fga])
	            else draw_set_alpha(e[?FFk.fga]/2)
	            draw_rectangle_color(e[?FFk.xy][0],e[?FFk.xy][1],e[?FFk.xy][2],e[?FFk.xy][3],
	                e[?FFk.fgc][0],e[?FFk.fgc][1],e[?FFk.fgc][2],e[?FFk.fgc][3],true)
            
	        }
        
	    #endregion
    
	    if(M.FF.debug_frames) trace("End " + M.FF.frame.map_list[|i][?FFk.uid])
    
	}


	// ABORT ABORT ABORT ABORT ABORT
	if(M.FF.frame.draw_break) return noone
	// ABORT ABORT ABORT ABORT ABORT

	if(GFIF_nxt != M.FF.frame.focus and M.FF.runtime_frame_delay == 0) {
    
	    if(GFIF_nxt != noone) {
        
	        // Move Next to End of List
	        GFIF_nxt = set_top_frame(GFIF_nxt)
        
	        // Get Next's Input config & Update keyboard_string
	        if(GFIF_nxt[?FFk.input]) {
            
	            var npt_nxt = M.FF.frame.map_list[|GFIF_nxt][?FFk.con_cfg][?FFk.inp_cfg]
	            keyboard_string = npt_nxt[?FFk.str]
            
	        } else keyboard_string = "" // Otherwise clear keyboard_string
        
	    } else keyboard_string = ""
    
	    // Set new Focus
	    M.FF.frame.focus = GFIF_nxt
    
	}

	if(M.FF.debug) trace("End Draw Frames 1")

	return noone

}

function draw_components() {

	// Params
	var e = argument0               // Frame or Parent
	var var_arr = argument1         // Array of Vars passed/returned associated with component drawing, see below

	// Var Arr Init
	var content_h = var_arr[0]      // Out Total Height (con+cmps); Relevant to Frames
	var i = var_arr[1]              // i; index in M.FF.frame.map_list for drawn frame; Relevant to Frames
	var in_cmp = var_arr[2]         // in_cmp; Whether or not mouse inside a component; to override certain controls

	// Parent Inits
	var re_sz = e[?FFk.resize]            // re_sz; Whether frame/container will be resized to accomodate height
	var auto_sz = e[?FFk.autosize]
	var scroll = e[?FFk.scroll]           // scroll; Whether the frame/container is scrollable or not

	// Other Init
	var varr = e[?FFk.cmpnt_cfg][?FFk.varr]      // Anything using this should have all components in FFk.cmpnt_cfg in FFk.varr
	var marx = e[?FFk.cmpnt_cfg][?FFk.marginx]
	var mary = e[?FFk.cmpnt_cfg][?FFk.marginy]
	var hv   = e[?FFk.cmpnt_cfg][?FFk.hvalign]
	var x1 = (e[?FFk.xy][0] + marx) - M.FF.surface_xy[0]
	var y1 = (e[?FFk.xy][1] + content_h + mary) - M.FF.surface_xy[1]
	var x2 = (e[?FFk.xy][2] - marx) - M.FF.surface_xy[0]
	var y2 = (e[?FFk.xy][3] - mary) - M.FF.surface_xy[1]
	var ew = x2-x1
	var eh = y2-y1

	#region Draw Logic
    
	    // Init Y Loop
	    var varrh = array_height_2d(varr)
	    var remh = e[?FFk.h]
	    var realigny = false
	    var do_draw = false
	    var remh_div = 0
    
	    // Y Loop
	    for(var iy = 0; iy < varrh; iy++) {
        
	        // Init X Loop
	        var prvy = noone
	        var remw = e[?FFk.w]
        
	        // We want the tallest component as prvy
	        if(iy > 0) {
            
	            var arr_sz = array_length_2d(varr,iy-1)
	            prvy = varr[iy-1][0]
	            if(arr_sz > 1)
	                for(var iz = 1; iz < arr_sz; iz++)
	                    if(varr[iy-1][iz][?FFk.h] > prvy[?FFk.h])
	                        prvy = varr[iy-1][iz]
            
	        }
        
	        // Init Rest
	        var varrw = array_length_2d(varr,iy)
	        var used_h = 0
	        var realignx = false
        
	        // X Loop
	        for(var ix = 0; ix < varrw; ix++) {
            
	            // Init
	            var prvx = noone
	            var used_w = 0
	            if(ix > 0) prvx = varr[iy][ix-1]
	            var cmp = varr[iy][ix]
	            if(cmp = noone) continue
            
	            // If from frame, check focus stuff (i being index in M.FF.frame.map_list)
	            if(i != noone) {
                
	                #region Set Override
                    
	                    if((M.FF.frame.focus != noone and M.FF.frame.focus != i)
	                        or (e[?FFk.focus] and M.FF.frame.focus != i)) cmp[?FFk.override] = true
	                    else cmp[?FFk.override] = false
                    
	                #endregion
                
	                #region Component Alpha w/ Frame during Focus mode
                    
	                    if(e[?FFk.focus] and M.FF.frame.focus != i) {
                        
	                        cmp[?FFk.bga] = e[?FFk.bga]/2
	                        cmp[?FFk.fga] = e[?FFk.fga]/2
                        
	                    } else if(e[?FFk.focus] and M.FF.frame.focus == i) {
                        
	                        cmp[?FFk.bga] = e[?FFk.bga]
	                        cmp[?FFk.fga] = e[?FFk.fga]
                        
	                    }
                    
	                #endregion
                
	            }
            
	            #region Out of Frame/Container Skip (When Drawing/Not autosizing)
                
	                if(do_draw and !auto_sz) {
                    
	                    // In surface..
	                    if(M.FF.surface_xy != [0,0]) {
                        
	                        if(cmp[?FFk.xy][1] > e[?FFk.xy][3]-M.FF.surface_xy[1]
	                            or cmp[?FFk.xy][3] < e[?FFk.xy][1]-M.FF.surface_xy[1]) continue
                        
	                    // Not in surface..
	                    } else {
                        
	                        if(cmp[?FFk.xy][1] > e[?FFk.xy][3]
	                            or cmp[?FFk.xy][3] < e[?FFk.xy][1]) continue
                        
	                    }
                    
	                }
                
	            #endregion
				
				// ABORT ABORT ABORT ABORT ABORT
				if(M.FF.frame.draw_break) return noone
				// ABORT ABORT ABORT ABORT ABORT
				
	            // "Stages" because we have to setup different things each stage
	            #region Component Stages (Three Stages, Init/Realign/Draw)
            
	                if(!realignx and !realigny and !do_draw) {
                    
	                    #region Init Component Positions/Bounds
                        
	                        switch(cmp[?FFk.cmpnt_type]) {
                            
	                            #region Button
                                
	                                case FF_component.btn: {
                                    
	                                    if(M.FF.debug_components) trace("Setup Button..")
                                    
	                                    // Init x1/y1
	                                    if(prvx == noone) cmp[?FFk.xy][0] = x1               // If first on X-Axis..
	                                    else cmp[?FFk.xy][0] = prvx[?FFk.bound][2]          // If not first on X-Axis..
	                                    if(prvy == noone) cmp[?FFk.xy][1] = y1               // If first on Y-Axis..
	                                    else cmp[?FFk.xy][1] = prvy[?FFk.bound][3]          // If not first on Y-Axis..
                                    
	                                    // Scroll?
	                                    if(scroll and prvy == noone)
	                                        cmp[?FFk.xy][1] += e[?FFk.scrolly]
                                    
	                                    // Init x2/y
	                                    cmp[?FFk.xy][2] = cmp[?FFk.xy][0] + round(cmp[?FFk.w_pct]*ew)
	                                    cmp[?FFk.xy][3] = cmp[?FFk.xy][1] + round(cmp[?FFk.h_pct]*eh)
                                    
	                                    // Set Width/Height
	                                    cmp[?FFk.w] = cmp[?FFk.xy][2] - cmp[?FFk.xy][0]
	                                    cmp[?FFk.h] = cmp[?FFk.xy][3] - cmp[?FFk.xy][1]
                                    
	                                    /* Legacy
	                                    cmp[?FFk.xy][0] = e[?FFk.xy][0] + ((e[?FFk.w]/varrw)*(ix)) + (marx*varrw)
	                                    cmp[?FFk.xy][1] = con_tot_h + content_h + mary
	                                    cmp[?FFk.xy][2] = cmp[?FFk.xy][0] + cmp_w
	                                    cmp[?FFk.xy][3] = cmp[?FFk.xy][1] + (mary*2)
	                                    */
                                    
	                                    // Bounds
	                                    cmp[?FFk.bound] = []
	                                    if(prvx == noone) cmp[?FFk.bound][0] = cmp[?FFk.xy][0]-marx
	                                    else cmp[?FFk.bound][0] = cmp[?FFk.xy][0]
	                                    if(prvy == noone) cmp[?FFk.bound][1] = cmp[?FFk.xy][1]-mary
	                                    else cmp[?FFk.bound][1] = cmp[?FFk.xy][1]
	                                    cmp[?FFk.bound][2] = cmp[?FFk.xy][2]+marx
	                                    cmp[?FFk.bound][3] = cmp[?FFk.xy][3]+mary
                                    
	                                    // Tally Used
	                                    used_h = max(used_h,(cmp[?FFk.bound][3]-cmp[?FFk.bound][1]))
	                                    used_w += (cmp[?FFk.bound][2]-cmp[?FFk.bound][0])
                                    
	                                    if(M.FF.debug_components) trace("Success!")
                                    
	                                    break
                                    
	                                }
                                
	                            #endregion
                            
	                            #region Bind Button
                                
	                                case FF_component.bnd_btn: {
                                    
	                                    if(M.FF.debug_components) trace("Setup Bind Button..")
                                    
	                                    // Init x1/y1
	                                    if(prvx == noone) cmp[?FFk.xy][0] = x1               // If first on X-Axis..
	                                    else cmp[?FFk.xy][0] = prvx[?FFk.bound][2]          // If not first on X-Axis..
	                                    if(prvy == noone) cmp[?FFk.xy][1] = y1               // If first on Y-Axis..
	                                    else cmp[?FFk.xy][1] = prvy[?FFk.bound][3]          // If not first on Y-Axis..
                                    
	                                    // Init x2/y
	                                    cmp[?FFk.xy][2] = cmp[?FFk.xy][0] + round(cmp[?FFk.w_pct]*ew)
	                                    cmp[?FFk.xy][3] = cmp[?FFk.xy][1] + round(cmp[?FFk.h_pct]*eh)
                                    
	                                    /* Legacy
	                                    cmp[?FFk.xy][0] = e[?FFk.xy][0] + ((e[?FFk.w]/varrw)*(ix)) + (marx*varrw)
	                                    cmp[?FFk.xy][1] = con_tot_h + content_h + mary
	                                    cmp[?FFk.xy][2] = cmp[?FFk.xy][0] + cmp_w
	                                    cmp[?FFk.xy][3] = cmp[?FFk.xy][1] + (mary*2)
	                                    used_h = max(used_h,(cmp[?FFk.xy][3]-cmp[?FFk.xy][1])+mary)
	                                    */
                                    
	                                    // Bounds
	                                    cmp[?FFk.bound] = []
	                                    if(prvx == noone) cmp[?FFk.bound][0] = cmp[?FFk.xy][0]-marx
	                                    else cmp[?FFk.bound][0] = cmp[?FFk.xy][0]
	                                    if(prvy == noone) cmp[?FFk.bound][1] = cmp[?FFk.xy][1]-mary
	                                    else cmp[?FFk.bound][1] = cmp[?FFk.xy][1]
	                                    cmp[?FFk.bound][2] = cmp[?FFk.xy][2]+marx
	                                    cmp[?FFk.bound][3] = cmp[?FFk.xy][3]+mary
                                    
	                                    // Tally Used
	                                    used_h = max(used_h,(cmp[?FFk.bound][3]-cmp[?FFk.bound][1]))
	                                    used_w += (cmp[?FFk.bound][2]-cmp[?FFk.bound][0])
                                    
	                                    if(M.FF.debug_components) trace("Success!")
                                    
	                                    break
                                    
	                                }
                                
	                            #endregion
                            
	                            #region Entry Button
                                
	                                case FF_component.ent_btn: {
                                    
	                                    if(M.FF.debug_components) trace("Setup Entry Button..")
                                    
	                                    // Init x1/y1
	                                    if(prvx == noone) cmp[?FFk.xy][0] = x1               // If first on X-Axis..
	                                    else cmp[?FFk.xy][0] = prvx[?FFk.bound][2]          // If not first on X-Axis..
	                                    if(prvy == noone) cmp[?FFk.xy][1] = y1               // If first on Y-Axis..
	                                    else cmp[?FFk.xy][1] = prvy[?FFk.bound][3]          // If not first on Y-Axis..
                                    
	                                    // Scroll?
	                                    if(scroll and prvy == noone)
	                                        cmp[?FFk.xy][1] += e[?FFk.scrolly]
                                    
	                                    // Init x2/y
	                                    cmp[?FFk.xy][2] = cmp[?FFk.xy][0] + round(cmp[?FFk.w_pct]*ew)
	                                    cmp[?FFk.xy][3] = cmp[?FFk.xy][1] + round(cmp[?FFk.h_pct]*eh)
                                    
	                                    // Set Width/Height
	                                    cmp[?FFk.w] = cmp[?FFk.xy][2] - cmp[?FFk.xy][0]
	                                    cmp[?FFk.h] = cmp[?FFk.xy][3] - cmp[?FFk.xy][1]
                                    
	                                    /* Legacy
	                                    cmp[?FFk.xy][0] = e[?FFk.xy][0] + ((e[?FFk.w]/varrw)*(ix)) + (marx*varrw)
	                                    cmp[?FFk.xy][1] = con_tot_h + content_h + mary
	                                    cmp[?FFk.xy][2] = cmp[?FFk.xy][0] + cmp_w
	                                    cmp[?FFk.xy][3] = cmp[?FFk.xy][1] + (mary*2)
	                                    */
                                    
	                                    // Bounds
	                                    cmp[?FFk.bound] = []
	                                    if(prvx == noone) cmp[?FFk.bound][0] = cmp[?FFk.xy][0]-marx
	                                    else cmp[?FFk.bound][0] = cmp[?FFk.xy][0]
	                                    if(prvy == noone) cmp[?FFk.bound][1] = cmp[?FFk.xy][1]-mary
	                                    else cmp[?FFk.bound][1] = cmp[?FFk.xy][1]
	                                    cmp[?FFk.bound][2] = cmp[?FFk.xy][2]+marx
	                                    cmp[?FFk.bound][3] = cmp[?FFk.xy][3]+mary
                                    
	                                    // Tally Used
	                                    used_h = max(used_h,(cmp[?FFk.bound][3]-cmp[?FFk.bound][1]))
	                                    used_w += (cmp[?FFk.bound][2]-cmp[?FFk.bound][0])
                                    
	                                    if(M.FF.debug_components) trace("Success!")
                                    
	                                    break
                                    
	                                }
                                
	                            #endregion
                            
	                            #region Slider
                                
	                                case FF_component.sldr: {
                                    
	                                    if(M.FF.debug_components) trace("Setup Slider..")
                                    
	                                    // Init x1/y1
	                                    if(prvx == noone) cmp[?FFk.xy][0] = x1               // If first on X-Axis..
	                                    else cmp[?FFk.xy][0] = prvx[?FFk.bound][2]          // If not first on X-Axis..
	                                    if(prvy == noone) cmp[?FFk.xy][1] = y1               // If first on Y-Axis..
	                                    else cmp[?FFk.xy][1] = prvy[?FFk.bound][3]          // If not first on Y-Axis..
                                    
	                                    // String Adjust
	                                    var h_adj = 0
	                                    if(cmp[?FFk.str] != noone and cmp[?FFk.str] != "") {
                                        
	                                        h_adj = round(M.FF.margin.STR_H*1.34)
	                                        cmp[?FFk.xy][1] += h_adj
                                        
	                                    }
                                    
	                                    // Init x2/y
	                                    cmp[?FFk.xy][2] = cmp[?FFk.xy][0] + round(cmp[?FFk.w_pct]*ew)
	                                    cmp[?FFk.xy][3] = cmp[?FFk.xy][1] + round(cmp[?FFk.h_pct]*eh)
                                    
	                                    /* Legacy
	                                    cmp[?FFk.xy][0] = e[?FFk.xy][0]+((e[?FFk.w]/varrw)*(ix))+(marx*varrw)
	                                    cmp[?FFk.xy][1] = con_tot_h+content_h+mary+string_height("|")
	                                    cmp[?FFk.xy][2] = cmp[?FFk.xy][0] + cmp_w
	                                    cmp[?FFk.xy][3] = cmp[?FFk.xy][1] + (mary*2)
	                                    used_h = max(used_h,(cmp[?FFk.xy][3]-cmp[?FFk.xy][1])+mary+string_height("|"))
	                                    */
                                    
	                                    // Bounds
	                                    cmp[?FFk.bound] = []
	                                    if(prvx == noone) cmp[?FFk.bound][0] = cmp[?FFk.xy][0]-marx
	                                    else cmp[?FFk.bound][0] = cmp[?FFk.xy][0]
	                                    if(prvy == noone) cmp[?FFk.bound][1] = cmp[?FFk.xy][1]-(mary+h_adj)
	                                    else cmp[?FFk.bound][1] = cmp[?FFk.xy][1]-h_adj
	                                    cmp[?FFk.bound][2] = cmp[?FFk.xy][2]+marx
	                                    cmp[?FFk.bound][3] = cmp[?FFk.xy][3]+mary
                                    
	                                    // Tally Used
	                                    used_h = max(used_h,(cmp[?FFk.bound][3]-cmp[?FFk.bound][1]))
	                                    used_w += (cmp[?FFk.bound][2]-cmp[?FFk.bound][0])
                                    
	                                    if(M.FF.debug_components) trace("Success!")
                                    
	                                    break
                                    
	                                }
                                
	                            #endregion
                            
	                            #region Picker
                                
	                                case FF_component.pckr: {
                                    
	                                    if(M.FF.debug_components) trace("Setup Picker..")
                                    
	                                    // Init x1/y1
	                                    if(prvx == noone) cmp[?FFk.xy][0] = x1               // If first on X-Axis..
	                                    else cmp[?FFk.xy][0] = prvx[?FFk.bound][2]          // If not first on X-Axis..
	                                    if(prvy == noone) cmp[?FFk.xy][1] = y1               // If first on Y-Axis..
	                                    else cmp[?FFk.xy][1] = prvy[?FFk.bound][3]          // If not first on Y-Axis..
                                    
	                                    // Init x2/y
	                                    cmp[?FFk.xy][2] = cmp[?FFk.xy][0] + round(cmp[?FFk.w_pct]*ew)
	                                    cmp[?FFk.xy][3] = cmp[?FFk.xy][1] + round(cmp[?FFk.h_pct]*eh)
                                    
	                                    /* Legacy
	                                    cmp[?FFk.xy][0] = e[?FFk.xy][0] + ((e[?FFk.w]/varrw)*(ix)) + (marx*varrw)
	                                    cmp[?FFk.xy][1] = con_tot_h+content_h+mary
	                                    cmp[?FFk.xy][2] = cmp[?FFk.xy][0] + cmp_w
	                                    cmp[?FFk.xy][3] = cmp[?FFk.xy][1] + (mary*2)
	                                    used_h = max(used_h,(cmp[?FFk.xy][3]-cmp[?FFk.xy][1])+mary)
	                                    */
                                    
	                                    // Bounds
	                                    cmp[?FFk.bound] = []
	                                    if(prvx == noone) cmp[?FFk.bound][0] = cmp[?FFk.xy][0]-marx
	                                    else cmp[?FFk.bound][0] = cmp[?FFk.xy][0]
	                                    if(prvy == noone) cmp[?FFk.bound][1] = cmp[?FFk.xy][1]-mary
	                                    else cmp[?FFk.bound][1] = cmp[?FFk.xy][1]
	                                    cmp[?FFk.bound][2] = cmp[?FFk.xy][2]+marx
	                                    cmp[?FFk.bound][3] = cmp[?FFk.xy][3]+mary
                                    
	                                    // Tally Used
	                                    used_h = max(used_h,(cmp[?FFk.bound][3]-cmp[?FFk.bound][1]))
	                                    used_w += (cmp[?FFk.bound][2]-cmp[?FFk.bound][0])
                                    
	                                    if(M.FF.debug_components) trace("Success!")
                                    
	                                    break
                                    
	                                }
                                
	                            #endregion
                            
	                            #region Color Picker
                                
	                                case FF_component.col_pckr: {
                                    
	                                    if(M.FF.debug_components) trace("Setup Color Picker..")
                                    
	                                    // Init x1/y1
	                                    if(prvx == noone) cmp[?FFk.xy][0] = x1               // If first on X-Axis..
	                                    else cmp[?FFk.xy][0] = prvx[?FFk.bound][2]          // If not first on X-Axis..
	                                    if(prvy == noone) cmp[?FFk.xy][1] = y1               // If first on Y-Axis..
	                                    else cmp[?FFk.xy][1] = prvy[?FFk.bound][3]          // If not first on Y-Axis..
                                    
	                                    // Init x2/y
	                                    cmp[?FFk.xy][2] = cmp[?FFk.xy][0] + round(cmp[?FFk.w_pct]*ew)
	                                    cmp[?FFk.xy][3] = cmp[?FFk.xy][1] + round(cmp[?FFk.h_pct]*eh)
                                    
	                                    /* Legacy
	                                    var w_dlt = 0
	                                    cmp[?FFk.xy][0] = e[?FFk.xy][0] + ((e[?FFk.w]/varrw)*(ix)) + (marx*varrw)
                                    
	                                    if(ix > 0) {
                                        
	                                        var prv = varr[iy][ix-1]
	                                        if(prv[?FFk.cmpnt_type] == FF_component.lbl
	                                            and prv[?FFk.bound][2] != noone) {
                                            
	                                            var x1o = cmp[?FFk.xy][0]
	                                            cmp[?FFk.xy][0] = prv[?FFk.bound][2] + marx
	                                            w_dlt = abs(x1o-cmp[?FFk.xy][0])
                                            
	                                        }
                                        
                                        
	                                    }
                                    
	                                    cmp[?FFk.xy][1] = con_tot_h+content_h+mary
	                                    cmp[?FFk.xy][2] = cmp[?FFk.xy][0] + cmp_w + w_dlt
	                                    cmp[?FFk.xy][3] = cmp[?FFk.xy][1] + (mary*2)
	                                    used_h = max(used_h,(cmp[?FFk.xy][3]-cmp[?FFk.xy][1])+mary)
	                                    */
                                    
	                                    // Bounds
	                                    cmp[?FFk.bound] = []
	                                    if(prvx == noone) cmp[?FFk.bound][0] = cmp[?FFk.xy][0]-marx
	                                    else cmp[?FFk.bound][0] = cmp[?FFk.xy][0]
	                                    if(prvy == noone) cmp[?FFk.bound][1] = cmp[?FFk.xy][1]-mary
	                                    else cmp[?FFk.bound][1] = cmp[?FFk.xy][1]
	                                    cmp[?FFk.bound][2] = cmp[?FFk.xy][2]+marx
	                                    cmp[?FFk.bound][3] = cmp[?FFk.xy][3]+mary
                                    
	                                    // Tally Used
	                                    used_h = max(used_h,(cmp[?FFk.bound][3]-cmp[?FFk.bound][1]))
	                                    used_w += (cmp[?FFk.bound][2]-cmp[?FFk.bound][0])
                                    
	                                    if(M.FF.debug_components) trace("Success!")
                                    
	                                    break
                                    
	                                }
                                
	                            #endregion
                            
	                            #region Iterator
                                
	                                case FF_component.iter: {
                                    
	                                    if(M.FF.debug_components) trace("Setup Iterator..")
                                    
	                                    // Init x1/y1
	                                    if(prvx == noone) cmp[?FFk.xy][0] = x1               // If first on X-Axis..
	                                    else cmp[?FFk.xy][0] = prvx[?FFk.bound][2]          // If not first on X-Axis..
	                                    if(prvy == noone) cmp[?FFk.xy][1] = y1               // If first on Y-Axis..
	                                    else cmp[?FFk.xy][1] = prvy[?FFk.bound][3]          // If not first on Y-Axis..
                                    
	                                    // Init x2/y
	                                    cmp[?FFk.xy][2] = cmp[?FFk.xy][0] + round(cmp[?FFk.w_pct]*ew)
	                                    cmp[?FFk.xy][3] = cmp[?FFk.xy][1] + round(cmp[?FFk.h_pct]*eh)
                                    
	                                    /* Legacy
	                                    var w_dlt = 0
	                                    cmp[?FFk.xy][0] = e[?FFk.xy][0] + ((e[?FFk.w]/varrw)*(ix)) + (marx*varrw)
                                    
	                                    if(ix > 0) {
                                        
	                                        var prv = varr[iy][ix-1]
	                                        if(prv[?FFk.cmpnt_type] == FF_component.lbl
	                                            and prv[?FFk.bound][2] != noone) {
                                            
	                                            var x1o = cmp[?FFk.xy][0]
	                                            cmp[?FFk.xy][0] = prv[?FFk.bound][2] + marx
	                                            w_dlt = abs(x1o-cmp[?FFk.xy][0])
                                            
	                                        }
                                        
                                        
	                                    }
                                    
	                                    cmp[?FFk.xy][1] = con_tot_h+content_h+mary
	                                    cmp[?FFk.xy][2] = cmp[?FFk.xy][0] + cmp_w + w_dlt
	                                    cmp[?FFk.xy][3] = cmp[?FFk.xy][1] + (mary*2)
	                                    used_h = max(used_h,(cmp[?FFk.xy][3]-cmp[?FFk.xy][1])+mary)
	                                    */
                                    
	                                    // Bounds
	                                    cmp[?FFk.bound] = []
	                                    if(prvx == noone) cmp[?FFk.bound][0] = cmp[?FFk.xy][0]-marx
	                                    else cmp[?FFk.bound][0] = cmp[?FFk.xy][0]
	                                    if(prvy == noone) cmp[?FFk.bound][1] = cmp[?FFk.xy][1]-mary
	                                    else cmp[?FFk.bound][1] = cmp[?FFk.xy][1]
	                                    cmp[?FFk.bound][2] = cmp[?FFk.xy][2]+marx
	                                    cmp[?FFk.bound][3] = cmp[?FFk.xy][3]+mary
                                    
	                                    // Tally Used
	                                    used_h = max(used_h,(cmp[?FFk.bound][3]-cmp[?FFk.bound][1]))
	                                    used_w += (cmp[?FFk.bound][2]-cmp[?FFk.bound][0])
                                    
	                                    if(M.FF.debug_components) trace("Success!")
                                    
	                                    break
                                    
	                                }
                                
	                            #endregion
                            
	                            #region Toggle
                                
	                                case FF_component.togl: {
                                    
	                                    if(M.FF.debug_components) trace("Setup Toggle..")
                                    
	                                    // Init x1/y1
	                                    if(prvx == noone) cmp[?FFk.xy][0] = x1               // If first on X-Axis..
	                                    else cmp[?FFk.xy][0] = prvx[?FFk.bound][2]          // If not first on X-Axis..
	                                    if(prvy == noone) cmp[?FFk.xy][1] = y1               // If first on Y-Axis..
	                                    else cmp[?FFk.xy][1] = prvy[?FFk.bound][3]          // If not first on Y-Axis..
                                    
	                                    // Init x2/y
	                                    var avg_pct = (cmp[?FFk.w_pct]+cmp[?FFk.h_pct])/2
	                                    var avg_wh = (eh+ew)/2
	                                    cmp[?FFk.xy][2] = cmp[?FFk.xy][0] + round(avg_pct*avg_wh)
	                                    cmp[?FFk.xy][3] = cmp[?FFk.xy][1] + round(avg_pct*avg_wh)
                                    
	                                    cmp[?FFk.w] = cmp[?FFk.xy][2]-cmp[?FFk.xy][0]
	                                    cmp[?FFk.h] = cmp[?FFk.xy][3]-cmp[?FFk.xy][1]
                                    
	                                    /* Legacy
	                                    cmp[?FFk.xy][1] = con_tot_h + content_h + mary
	                                    cmp[?FFk.xy][3] = cmp[?FFk.xy][1] + (mary*2)
                                    
	                                    var h = cmp[?FFk.xy][3] - cmp[?FFk.xy][1]
	                                    var x_adj = ((((e[?FFk.w]/varrw)*(ix+1))-(e[?FFk.w]/(2*varrw)))-(h/2))-(string_width(cmp[?FFk.str])/2)
	                                    cmp[?FFk.xy][0] = e[?FFk.xy][0] + x_adj
	                                    cmp[?FFk.xy][2] = cmp[?FFk.xy][0] + h
	                                    used_h = max(used_h,(cmp[?FFk.xy][3]-cmp[?FFk.xy][1])+mary)
                                    
	                                    // Set Right Bound (For Text Wrapping)
	                                    cmp[?FFk.bound] = []
	                                    if(ix+1 < varrw) {
	                                        var cmp2 = varr[iy][ix+1]
	                                        var x_adj2 = (((((e[?FFk.w]/varrw)*(ix+2))-(e[?FFk.w]/(2*varrw)))-(h/2))-(string_width(cmp2[?FFk.str])/2))-M.FF.margin.SM
	                                        cmp[?FFk.bound][2] = e[?FFk.xy][0] + x_adj2
	                                    } else cmp[?FFk.bound][2] = e[?FFk.xy][2] - M.FF.margin.SM
	                                    */
                                    
	                                    // Space for Text
	                                    var txt_adj = 0
	                                    if(cmp[?FFk.str] != noone or cmp[?FFk.str] != "")
	                                        txt_adj = (cmp[?FFk.w]*2)
                                    
	                                    // Bounds
	                                    cmp[?FFk.bound] = []
	                                    if(prvx == noone) cmp[?FFk.bound][0] = cmp[?FFk.xy][0]-marx
	                                    else cmp[?FFk.bound][0] = cmp[?FFk.xy][0]
	                                    if(prvy == noone) cmp[?FFk.bound][1] = cmp[?FFk.xy][1]-mary
	                                    else cmp[?FFk.bound][1] = cmp[?FFk.xy][1]
	                                    cmp[?FFk.bound][2] = cmp[?FFk.xy][2]+marx+txt_adj
	                                    cmp[?FFk.bound][3] = cmp[?FFk.xy][3]+mary
                                    
	                                    // Tally Used
	                                    used_h = max(used_h,(cmp[?FFk.bound][3]-cmp[?FFk.bound][1]))
	                                    used_w += (cmp[?FFk.bound][2]-cmp[?FFk.bound][0])
                                    
	                                    if(M.FF.debug_components) trace("Success!")
                                    
	                                    break
                                    
	                                }
                                
	                            #endregion
                            
	                            #region Dropdown
                                
	                                case FF_component.drop: {
                                    
	                                    if(M.FF.debug_components) trace("Setup Dropdown..")
                                    
	                                    // Init x1/y1
	                                    if(prvx == noone) cmp[?FFk.xy][0] = x1               // If first on X-Axis..
	                                    else cmp[?FFk.xy][0] = prvx[?FFk.bound][2]          // If not first on X-Axis..
	                                    if(prvy == noone) cmp[?FFk.xy][1] = y1               // If first on Y-Axis..
	                                    else cmp[?FFk.xy][1] = prvy[?FFk.bound][3]          // If not first on Y-Axis..
                                    
	                                    // Init x2/y
	                                    cmp[?FFk.xy][2] = cmp[?FFk.xy][0] + round(cmp[?FFk.w_pct]*ew)
	                                    cmp[?FFk.xy][3] = cmp[?FFk.xy][1] + round(cmp[?FFk.h_pct]*eh)
                                    
	                                    /* Legacy
	                                    cmp[?FFk.xy][0] = e[?FFk.xy][0] + ((e[?FFk.w]/varrw)*(ix)) + (marx*varrw)
	                                    cmp[?FFk.xy][1] = con_tot_h + content_h + mary
	                                    cmp[?FFk.xy][2] = cmp[?FFk.xy][0] + cmp_w
	                                    cmp[?FFk.xy][3] = cmp[?FFk.xy][1] + (mary*2)
	                                    used_h = max(used_h,(cmp[?FFk.xy][3]-cmp[?FFk.xy][1])+mary)
	                                    */
                                    
	                                    // Bounds
	                                    cmp[?FFk.bound] = []
	                                    if(prvx == noone) cmp[?FFk.bound][0] = cmp[?FFk.xy][0]-marx
	                                    else cmp[?FFk.bound][0] = cmp[?FFk.xy][0]
	                                    if(prvy == noone) cmp[?FFk.bound][1] = cmp[?FFk.xy][1]-mary
	                                    else cmp[?FFk.bound][1] = cmp[?FFk.xy][1]
	                                    cmp[?FFk.bound][2] = cmp[?FFk.xy][2]+marx
	                                    cmp[?FFk.bound][3] = cmp[?FFk.xy][3]+mary
                                    
	                                    // Tally Used
	                                    used_h = max(used_h,(cmp[?FFk.bound][3]-cmp[?FFk.bound][1]))
	                                    used_w += (cmp[?FFk.bound][2]-cmp[?FFk.bound][0])
                                    
	                                    if(M.FF.debug_components) trace("Success!")
                                    
	                                    break
                                    
	                                }
                                
	                            #endregion
                            
	                            #region Horizontal Spacer
                                
	                                case FF_component.horiz_spcr: {
                                    
	                                    if(M.FF.debug_components) trace("Setup Horizontal Spacer..")
                                    
	                                    // Init x1/y1
	                                    if(prvx == noone) cmp[?FFk.xy][0] = x1               // If first on X-Axis..
	                                    else cmp[?FFk.xy][0] = prvx[?FFk.bound][2]        // If not first on X-Axis..
	                                    if(prvy == noone) cmp[?FFk.xy][1] = y1               // If first on Y-Axis..
	                                    else cmp[?FFk.xy][1] = prvy[?FFk.bound][3]+round(M.FF.margin.STR_H*0.25)        // If not first on Y-Axis..
                                    
	                                    cmp[?FFk.xy][2] = cmp[?FFk.xy][0] + round(cmp[?FFk.w_pct]*ew)
	                                    cmp[?FFk.xy][3] = cmp[?FFk.xy][1] + round(cmp[?FFk.h_pct]*eh) + round(M.FF.margin.STR_H*0.25)
                                    
	                                    cmp[?FFk.w] = cmp[?FFk.xy][2]-cmp[?FFk.xy][0]
	                                    cmp[?FFk.h] = cmp[?FFk.xy][3]-cmp[?FFk.xy][1]
                                    
	                                    /*
	                                    cmp[?FFk.w_mx] = e[?FFk.w]
	                                    cmp[?FFk.w] = cmp[?FFk.w_mx]*cmp[?FFk.w_mult]
                                    
	                                    var midx = e[?FFk.xy][0]+((e[?FFk.xy][2]-e[?FFk.xy][0])/2)
                                    
	                                    cmp[?FFk.xy][0] = midx - (cmp[?FFk.w]/2)
	                                    cmp[?FFk.xy][1] = content_h + mary
	                                    cmp[?FFk.xy][2] = midx + (cmp[?FFk.w]/2)
	                                    cmp[?FFk.xy][3] = cmp[?FFk.xy][1] + mary*2
	                                    if(cmp[?FFk.type] == FF_spacer.bar_fill
	                                        or cmp[?FFk.type] == FF_spacer.bar_line)
	                                        used_h = max(used_h,mary*3)
	                                    else used_h = max(used_h,mary*2)
                                    
	                                    cmp[?FFk.h] = cmp[?FFk.xy][3]-cmp[?FFk.xy][1]
	                                    */
                                    
	                                    // Bounds
	                                    cmp[?FFk.bound] = []
	                                    if(prvx == noone) cmp[?FFk.bound][0] = cmp[?FFk.xy][0]-marx
	                                    else cmp[?FFk.bound][0] = cmp[?FFk.xy][0]
	                                    if(prvy == noone) cmp[?FFk.bound][1] = cmp[?FFk.xy][1]-mary
	                                    else cmp[?FFk.bound][1] = cmp[?FFk.xy][1]-round(M.FF.margin.STR_H*0.25)
	                                    cmp[?FFk.bound][2] = cmp[?FFk.xy][2]+marx
	                                    cmp[?FFk.bound][3] = cmp[?FFk.xy][3]+mary
	                                    used_h = max(used_h,(cmp[?FFk.bound][3]-cmp[?FFk.bound][1]))
	                                    used_w += (cmp[?FFk.bound][2]-cmp[?FFk.bound][0])
                                    
	                                    if(M.FF.debug_components) trace("Success!")
                                    
	                                    break
                                    
	                                }
                                
	                            #endregion
                            
	                            #region Vertical Spacer
                                
	                                case FF_component.vert_spcr: {
                                    
	                                    if(M.FF.debug_components) trace("Setup Vertical Spacer..")
                                    
	                                    // Init x1/y1
	                                    if(prvx == noone) cmp[?FFk.xy][0] = x1               // If first on X-Axis..
	                                    else cmp[?FFk.xy][0] = prvx[?FFk.bound][2]          // If not first on X-Axis..
	                                    if(prvy == noone) cmp[?FFk.xy][1] = y1               // If first on Y-Axis..
	                                    else cmp[?FFk.xy][1] = prvy[?FFk.bound][3]          // If not first on Y-Axis..
                                    
	                                    // Init x2/y
	                                    cmp[?FFk.xy][2] = cmp[?FFk.xy][0] + round(cmp[?FFk.w_pct]*ew)
	                                    cmp[?FFk.xy][3] = cmp[?FFk.xy][1] + round(cmp[?FFk.h_pct]*eh)
                                    
	                                    /* Legacy
	                                    // Update width relative to frame size based on initial setting
	                                    cmp[?FFk.h_mx] = e[?FFk.h]
	                                    cmp[?FFk.h] = cmp[?FFk.h_mx]*cmp[?FFk.h_mult]
                                    
	                                    // Init x1
	                                    if(prvx == noone) cmp[?FFk.xy][0] = e[?FFk.xy][0] + marx
	                                    else if(prvx != noone and !is_undefined(prvx[?FFk.bound]))
	                                        cmp[?FFk.xy][0] = prvx[?FFk.bound][2]
	                                    else cmp[?FFk.xy][0] = e[?FFk.xy][0] + ((e[?FFk.w]/varrw)*(ix)) + (marx*varrw)
                                    
	                                    cmp[?FFk.xy][1] = con_tot_h + content_h + mary
	                                    cmp[?FFk.xy][2] = cmp[?FFk.xy][0]
	                                    cmp[?FFk.xy][3] = cmp[?FFk.xy][1] + cmp[?FFk.h] - mary
	                                    used_h = max(used_h,cmp[?FFk.xy][3]-cmp[?FFk.xy][1])
	                                    */
                                    
	                                    // Bounds
	                                    cmp[?FFk.bound] = []
	                                    if(prvx == noone) cmp[?FFk.bound][0] = cmp[?FFk.xy][0]-marx
	                                    else cmp[?FFk.bound][0] = cmp[?FFk.xy][0]
	                                    if(prvy == noone) cmp[?FFk.bound][1] = cmp[?FFk.xy][1]-mary
	                                    else cmp[?FFk.bound][1] = cmp[?FFk.xy][1]
	                                    cmp[?FFk.bound][2] = cmp[?FFk.xy][2]+marx
	                                    cmp[?FFk.bound][3] = cmp[?FFk.xy][3]+mary
                                    
	                                    // Tally Used
	                                    used_h = max(used_h,(cmp[?FFk.bound][3]-cmp[?FFk.bound][1]))
	                                    used_w += (cmp[?FFk.bound][2]-cmp[?FFk.bound][0])
                                    
	                                    if(M.FF.debug_components) trace("Success!")
                                    
	                                    break
                                    
	                                }
                                
	                            #endregion
                            
	                            #region Input field
                                
	                                case FF_component.inpf: {
                                    
	                                    if(M.FF.debug_components) trace("Setup Input Field..")
                                    
	                                    // Init x1/y1
	                                    if(prvx == noone) cmp[?FFk.xy][0] = x1               // If first on X-Axis..
	                                    else cmp[?FFk.xy][0] = prvx[?FFk.bound][2]          // If not first on X-Axis..
	                                    if(prvy == noone) cmp[?FFk.xy][1] = y1               // If first on Y-Axis..
	                                    else cmp[?FFk.xy][1] = prvy[?FFk.bound][3]          // If not first on Y-Axis..
                                    
	                                    // String Adjust
	                                    var h_adj = 0
	                                    if(cmp[?FFk.str] != noone and cmp[?FFk.str] != "") {
                                        
	                                        h_adj = round(M.FF.margin.STR_H*1.34)
	                                        cmp[?FFk.xy][1] += h_adj
                                        
	                                    }
                                    
	                                    // Init x2/y
	                                    cmp[?FFk.xy][2] = cmp[?FFk.xy][0] + round(cmp[?FFk.w_pct]*ew)
	                                    cmp[?FFk.xy][3] = cmp[?FFk.xy][1] + M.FF.margin.STR_H*1.5
                                    
	                                    /* Legacy
	                                    cmp[?FFk.xy][0] = e[?FFk.xy][0] + ((e[?FFk.w]/varrw)*(ix)) + (marx*varrw)
	                                    cmp[?FFk.xy][1] = (con_tot_h + content_h + mary) + cmp[?FFk.offy]
	                                    cmp[?FFk.xy][2] = cmp[?FFk.xy][0] + cmp_w
	                                    cmp[?FFk.xy][3] = (cmp[?FFk.xy][1] + M.FF.margin.STR_H+(M.FF.margin.SM*2))
	                                    used_h = max(used_h,((cmp[?FFk.xy][3]-cmp[?FFk.xy][1])+mary)+cmp[?FFk.offy])
	                                    */
                                    
	                                    // Bounds
	                                    cmp[?FFk.bound] = []
	                                    if(prvx == noone) cmp[?FFk.bound][0] = cmp[?FFk.xy][0]-marx
	                                    else cmp[?FFk.bound][0] = cmp[?FFk.xy][0]
	                                    if(prvy == noone) cmp[?FFk.bound][1] = cmp[?FFk.xy][1]-(mary+h_adj)
	                                    else cmp[?FFk.bound][1] = cmp[?FFk.xy][1]-h_adj
	                                    cmp[?FFk.bound][2] = cmp[?FFk.xy][2]+marx
	                                    cmp[?FFk.bound][3] = cmp[?FFk.xy][3]+mary
                                    
	                                    // Tally Used
	                                    used_h = max(used_h,(cmp[?FFk.bound][3]-cmp[?FFk.bound][1]))
	                                    used_w += (cmp[?FFk.bound][2]-cmp[?FFk.bound][0])
                                    
	                                    if(M.FF.debug_components) trace("Success!")
                                    
	                                    break
                                    
	                                }
                                
	                            #endregion
                            
	                            #region Multi-Line Field
                                
	                                case FF_component.multf: {
                                    
	                                    if(M.FF.debug_components) trace("Setup Multi-Line Field/Area..")
                                    
	                                    // Init x1/y1
	                                    if(prvx == noone) cmp[?FFk.xy][0] = x1               // If first on X-Axis..
	                                    else cmp[?FFk.xy][0] = prvx[?FFk.bound][2]          // If not first on X-Axis..
	                                    if(prvy == noone) cmp[?FFk.xy][1] = y1               // If first on Y-Axis..
	                                    else cmp[?FFk.xy][1] = prvy[?FFk.bound][3]          // If not first on Y-Axis..
                                    
	                                    // Init x2/y
	                                    cmp[?FFk.xy][2] = cmp[?FFk.xy][0] + round(cmp[?FFk.w_pct]*ew)
	                                    cmp[?FFk.xy][3] = cmp[?FFk.xy][1] + round(cmp[?FFk.h_pct]*eh)
                                    
	                                    // Set Width/Height
	                                    cmp[?FFk.w] = cmp[?FFk.xy][2] - cmp[?FFk.xy][0]
	                                    cmp[?FFk.h] = cmp[?FFk.xy][3] - cmp[?FFk.xy][1]
                                    
	                                    /* Legacy
	                                    // Init x1
	                                    if(prvx == noone) cmp[?FFk.xy][0] = e[?FFk.xy][0] + marx
	                                    else if(prvx != noone and !is_undefined(prvx[?FFk.bound]))
	                                        cmp[?FFk.xy][0] = prvx[?FFk.bound][2]
	                                    else cmp[?FFk.xy][0] = e[?FFk.xy][0] + ((e[?FFk.w]/varrw)*(ix)) + (marx*varrw)
                                    
	                                    cmp[?FFk.xy][1] = con_tot_h + content_h + mary
	                                    cmp[?FFk.xy][2] = cmp[?FFk.xy][0] + cmp[?FFk.w]
	                                    cmp[?FFk.xy][3] = cmp[?FFk.xy][1] + cmp[?FFk.h] - mary
	                                    used_h = max(used_h,(cmp[?FFk.xy][3]-cmp[?FFk.xy][1])+mary)
	                                    */
                                    
	                                    // Bounds
	                                    cmp[?FFk.bound] = []
	                                    if(prvx == noone) cmp[?FFk.bound][0] = cmp[?FFk.xy][0]-marx
	                                    else cmp[?FFk.bound][0] = cmp[?FFk.xy][0]
	                                    if(prvy == noone) cmp[?FFk.bound][1] = cmp[?FFk.xy][1]-mary
	                                    else cmp[?FFk.bound][1] = cmp[?FFk.xy][1]
	                                    cmp[?FFk.bound][2] = cmp[?FFk.xy][2]+marx
	                                    cmp[?FFk.bound][3] = cmp[?FFk.xy][3]+mary
                                    
	                                    // Tally Used
	                                    used_h = max(used_h,(cmp[?FFk.bound][3]-cmp[?FFk.bound][1]))
	                                    used_w += (cmp[?FFk.bound][2]-cmp[?FFk.bound][0])
                                    
	                                    if(M.FF.debug_components) trace("Success!")
                                    
	                                    break
                                    
	                                }
                                
	                            #endregion
                            
	                            #region Label
                                
	                                case FF_component.lbl: {
                                    
	                                    if(M.FF.debug_components) trace("Setup Label..")
                                    
	                                    // Init x1/y1
	                                    if(prvx == noone) cmp[?FFk.xy][0] = x1               // If first on X-Axis..
	                                    else cmp[?FFk.xy][0] = prvx[?FFk.bound][2]          // If not first on X-Axis..
	                                    if(prvy == noone) cmp[?FFk.xy][1] = y1               // If first on Y-Axis..
	                                    else cmp[?FFk.xy][1] = prvy[?FFk.bound][3]          // If not first on Y-Axis..
                                    
	                                    // Init x2/y
	                                    cmp[?FFk.xy][2] = cmp[?FFk.xy][0] + round(cmp[?FFk.w_pct]*ew)
	                                    cmp[?FFk.xy][3] = cmp[?FFk.xy][1] + round(cmp[?FFk.h_pct]*eh)
                                    
	                                    // Text Width 
	                                    cmp[?FFk.w_mx] = cmp[?FFk.xy][2]-cmp[?FFk.xy][0]
	                                    cmp[?FFk.w] = string_width_ext(cmp[?FFk.str],M.FF.margin.STR_H,cmp[?FFk.w_mx])
                                    
	                                    /* Legacy
	                                    cmp[?FFk.w_mx] = (e[?FFk.w]-(marx*2))/varrw
	                                    cmp[?FFk.w] = string_width_ext(cmp[?FFk.str],M.FF.margin.STR_H,cmp[?FFk.w_mx])
	                                    cmp[?FFk.xy][0] = e[?FFk.xy][0] + ((e[?FFk.w]/varrw)*(ix)) + (marx*varrw)
	                                    cmp[?FFk.xy][1] = con_tot_h + content_h + mary
	                                    cmp[?FFk.xy][2] = cmp[?FFk.xy][0] + cmp[?FFk.w_mx]
	                                    cmp[?FFk.xy][3] = cmp[?FFk.xy][1] + (mary*2)
	                                    used_h = max(used_h,(cmp[?FFk.xy][3]-cmp[?FFk.xy][1])+mary)
	                                    */
                                    
	                                    // Bounds
	                                    cmp[?FFk.bound] = []
	                                    if(prvx == noone) cmp[?FFk.bound][0] = cmp[?FFk.xy][0]-marx
	                                    else cmp[?FFk.bound][0] = cmp[?FFk.xy][0]
	                                    if(prvy == noone) cmp[?FFk.bound][1] = cmp[?FFk.xy][1]-mary
	                                    else cmp[?FFk.bound][1] = cmp[?FFk.xy][1]
	                                    cmp[?FFk.bound][2] = cmp[?FFk.xy][2]+marx
	                                    cmp[?FFk.bound][3] = cmp[?FFk.xy][3]+mary
                                    
	                                    // Tally Used
	                                    used_h = max(used_h,(cmp[?FFk.bound][3]-cmp[?FFk.bound][1]))
	                                    used_w += (cmp[?FFk.bound][2]-cmp[?FFk.bound][0])
                                    
	                                    if(M.FF.debug_components) trace("Success!")
                                    
	                                    break
                                    
	                                }
                                
	                            #endregion
                            
	                            #region Vertical Bar
                                
	                                case FF_component.vbar: {
                                    
	                                    if(M.FF.debug_components) trace("Setup Vertical Bar..")
                                    
	                                    // Init x1/y1
	                                    if(prvx == noone) cmp[?FFk.xy][0] = x1               // If first on X-Axis..
	                                    else cmp[?FFk.xy][0] = prvx[?FFk.bound][2]          // If not first on X-Axis..
	                                    if(prvy == noone) cmp[?FFk.xy][1] = y1               // If first on Y-Axis..
	                                    else cmp[?FFk.xy][1] = prvy[?FFk.bound][3]          // If not first on Y-Axis..
                                    
	                                    // Init x2/y
	                                    cmp[?FFk.xy][2] = cmp[?FFk.xy][0] + round(cmp[?FFk.w_pct]*ew)
	                                    cmp[?FFk.xy][3] = cmp[?FFk.xy][1] + round(cmp[?FFk.h_pct]*eh)
                                    
	                                    /* Legacy
	                                    cmp[?FFk.xy][0] = e[?FFk.xy][0] + ((e[?FFk.w]/varrw)*(ix)) + (marx*varrw) - ((cmp[?FFk.w]))
	                                    cmp[?FFk.xy][1] = con_tot_h + content_h + mary
	                                    cmp[?FFk.xy][2] = cmp[?FFk.xy][0] + (cmp[?FFk.w])
	                                    cmp[?FFk.xy][3] = cmp[?FFk.xy][1] + cmp[?FFk.h]
	                                    used_h = max(used_h,(cmp[?FFk.xy][3]-cmp[?FFk.xy][1])+mary)
	                                    */
                                    
	                                    // Bounds
	                                    cmp[?FFk.bound] = []
	                                    if(prvx == noone) cmp[?FFk.bound][0] = cmp[?FFk.xy][0]-marx
	                                    else cmp[?FFk.bound][0] = cmp[?FFk.xy][0]
	                                    if(prvy == noone) cmp[?FFk.bound][1] = cmp[?FFk.xy][1]-mary
	                                    else cmp[?FFk.bound][1] = cmp[?FFk.xy][1]
	                                    cmp[?FFk.bound][2] = cmp[?FFk.xy][2]+marx
	                                    cmp[?FFk.bound][3] = cmp[?FFk.xy][3]+mary
                                    
	                                    // Tally Used
	                                    used_h = max(used_h,(cmp[?FFk.bound][3]-cmp[?FFk.bound][1]))
	                                    used_w += (cmp[?FFk.bound][2]-cmp[?FFk.bound][0])
                                    
	                                    if(M.FF.debug_components) trace("Success!")
                                    
	                                    break
                                    
	                                }
                                
	                            #endregion
                            
	                            #region Preview
                                
	                                case FF_component.preview: {
                                    
	                                    if(M.FF.debug_components) trace("Setup Preview..")
                                    
	                                    // Init x1/y1
	                                    if(prvx == noone) cmp[?FFk.xy][0] = x1               // If first on X-Axis..
	                                    else cmp[?FFk.xy][0] = prvx[?FFk.bound][2]          // If not first on X-Axis..
	                                    if(prvy == noone) cmp[?FFk.xy][1] = y1               // If first on Y-Axis..
	                                    else cmp[?FFk.xy][1] = prvy[?FFk.bound][3]          // If not first on Y-Axis..
                                    
	                                    // String Adjust
	                                    var h_adj = 0
	                                    if(cmp[?FFk.str] != noone and cmp[?FFk.str] != "") {
                                        
	                                        h_adj = round(M.FF.margin.STR_H*1.34)
	                                        cmp[?FFk.xy][1] += h_adj
                                        
	                                    }
                                    
	                                    // Init x2/y
	                                    cmp[?FFk.xy][2] = cmp[?FFk.xy][0] + round(cmp[?FFk.w_pct]*ew)
	                                    cmp[?FFk.xy][3] = cmp[?FFk.xy][1] + round(cmp[?FFk.h_pct]*eh)
                                    
	                                    // Set Width/Height
	                                    cmp[?FFk.w] = cmp[?FFk.xy][2] - cmp[?FFk.xy][0]
	                                    cmp[?FFk.h] = cmp[?FFk.xy][3] - cmp[?FFk.xy][1]
                                    
	                                    /* Legacy
	                                    var total_w = (e[?FFk.w]/varrw)
	                                    var alotted_w = total_w-marx*2
                                    
	                                    // Start Left
	                                    cmp[?FFk.xy][0] = (e[?FFk.xy][0]+marx) + (total_w*ix)
	                                    cmp[?FFk.xy][1] = con_tot_h + content_h + mary
                                    
	                                    // Adjust X/Y
	                                    // X
	                                    if(cmp[?FFk.hvalign][0] == fa_middle)
	                                        cmp[?FFk.xy][0] += round((alotted_w-cmp[?FFk.w])/2)
	                                    if(cmp[?FFk.hvalign][0] == fa_right)
	                                        cmp[?FFk.xy][0] += round((alotted_w-cmp[?FFk.w]))
	                                    // Y N/A
                                    
	                                    // Add Width/Height
	                                    cmp[?FFk.xy][2] = cmp[?FFk.xy][0] + cmp[?FFk.w]
	                                    cmp[?FFk.xy][3] = cmp[?FFk.xy][1] + cmp[?FFk.h]
	                                    used_h = max(used_h,(cmp[?FFk.xy][3]-cmp[?FFk.xy][1])+mary)
	                                    */
                                    
	                                    // Bounds
	                                    cmp[?FFk.bound] = []
	                                    if(prvx == noone) cmp[?FFk.bound][0] = cmp[?FFk.xy][0]-marx
	                                    else cmp[?FFk.bound][0] = cmp[?FFk.xy][0]
	                                    if(prvy == noone) cmp[?FFk.bound][1] = cmp[?FFk.xy][1]-(mary+h_adj)
	                                    else cmp[?FFk.bound][1] = cmp[?FFk.xy][1]-h_adj
	                                    cmp[?FFk.bound][2] = cmp[?FFk.xy][2]+marx
	                                    cmp[?FFk.bound][3] = cmp[?FFk.xy][3]+mary
                                    
	                                    // Tally Used
	                                    used_h = max(used_h,(cmp[?FFk.bound][3]-cmp[?FFk.bound][1]))
	                                    used_w += (cmp[?FFk.bound][2]-cmp[?FFk.bound][0])
                                    
	                                    if(M.FF.debug_components) trace("Success!")
                                    
	                                    break
                                    
	                                }
                                
	                            #endregion
                            
	                            #region Slot Grid
                                
	                                case FF_component.slot_grid: {
                                    
	                                    if(M.FF.debug_components) trace("Setup Slot Grid..")
                                    
	                                    // Init x1/y1
	                                    if(prvx == noone) cmp[?FFk.xy][0] = x1               // If first on X-Axis..
	                                    else cmp[?FFk.xy][0] = prvx[?FFk.bound][2]          // If not first on X-Axis..
	                                    if(prvy == noone) cmp[?FFk.xy][1] = y1               // If first on Y-Axis..
	                                    else cmp[?FFk.xy][1] = prvy[?FFk.bound][3]          // If not first on Y-Axis..
                                    
	                                    // String Adjust
	                                    var h_adj = 0
	                                    if(cmp[?FFk.str] != noone and cmp[?FFk.str] != "") {
                                        
	                                        h_adj = round(M.FF.margin.STR_H*1.34)
	                                        cmp[?FFk.xy][1] += h_adj
                                        
	                                    }
                                    
	                                    // Init x2/y
	                                    cmp[?FFk.xy][2] = cmp[?FFk.xy][0] + round(cmp[?FFk.w_pct]*ew)
	                                    cmp[?FFk.xy][3] = cmp[?FFk.xy][1] + round(cmp[?FFk.h_pct]*eh)
                                    
	                                    // Set Width/Height
	                                    cmp[?FFk.w] = cmp[?FFk.xy][2] - cmp[?FFk.xy][0]
	                                    cmp[?FFk.h] = cmp[?FFk.xy][3] - cmp[?FFk.xy][1]
                                    
	                                    /* Legacy
	                                    // Default X/Y
	                                    cmp[?FFk.xy][0] = e[?FFk.xy][0] + ((e[?FFk.w]/varrw)*(ix)) + (marx*varrw)
	                                    cmp[?FFk.xy][1] = con_tot_h + content_h + mary
                                    
	                                    // Bound Via Left
                                    
	                                    if(ix > 0) {
                                        
	                                        var cmp_prv = varr[iy][ix-1]
	                                        cmp[?FFk.xy][0] = cmp_prv[?FFk.bound][2]
                                        
	                                    }
                                    
	                                    cmp[?FFk.xy][2] = cmp[?FFk.xy][0] + cmp[?FFk.w]
	                                    cmp[?FFk.xy][3] = cmp[?FFk.xy][1] + cmp[?FFk.h]
	                                    used_h = max(used_h,(cmp[?FFk.xy][3]-cmp[?FFk.xy][1])+mary)
	                                    */
                                    
	                                    // Bounds
	                                    cmp[?FFk.bound] = []
	                                    if(prvx == noone) cmp[?FFk.bound][0] = cmp[?FFk.xy][0]-marx
	                                    else cmp[?FFk.bound][0] = cmp[?FFk.xy][0]
	                                    if(prvy == noone) cmp[?FFk.bound][1] = cmp[?FFk.xy][1]-(mary+h_adj)
	                                    else cmp[?FFk.bound][1] = cmp[?FFk.xy][1]-h_adj
	                                    cmp[?FFk.bound][2] = cmp[?FFk.xy][2]+marx
	                                    cmp[?FFk.bound][3] = cmp[?FFk.xy][3]+mary
                                    
	                                    // Tally Used
	                                    used_h = max(used_h,(cmp[?FFk.bound][3]-cmp[?FFk.bound][1]))
	                                    used_w += (cmp[?FFk.bound][2]-cmp[?FFk.bound][0])
                                    
	                                    if(M.FF.debug_components) trace("Success!")
                                    
	                                    break
                                    
	                                }
                                
	                            #endregion
                            
	                            #region Component List
                                
	                                case FF_component.cmp_list: {
                                    
	                                    if(M.FF.debug_components) trace("Setup Component List..")
                                    
	                                    // Init x1/y1
	                                    if(prvx == noone) cmp[?FFk.xy][0] = x1               // If first on X-Axis..
	                                    else cmp[?FFk.xy][0] = prvx[?FFk.bound][2]          // If not first on X-Axis..
	                                    if(prvy == noone) cmp[?FFk.xy][1] = y1               // If first on Y-Axis..
	                                    else cmp[?FFk.xy][1] = prvy[?FFk.bound][3]          // If not first on Y-Axis..
                                    
	                                    // Init x2/y
	                                    cmp[?FFk.xy][2] = cmp[?FFk.xy][0] + round(cmp[?FFk.w_pct]*ew)
	                                    cmp[?FFk.xy][3] = cmp[?FFk.xy][1] + round(cmp[?FFk.h_pct]*eh)
                                    
	                                    // Set Width/Height
	                                    cmp[?FFk.w] = cmp[?FFk.xy][2] - cmp[?FFk.xy][0]
	                                    cmp[?FFk.h] = cmp[?FFk.xy][3] - cmp[?FFk.xy][1]
                                    
	                                    /* Legacy
	                                    // Init x1
	                                    if(prvx == noone) cmp[?FFk.xy][0] = e[?FFk.xy][0] + marx
	                                    else if(prvx != noone and !is_undefined(prvx[?FFk.bound]))
	                                        cmp[?FFk.xy][0] = prvx[?FFk.bound][2]
	                                    else cmp[?FFk.xy][0] = e[?FFk.xy][0] + ((e[?FFk.w]/varrw)*(ix)) + (marx*varrw)
                                        
	                                    cmp[?FFk.xy][1] = con_tot_h + content_h + mary
	                                    cmp[?FFk.xy][2] = cmp[?FFk.xy][0] + cmp[?FFk.w]
	                                    cmp[?FFk.xy][3] = cmp[?FFk.xy][1] + cmp[?FFk.h] - mary
	                                    used_h = max(used_h,(cmp[?FFk.xy][3]-cmp[?FFk.xy][1])+mary)
	                                    */
                                    
	                                    // Bounds
	                                    cmp[?FFk.bound] = []
	                                    if(prvx == noone) cmp[?FFk.bound][0] = cmp[?FFk.xy][0]-marx
	                                    else cmp[?FFk.bound][0] = cmp[?FFk.xy][0]
	                                    if(prvy == noone) cmp[?FFk.bound][1] = cmp[?FFk.xy][1]-mary
	                                    else cmp[?FFk.bound][1] = cmp[?FFk.xy][1]
	                                    cmp[?FFk.bound][2] = cmp[?FFk.xy][2]+marx
	                                    cmp[?FFk.bound][3] = cmp[?FFk.xy][3]+mary
                                    
	                                    // Tally Used
	                                    used_h = max(used_h,(cmp[?FFk.bound][3]-cmp[?FFk.bound][1]))
	                                    used_w += (cmp[?FFk.bound][2]-cmp[?FFk.bound][0])
                                    
	                                    if(M.FF.debug_components) trace("Success!")
                                    
	                                    break
                                    
	                                }
                                
	                            #endregion
                            
	                            #region Container
                                
	                                case FF_component.contain: {
                                    
	                                    if(M.FF.debug_components) trace("Setup Container..")
                                    
	                                    // Init x1/y1
	                                    if(prvx == noone) cmp[?FFk.xy][0] = x1               // If first on X-Axis..
	                                    else cmp[?FFk.xy][0] = prvx[?FFk.bound][2]          // If not first on X-Axis..
	                                    if(prvy == noone) cmp[?FFk.xy][1] = y1               // If first on Y-Axis..
	                                    else cmp[?FFk.xy][1] = prvy[?FFk.bound][3]          // If not first on Y-Axis..
                                    
	                                    // Init x2/y
	                                    cmp[?FFk.xy][2] = cmp[?FFk.xy][0] + round(cmp[?FFk.w_pct]*ew)
	                                    cmp[?FFk.xy][3] = cmp[?FFk.xy][1] + round(cmp[?FFk.h_pct]*eh)
                                    
	                                    // Set Width/Height
	                                    cmp[?FFk.w] = cmp[?FFk.xy][2] - cmp[?FFk.xy][0]
	                                    cmp[?FFk.h] = cmp[?FFk.xy][3] - cmp[?FFk.xy][1]
                                    
	                                    /* Legacy
	                                    // Init x1
	                                    if(prvx == noone) cmp[?FFk.xy][0] = e[?FFk.xy][0] + marx
	                                    else if(prvx != noone and !is_undefined(prvx[?FFk.bound]))
	                                        cmp[?FFk.xy][0] = prvx[?FFk.bound][2]
	                                    else cmp[?FFk.xy][0] = e[?FFk.xy][0] + ((e[?FFk.w]/varrw)*(ix)) + (marx*varrw)
                                    
	                                    cmp[?FFk.xy][1] = con_tot_h + content_h + mary
	                                    cmp[?FFk.xy][2] = cmp[?FFk.xy][0] + cmp[?FFk.w]
	                                    cmp[?FFk.xy][3] = cmp[?FFk.xy][1] + cmp[?FFk.h] - mary
	                                    used_h = max(used_h,(cmp[?FFk.xy][3]-cmp[?FFk.xy][1])+mary)
	                                    */
                                    
	                                    // Bounds
	                                    cmp[?FFk.bound] = []
	                                    if(prvx == noone) cmp[?FFk.bound][0] = cmp[?FFk.xy][0]-marx
	                                    else cmp[?FFk.bound][0] = cmp[?FFk.xy][0]
	                                    if(prvy == noone) cmp[?FFk.bound][1] = cmp[?FFk.xy][1]-mary
	                                    else cmp[?FFk.bound][1] = cmp[?FFk.xy][1]
	                                    cmp[?FFk.bound][2] = cmp[?FFk.xy][2]+marx
	                                    cmp[?FFk.bound][3] = cmp[?FFk.xy][3]+mary
                                    
	                                    // Tally Used
	                                    used_h = max(used_h,(cmp[?FFk.bound][3]-cmp[?FFk.bound][1]))
	                                    used_w += (cmp[?FFk.bound][2]-cmp[?FFk.bound][0])
                                    
	                                    if(M.FF.debug_components) trace("Success!")
                                    
	                                    break
                                    
	                                }
                                
	                            #endregion
                            
	                        }
                        
	                    #endregion
                    
	                    // ABORT ABORT ABORT ABORT ABORT
	                    if(M.FF.frame.draw_break) return [content_h,i,in_cmp]
	                    // ABORT ABORT ABORT ABORT ABORT
                    
	                    // Subtract width used from remaining (per component)
	                    remw -= used_w
                    
	                } else if(realignx and !realigny and !do_draw) {
                    
	                    if(M.FF.debug_components) trace("Realign x..")
                    
	                    // TODO: ADD LEFT/RIGHT/BOTTOM/TOP ALIGNMENTS
	                    #region Realign Row w/ Tallest on row & reamining width
                        
	                        // X Realign
	                        if(remw > 0) {
                            
	                            if(hv[0] == fa_middle
	                                or hv[0] == fa_center) {
                                
	                                var addx = floor((remw/varrw)*(ix+(ix+1)))
	                                cmp[?FFk.xy][0] += ceil(addx*0.5)
	                                cmp[?FFk.xy][2] += floor(addx*0.5)
	                                cmp[?FFk.bound][0] += ceil(addx*0.5)
	                                cmp[?FFk.bound][2] += floor(addx*0.5)
                                
	                            }
                            
	                        }
                        
	                        // Y Realign
	                        var adj_h = used_h-(cmp[?FFk.bound][3]-cmp[?FFk.bound][1])
	                        if(adj_h > 0) {
                            
	                            if(hv[1] == fa_middle
	                                or hv[1] == fa_center) {
                                
	                                var addy = adj_h*0.5
	                                cmp[?FFk.xy][1] += ceil(addy)
	                                cmp[?FFk.xy][3] += floor(addy)
	                                cmp[?FFk.bound][1] += ceil(addy)
	                                cmp[?FFk.bound][3] += floor(addy)
                                
	                            }
                            
	                        }
                        
	                    #endregion
                    
	                    if(M.FF.debug_components) trace("Success!")
                    
	                } else if(realigny and !do_draw) {
                    
	                    if(M.FF.debug_components) trace("Realign y..")
                    
	                    #region Distribute Remaining H
                        
	                        if(hv[1] == fa_middle
	                            or hv[1] == fa_center) {
                            
	                            cmp[?FFk.xy][1] += remh_div
	                            cmp[?FFk.xy][3] += remh_div
	                            cmp[?FFk.bound][1] += remh_div
	                            cmp[?FFk.bound][3] += remh_div
                            
	                        }
                            
	                    #endregion
                    
	                    if(M.FF.debug_components) trace("Success!")
                    
	                } else if(do_draw) {
                    
	                    #region Call Drawing Functions
                        
	                        switch(cmp[?FFk.cmpnt_type]) {
                            
	                            #region Button
                                
	                                case FF_component.btn: {
                                    
	                                    if(M.FF.debug_components) trace("Draw Button..")
                                    
	                                    if(button_draw(cmp))
	                                        in_cmp = true
                                    
	                                    #region Debug Bounds
                                        
	                                        if(M.FF.debug_bounds) {
                                            
	                                            draw_set_alpha(.5)
	                                            draw_set_color(c_red)
	                                            draw_rectangle(cmp[?FFk.bound][0],cmp[?FFk.bound][1],cmp[?FFk.bound][2],cmp[?FFk.bound][3],false)
                                            
	                                        }
                                        
	                                    #endregion
                                    
	                                    if(M.FF.debug_components) trace("Success!")
                                    
	                                    break
                                    
	                                }
                                
	                            #endregion
                            
	                            #region Bind Button
                                
	                                case FF_component.bnd_btn: {
                                    
	                                    if(M.FF.debug_components) trace("Draw Bind Button..")
                                    
	                                    if(bind_button_draw(cmp))
	                                        in_cmp = true
                                    
	                                    #region Debug Bounds
                                        
	                                        if(M.FF.debug_bounds) {
                                            
	                                            draw_set_alpha(.5)
	                                            draw_set_color(c_red)
	                                            draw_rectangle(cmp[?FFk.bound][0],cmp[?FFk.bound][1],cmp[?FFk.bound][2],cmp[?FFk.bound][3],false)
                                            
	                                        }
                                        
	                                    #endregion
                                    
	                                    if(M.FF.debug_components) trace("Success!")
                                    
	                                    break
                                    
	                                }
                                
	                            #endregion
                            
	                            #region Entry Button
                                
	                                case FF_component.ent_btn: {
                                    
	                                    if(M.FF.debug_components) trace("Draw Entry Button..")
                                    
	                                    if(entry_button_draw(cmp))
	                                        in_cmp = true
                                    
	                                    #region Debug Bounds
                                        
	                                        if(M.FF.debug_bounds) {
                                            
	                                            draw_set_alpha(.5)
	                                            draw_set_color(c_red)
	                                            draw_rectangle(cmp[?FFk.bound][0],cmp[?FFk.bound][1],cmp[?FFk.bound][2],cmp[?FFk.bound][3],false)
                                            
	                                        }
                                        
	                                    #endregion
                                    
	                                    if(M.FF.debug_components) trace("Success!")
                                    
	                                    break
                                    
	                                }
                                
	                            #endregion
                            
	                            #region Slider
                                
	                                case FF_component.sldr: {
                                    
	                                    if(M.FF.debug_components) trace("Draw Slider..")
                                    
	                                    if(slider_draw(cmp))
	                                        in_cmp = true
                                    
	                                    #region Debug Bounds
                                        
	                                        if(M.FF.debug_bounds) {
                                            
	                                            draw_set_alpha(.5)
	                                            draw_set_color(c_red)
	                                            draw_rectangle(cmp[?FFk.bound][0],cmp[?FFk.bound][1],cmp[?FFk.bound][2],cmp[?FFk.bound][3],false)
                                            
	                                        }
                                        
	                                    #endregion
                                    
	                                    if(M.FF.debug_components) trace("Success!")
                                    
	                                    break
                                    
	                                }
                                
	                            #endregion
                            
	                            #region Picker
                                
	                                case FF_component.pckr: {
                                    
	                                    if(M.FF.debug_components) trace("Draw Picker..")
                                    
	                                    if(picker_draw(cmp))
	                                        in_cmp = true
                                    
	                                    #region Debug Bounds
                                        
	                                        if(M.FF.debug_bounds) {
                                            
	                                            draw_set_alpha(.5)
	                                            draw_set_color(c_red)
	                                            draw_rectangle(cmp[?FFk.bound][0],cmp[?FFk.bound][1],cmp[?FFk.bound][2],cmp[?FFk.bound][3],false)
                                            
	                                        }
                                        
	                                    #endregion
                                    
	                                    if(M.FF.debug_components) trace("Success!")
                                    
	                                    break
                                    
	                                }
                                
	                            #endregion
                            
	                            #region Color Picker
                                
	                                case FF_component.col_pckr: {
                                    
	                                    if(M.FF.debug_components) trace("Draw Color Picker..")
                                    
	                                    if(color_picker_draw(cmp))
	                                        in_cmp = true
                                    
	                                    #region Debug Bounds
                                        
	                                        if(M.FF.debug_bounds) {
                                            
	                                            draw_set_alpha(.5)
	                                            draw_set_color(c_red)
	                                            draw_rectangle(cmp[?FFk.bound][0],cmp[?FFk.bound][1],cmp[?FFk.bound][2],cmp[?FFk.bound][3],false)
                                            
	                                        }
                                        
	                                    #endregion
                                    
	                                    if(M.FF.debug_components) trace("Success!")
                                    
	                                    break
                                    
	                                }
                                
	                            #endregion
                            
	                            #region Iterator
                                
	                                case FF_component.iter: {
                                    
	                                    if(M.FF.debug_components) trace("Draw Iterator..")
                                    
	                                    if(iterator_draw(cmp))
	                                        in_cmp = true
                                    
	                                    #region Debug Bounds
                                        
	                                        if(M.FF.debug_bounds) {
                                            
	                                            draw_set_alpha(.5)
	                                            draw_set_color(c_red)
	                                            draw_rectangle(cmp[?FFk.bound][0],cmp[?FFk.bound][1],cmp[?FFk.bound][2],cmp[?FFk.bound][3],false)
                                            
	                                        }
                                        
	                                    #endregion
                                    
	                                    if(M.FF.debug_components) trace("Success!")
                                    
	                                    break
                                    
	                                }
                                
	                            #endregion
                            
	                            #region Toggle
                                
	                                case FF_component.togl: {
                                    
	                                    if(M.FF.debug_components) trace("Draw Toggle..")
                                    
	                                    if(toggle_draw(cmp))
	                                        in_cmp = true
                                    
	                                    #region Debug Bounds
                                        
	                                        if(M.FF.debug_bounds) {
                                            
	                                            draw_set_alpha(.5)
	                                            draw_set_color(c_red)
	                                            draw_rectangle(cmp[?FFk.bound][0],cmp[?FFk.bound][1],cmp[?FFk.bound][2],cmp[?FFk.bound][3],false)
                                            
	                                        }
                                        
	                                    #endregion
                                    
	                                    if(M.FF.debug_components) trace("Success!")
                                    
	                                    break
                                    
	                                }
                                
	                            #endregion
                            
	                            #region Dropdown
                                
	                                case FF_component.drop: {
                                    
	                                    if(M.FF.debug_components) trace("Draw Dropdown..")
                                    
	                                    if(dropdown_draw(cmp))
	                                        in_cmp = true
                                    
	                                    #region Debug Bounds
                                        
	                                        if(M.FF.debug_bounds) {
                                            
	                                            draw_set_alpha(.5)
	                                            draw_set_color(c_red)
	                                            draw_rectangle(cmp[?FFk.bound][0],cmp[?FFk.bound][1],cmp[?FFk.bound][2],cmp[?FFk.bound][3],false)
                                            
	                                        }
                                        
	                                    #endregion
                                    
	                                    if(M.FF.debug_components) trace("Success!")
                                    
	                                    break
                                    
	                                }
                                
	                            #endregion
                            
	                            #region Horizontal Spacer
                                
	                                case FF_component.horiz_spcr: {
                                    
	                                    if(M.FF.debug_components) trace("Draw Horizontal Spacer..")
                                    
	                                    if(horiz_space_draw(cmp))
	                                        in_cmp = true
                                    
	                                    #region Debug Bounds
                                        
	                                        if(M.FF.debug_bounds) {
                                            
	                                            draw_set_alpha(.5)
	                                            draw_set_color(c_red)
	                                            draw_rectangle(cmp[?FFk.bound][0],cmp[?FFk.bound][1],cmp[?FFk.bound][2],cmp[?FFk.bound][3],false)
                                            
	                                        }
                                        
	                                    #endregion
                                    
	                                    if(M.FF.debug_components) trace("Success!")
                                    
	                                    break
                                    
	                                }
                                
	                            #endregion
                            
	                            #region Vertical Spacer
                                
	                                case FF_component.vert_spcr: {
                                    
	                                    if(M.FF.debug_components) trace("Draw Vertical Spacer..")
                                    
	                                    if(vert_space_draw(cmp))
	                                        in_cmp = true
                                    
	                                    #region Debug Bounds
                                        
	                                        if(M.FF.debug_bounds) {
                                            
	                                            draw_set_alpha(.5)
	                                            draw_set_color(c_red)
	                                            draw_rectangle(cmp[?FFk.bound][0],cmp[?FFk.bound][1],cmp[?FFk.bound][2],cmp[?FFk.bound][3],false)
                                            
	                                        }
                                        
	                                    #endregion
                                    
	                                    if(M.FF.debug_components) trace("Success!")
                                    
	                                    break
                                    
	                                }
                                
	                            #endregion
                            
	                            #region Input field
                                
	                                case FF_component.inpf: {
                                    
	                                    if(M.FF.debug_components) trace("Draw Input Field..")
                                    
	                                    if(input_field_draw(cmp))
	                                        in_cmp = true
                                    
	                                    #region Debug Bounds
                                        
	                                        if(M.FF.debug_bounds) {
                                            
	                                            draw_set_alpha(.5)
	                                            draw_set_color(c_red)
	                                            draw_rectangle(cmp[?FFk.bound][0],cmp[?FFk.bound][1],cmp[?FFk.bound][2],cmp[?FFk.bound][3],false)
                                            
	                                        }
                                        
	                                    #endregion
                                    
	                                    if(M.FF.debug_components) trace("Success!")
                                    
	                                    break
                                    
	                                }
                                
	                            #endregion
                            
	                            #region Multiline Field
                                
	                                case FF_component.multf: {
                                    
	                                    if(M.FF.debug_components) trace("Draw Multi-Line Field/Area..")
                                    
	                                    if(multi_field_draw(cmp))
	                                        in_cmp = true
                                    
	                                    #region Debug Bounds
                                        
	                                        if(M.FF.debug_bounds) {
                                            
	                                            draw_set_alpha(.5)
	                                            draw_set_color(c_red)
	                                            draw_rectangle(cmp[?FFk.bound][0],cmp[?FFk.bound][1],cmp[?FFk.bound][2],cmp[?FFk.bound][3],false)
                                            
	                                        }
                                        
	                                    #endregion
                                    
	                                    if(M.FF.debug_components) trace("Success!")
                                    
	                                    break
                                    
	                                }
                                
	                            #endregion
                            
	                            #region Label
                                
	                                case FF_component.lbl: {
                                    
	                                    if(M.FF.debug_components) trace("Draw Label..")
                                    
	                                    if(label_draw(cmp))
	                                        in_cmp = true
                                    
	                                    #region Debug Bounds
                                        
	                                        if(M.FF.debug_bounds) {
                                            
	                                            draw_set_alpha(.5)
	                                            draw_set_color(c_red)
	                                            draw_rectangle(cmp[?FFk.bound][0],cmp[?FFk.bound][1],cmp[?FFk.bound][2],cmp[?FFk.bound][3],false)
                                            
	                                        }
                                        
	                                    #endregion
                                    
	                                    if(M.FF.debug_components) trace("Success!")
                                    
	                                    break
                                    
	                                }
                                
	                            #endregion
                            
	                            #region Vertical Bar
                                
	                                case FF_component.vbar: {
                                    
	                                    if(M.FF.debug_components) trace("Draw Vertical Bar..")
                                    
	                                    if(vert_bar_draw(cmp))
	                                        in_cmp = true
                                    
	                                    #region Debug Bounds
                                        
	                                        if(M.FF.debug_bounds) {
                                            
	                                            draw_set_alpha(.5)
	                                            draw_set_color(c_red)
	                                            draw_rectangle(cmp[?FFk.bound][0],cmp[?FFk.bound][1],cmp[?FFk.bound][2],cmp[?FFk.bound][3],false)
                                            
	                                        }
                                        
	                                    #endregion
                                    
	                                    if(M.FF.debug_components) trace("Success!")
                                    
	                                    break
                                    
	                                }
                                
	                            #endregion
                            
	                            #region Preview
                                
	                                case FF_component.preview: {
                                    
	                                    if(M.FF.debug_components) trace("Draw Preview..")
                                    
	                                    if(preview_draw(cmp))
	                                        in_cmp = true
                                    
	                                    #region Debug Bounds
                                        
	                                        if(M.FF.debug_bounds) {
                                            
	                                            draw_set_alpha(.5)
	                                            draw_set_color(c_red)
	                                            draw_rectangle(cmp[?FFk.bound][0],cmp[?FFk.bound][1],cmp[?FFk.bound][2],cmp[?FFk.bound][3],false)
                                            
	                                        }
                                        
	                                    #endregion
                                    
	                                    if(M.FF.debug_components) trace("Success!")
                                    
	                                    break
                                    
	                                }
                                
	                            #endregion
                            
	                            #region Slot Grid
                                
	                                case FF_component.slot_grid: {
                                    
	                                    if(M.FF.debug_components) trace("Draw Slot Grid..")
                                    
	                                    if(slot_grid_draw(cmp))
	                                        in_cmp = true
                                    
	                                    #region Debug Bounds
                                        
	                                        if(M.FF.debug_bounds) {
                                            
	                                            draw_set_alpha(.5)
	                                            draw_set_color(c_red)
	                                            draw_rectangle(cmp[?FFk.bound][0],cmp[?FFk.bound][1],cmp[?FFk.bound][2],cmp[?FFk.bound][3],false)
                                            
	                                        }
                                        
	                                    #endregion
                                    
	                                    if(M.FF.debug_components) trace("Success!")
                                    
	                                    break
                                    
	                                }
                                
	                            #endregion
                            
	                            #region Component List
                                
	                                case FF_component.cmp_list: {
                                    
	                                    if(M.FF.debug_components) trace("Draw Component List..")
                                    
	                                    if(cmp_list_draw(cmp))
	                                        in_cmp = true
                                    
	                                    #region Debug Bounds
                                        
	                                        if(M.FF.debug_bounds) {
                                            
	                                            draw_set_alpha(.5)
	                                            draw_set_color(c_red)
	                                            draw_rectangle(cmp[?FFk.bound][0],cmp[?FFk.bound][1],cmp[?FFk.bound][2],cmp[?FFk.bound][3],false)
                                            
	                                        }
                                        
	                                    #endregion
                                    
	                                    if(M.FF.debug_components) trace("Success!")
                                    
	                                    break
                                    
	                                }
                                
	                            #endregion
                            
	                            #region Container
                                
	                                case FF_component.contain: {
                                    
	                                    if(M.FF.debug_components) trace("Draw Container..")
                                    
	                                    if(container_draw(cmp))
	                                        in_cmp = true
                                    
	                                    #region Debug Bounds
                                        
	                                        if(M.FF.debug_bounds) {
                                            
	                                            draw_set_alpha(.5)
	                                            draw_set_color(c_red)
	                                            draw_rectangle(cmp[?FFk.bound][0],cmp[?FFk.bound][1],cmp[?FFk.bound][2],cmp[?FFk.bound][3],false)
                                            
	                                        }
                                        
	                                    #endregion
                                    
	                                    if(M.FF.debug_components) trace("Success!")
                                    
	                                    break
                                    
	                                }
                                
	                            #endregion
                            
	                        }
                        
	                    #endregion
                    
	                }
                
	            #endregion
            
	            #region Trigger different stages & reloop
                
	                // Reset X Loop for realigning w/ Remaining Width and Tallest
	                if(ix == varrw-1 and !realignx and !realigny and !do_draw) {
                    
	                    // Init and break to realignx stage
	                    realignx = true
	                    ix = -1
                
	                }
                
	                // Reset X+Y Loops for Realigning w/ remh or Drawing
	                if(iy == varrh-1 and ix == varrw-1 and !realigny and !do_draw
	                    and remh > 0 and varrh > 1 and !e[?FFk.resize] and !e[?FFk.autosize]) {
                    
	                    // Init realigny Stage
	                    realigny = true
	                    ix = -1
	                    iy = -1
                    
	                    // Finalize Content_h
	                    content_h += used_h
	                    remh -= used_h
                    
	                    // Init remh_div
	                    remh_div = remh
	                    if(varrh > 1) remh_div = remh/(varrh)
	                    remh = 0
                    
	                    // Break to realigny stage
	                    break
                    
	                } else if(iy == varrh-1 and ix == varrw-1 and !do_draw) {
                    
	                    // Init and break to draw stage
	                    do_draw = true
	                    ix = -1
	                    iy = -1
                    
	                    break
                    
	                }
                
	            #endregion
            
	        }
        
	        // ABORT ABORT ABORT ABORT ABORT
	        if(M.FF.frame.draw_break) return [content_h,i,in_cmp]
	        // ABORT ABORT ABORT ABORT ABORT
        
	        if(!realigny) {
            
	            content_h += used_h
	            remh -= used_h
            
	        }
        
	    }
    
	#endregion

	return [content_h,i,in_cmp]

}

function frame_minimize() {
	
	var e = argument0
	var w2 = e[?FFk.w]/2
	var h2 = e[?FFk.h]/2
	
	#region Init CFG Vars
		
	    var ttl = e[?FFk.ttl_cfg]         // Title
	    var tg = e[?FFk.tg_cfg]           // Tag Group
	    var con = e[?FFk.con_cfg]         // Console
	    var out = con[?FFk.out_cfg]         // Output
	    var npt = con[?FFk.inp_cfg]        // Input
	    var crt = npt[?FFk.carot_cfg]     // Carot
	    var cmpn = e[?FFk.cmpnt_cfg]      // Component
		
	#endregion
	
	ttl[?FFk.mbtn] = !ttl[?FFk.mbtn]
	
	// Set new width/height; Made sloppy xx/yy adjustements
	// inorder to stop window from moving around when (un)minimizing
	if(ttl[?FFk.mbtn]) {
		
	    e[?FFk.wo] = e[?FFk.w]
	    e[?FFk.ho] = e[?FFk.h]
	    e[?FFk.xy][2] = e[?FFk.xy][0] + ttl[?FFk.w_mn]
	    e[?FFk.xy][3] = e[?FFk.xy][1] + ttl[?FFk.h]
	    e[?FFk.w] = e[?FFk.xy][2] - e[?FFk.xy][0]
	    e[?FFk.h] = e[?FFk.xy][3] - e[?FFk.xy][1]
		
	} else {
		
	    e[?FFk.xy][2] = e[?FFk.xy][0] + e[?FFk.wo]
	    e[?FFk.xy][3] = e[?FFk.xy][1] + e[?FFk.ho]
	    e[?FFk.w] = e[?FFk.xy][2] - e[?FFk.xy][0]
	    e[?FFk.h] = e[?FFk.xy][3] - e[?FFk.xy][1]
		
	}
	
	return noone
	
}

function update_tabs() {
	
	// Clear tab data
	ds_map_clear(M.FF.frame.tab_array_map)
	
	// Iterate and repopulat tab data
	for(var i = 0; i < ds_list_size(M.FF.frame.map_list); i++) {
		
	    var e = M.FF.frame.map_list[|i]
	    if(!e[?FFk.tab_group]) continue // Skip if tab_group_active disabled
		
	    var tg = e[?FFk.tg_cfg]           // Tag Group
		
	    if(ds_map_exists(M.FF.frame.tab_array_map,tg[?FFk.uid]))
	        M.FF.frame.tab_array_map[?tg[?FFk.uid]][array_length_1d(M.FF.frame.tab_array_map[?tg[?FFk.uid]])] = e[?FFk.uid]
	    else M.FF.frame.tab_array_map[?tg[?FFk.uid]] = [e[?FFk.uid]]
		
	}
	
	return noone
	
}

function enable_title_buttons() {
	
	// Args
	var e = argument0
	
	// Enable
	e[?FFk.xbtn] = true
	e[?FFk.pbtn] = true
	e[?FFk.mbtn] = true
	
	return noone
	
}

function disable_title_buttons() {
	
	// Args
	var e = argument0
	
	// Disable
	e[?FFk.xbtn] = false
	e[?FFk.pbtn] = false
	e[?FFk.mbtn] = false
	
	return noone
	
}

function draw_gui_frames2() {

	if(M.FF.debug) trace("Begin Draw Frames 2")

	var GFMO_update = false

	// Ensure M.FF.frame.focus is Top
	if(M.FF.frame.focus != noone) set_top_frame(M.FF.frame.focus)
	var GFIF_nxt = noone

	for(var i = 0; i < ds_list_size(M.FF.frame.map_list); i++) {
    
	    var e = M.FF.frame.map_list[|i]
    
	    // Skip Inactive
	    if(!e[?FFk.active]) continue

	    #region Init CFG Vars
        
	        var ttl = e[?FFk.ttl_cfg]         // Title
	        var tg = e[?FFk.tg_cfg]           // Tag Group
	        var con = e[?FFk.con_cfg]         // Console
	        var out = con[?FFk.out_cfg]         // Output
	        var npt = con[?FFk.inp_cfg]        // Input
	        var crt = npt[?FFk.carot_cfg]     // Carot
	        var cmpn = e[?FFk.cmpnt_cfg]      // Component
        
	    #endregion
    
	    if(cmpn[?FFk.varr] != noone and !ttl[?FFk.mbtn]) {
        
	        // Init Varr Y
	        var varrh = array_height_2d(cmpn[?FFk.varr])
        
	        for(var iy = 0; iy < varrh; iy++) {
            
	            // Init Varr X
	            var varrw = array_length_2d(cmpn[?FFk.varr],iy)
            
	            for(var ix = 0; ix < varrw; ix++) {
                
	                // Init CMP
	                var cmp = cmpn[?FFk.varr][iy][ix]
	                if(cmp = noone) continue
                
	                switch(cmp[?FFk.cmpnt_type]) {
                    
	                    #region Dropdown Menu
                        
	                        // This is drawn later because the menu
	                        // will need to overlap components below it.
	                        case FF_component.drop: {
                            
	                            var menu = cmp[?FFk.menu_cfg]
	                            var cell = cmp[?FFk.cell_cfg]
	                            var opt = cmp[?FFk.opt_cfg]
                            
	                            // If dropbox state is active, draw and perform dropbox menu logic
	                            if(cmp[?FFk.state]) {
                                
	                                GFMO_update = true
                                
	                                #region Menu Frame
                                    
	                                    // BG
	                                    draw_set_alpha(e[?FFk.bga])
	                                    if(!array_equals(cmp[?FFk.bgc],cmp[?FFk.bgc_o]))
	                                        draw_rectangle_color(menu[?FFk.xy][0],menu[?FFk.xy][1],menu[?FFk.xy][2],menu[?FFk.xy][3],
	                                            cmp[?FFk.bgc_o][0],cmp[?FFk.bgc_o][1],cmp[?FFk.bgc_o][2],cmp[?FFk.bgc_o][3],false)
	                                    else draw_rectangle_color(menu[?FFk.xy][0],menu[?FFk.xy][1],menu[?FFk.xy][2],menu[?FFk.xy][3],
	                                        cmp[?FFk.bgc][0],cmp[?FFk.bgc][1],cmp[?FFk.bgc][2],cmp[?FFk.bgc][3],false)
                                    
	                                    // FG
	                                    draw_set_alpha(e[?FFk.fga])
	                                    draw_rectangle_color(menu[?FFk.xy][0],menu[?FFk.xy][1],menu[?FFk.xy][2],menu[?FFk.xy][3],
	                                        cmp[?FFk.fgc][0],cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],true)
                                    
	                                #endregion
                                
	                                // Init Menu Stuff
	                                var c_cnt = round(menu[?FFk.h]/cell[?FFk.h])
	                                var scrolled = false // To make sure we only scroll one at a time.
                                
	                                #region Draw Dropdown Menu & Logic
                                    
                                    
	                                    // Invert Menu Foreground (To make them look like buttons, this is done weirdly here since usually we only do it with BG)
	                                    if(array_equals(cmp[?FFk.fgc],cmp[?FFk.fgc_o]))
	                                        cmp[?FFk.fgc] = invert_array(cmp[?FFk.fgc])
	                                    for(var iz = 0; iz < c_cnt; iz++) {
                                        
	                                        var cy = cell[?FFk.h]*iz
                                        
	                                        if(mouse_x-M.FF.surface_xy[0] > menu[?FFk.xy][0]-M.FF.margin.SM and mouse_x-M.FF.surface_xy[0] < menu[?FFk.xy][2]+M.FF.margin.SM
	                                            and mouse_y-M.FF.surface_xy[1] > menu[?FFk.xy][1]-M.FF.margin.SM and mouse_y-M.FF.surface_xy[1] < menu[?FFk.xy][3]+M.FF.margin.SM) {
                                            
	                                            // Menu Scroll
	                                            if(M.FF.MWU and !scrolled) {           // Up
                                                
	                                                opt[?FFk.scrolly] = clamp(opt[?FFk.scrolly]-1,0,array_length_1d(opt[?FFk.arr])-c_cnt)
	                                                scrolled = true
                                                
	                                            } else if(M.FF.MWD and !scrolled) {    // Down
                                                
	                                                opt[?FFk.scrolly] = clamp(opt[?FFk.scrolly]+1,0,array_length_1d(opt[?FFk.arr])-c_cnt)
	                                                scrolled = true
                                                
	                                            }
                                            
	                                            if(mouse_y > menu[?FFk.xy][1]+cy
	                                                and mouse_y < menu[?FFk.xy][1]+(cy+cell[?FFk.h])) { // In Menu Cell
                                                
	                                                draw_set_alpha(cmp[?FFk.fga]) 
	                                                if(M.FF.MBL and !array_equals(cmp[?FFk.fgc],cmp[?FFk.fgc_o]))
	                                                    cmp[?FFk.fgc] = array_dupe(cmp[?FFk.fgc],cmp[?FFk.fgc_o]) // Un-invert when clicking
	                                                else if(array_equals(cmp[?FFk.fgc],cmp[?FFk.fgc_o]))
	                                                    cmp[?FFk.fgc] = invert_array(cmp[?FFk.fgc]) // When not clicking.. Reinvert
	                                                draw_rectangle_color(menu[?FFk.xy][0]+M.FF.margin.SM,menu[?FFk.xy][1]+cy+M.FF.margin.SM,menu[?FFk.xy][2]-M.FF.margin.SM,
	                                                    menu[?FFk.xy][1]+(cy+cell[?FFk.h])-M.FF.margin.SM,cmp[?FFk.fgc][0],cmp[?FFk.fgc][1], cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],false)
                                                
	                                                if(M.FF.MBLR) {
                                                    
	                                                    opt[?FFk.val] = opt[?FFk.scrolly]+iz
	                                                    cmp[?FFk.state] = false
	                                                    M.FF.frame.focus = i // Incase menu stretches outside frame, keep frame focused
	                                                    dropwdown_action(cmp)
                                                    
	                                                }
                                                
	                                            }
                                            
	                                            // Re-invert for next button
	                                            if(array_equals(cmp[?FFk.fgc],cmp[?FFk.fgc_o]))
	                                                cmp[?FFk.fgc] = invert_array(cmp[?FFk.fgc])
                                            
	                                        }
                                            
	                                        if(!(mouse_x-M.FF.surface_xy[0] > menu[?FFk.xy][0]-M.FF.margin.SM and mouse_x-M.FF.surface_xy[0] < menu[?FFk.xy][2]+M.FF.margin.SM
	                                            and mouse_y-M.FF.surface_xy[1] > menu[?FFk.xy][1]+cy and mouse_y-M.FF.surface_xy[1] < menu[?FFk.xy][1]+(cy+cell[?FFk.h]))) { // In Menu Cell
                                            
	                                            draw_set_alpha(cmp[?FFk.fga]*.75)
	                                            draw_rectangle_color(menu[?FFk.xy][0]+M.FF.margin.SM,menu[?FFk.xy][1]+cy+M.FF.margin.SM,menu[?FFk.xy][2]-M.FF.margin.SM,
	                                                menu[?FFk.xy][1]+(cy+cell[?FFk.h])-M.FF.margin.SM,cmp[?FFk.fgc][0],cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],false)
                                            
	                                        }
                                        
	                                        var txt = opt[?FFk.arr][opt[?FFk.scrolly]+iz].str
	                                        var txtx = menu[?FFk.xy][0]+((menu[?FFk.xy][2]-menu[?FFk.xy][0])/2)
	                                        var txty = menu[?FFk.xy][1]+cy+(cell[?FFk.h]/2)
	                                        draw_set_halign(fa_middle)
	                                        draw_set_valign(fa_center)
	                                        draw_text_ext_color(txtx,txty,txt,M.FF.margin.STR_H,menu[?FFk.w],cmp[?FFk.bgc][0],
	                                            cmp[?FFk.bgc][1],cmp[?FFk.bgc][2],cmp[?FFk.bgc][3],cmp[?FFk.fga])
                                        
	                                    }
                                    
	                                    // Un-invert FGC, we're done drawing buttons.
	                                    if(!array_equals(cmp[?FFk.fgc],cmp[?FFk.fgc_o]))
	                                        cmp[?FFk.fgc] = array_dupe(cmp[?FFk.fgc],cmp[?FFk.fgc_o])
                                    
	                                #endregion
                                
	                            }
                            
	                            break
                            
	                        }
                        
	                    #endregion
                    
	                    #region Vert Bar (ToolTip)
                        
	                        case FF_component.vbar: {
                            
	                            // Draw Tool Tip if Inside Bar
	                            if(mouse_x-M.FF.surface_xy[0] > cmp[?FFk.xy][0]-M.FF.margin.SM and mouse_x-M.FF.surface_xy[0] < cmp[?FFk.xy][2]+M.FF.margin.SM
	                                and mouse_y-M.FF.surface_xy[1] > cmp[?FFk.xy][1]-M.FF.margin.SM and mouse_y-M.FF.surface_xy[1] < cmp[?FFk.xy][3]+M.FF.margin.SM
	                                and cmp[?FFk.active] and !M.FF.frame.menu_override and !cmp[?FFk.override]) {
                                    
	                                    draw_tool_tip(e,cmp[?FFk.str_arr])
                                    
	                            }
                            
	                            break
                            
	                        }
                        
	                    #endregion
                    
	                    #region Slot Grid (Scroll Bar)
                        
	                        case FF_component.slot_grid: {
                            
	                            #region Interaction/Hilight Logic
                                
	                                // Init
	                                var mar = 4
	                                var cols = ds_grid_width(cmp[?FFk.grid])
	                                var rows = ds_grid_height(cmp[?FFk.grid])
	                                var sw = cmp[?FFk.w]/cols
	                                var sh = cmp[?FFk.h]/rows
	                                if(cmp[?FFk.scl_w]) sh = sw
	                                if(cmp[?FFk.scl_h]) sw = sh
	                                var h_cnt = round(cmp[?FFk.h]/sh)
                                
	                                if(mouse_x-M.FF.surface_xy[0] > cmp[?FFk.xy][0]-M.FF.margin.SM and mouse_x-M.FF.surface_xy[0] < cmp[?FFk.xy][2]+M.FF.margin.SM
	                                    and mouse_y-M.FF.surface_xy[1] > cmp[?FFk.xy][1]-M.FF.margin.SM and mouse_y-M.FF.surface_xy[1] < cmp[?FFk.xy][3]+M.FF.margin.SM
	                                    and cmp[?FFk.active] and !M.FF.frame.menu_override and !cmp[?FFk.override]) {
                                    
	                                    if(cmp[?FFk.scroll]) {
                                        
	                                        #region Draw Scroll Bar
                                            
	                                            // Init
	                                            var sb_w = M.FF.margin.BG
	                                            var sb_h = ceil(cmp[?FFk.h]*(h_cnt/rows))
	                                            var sbbg_xy = []
	                                            sbbg_xy[0] = cmp[?FFk.xy][2]
	                                            sbbg_xy[1] = cmp[?FFk.xy][1]
	                                            sbbg_xy[2] = sbbg_xy[0] + sb_w
	                                            sbbg_xy[3] = cmp[?FFk.xy][3]
	                                            var per = ceil((cmp[?FFk.h]-sb_h)/rows+1)
	                                            if(is_nan(per)) break   // If nothing to scroll, don'true draw scroll bar at all
	                                            var sbfg_xy = []
	                                            sbfg_xy[0] = cmp[?FFk.xy][2]
	                                            sbfg_xy[1] = cmp[?FFk.xy][1]+(per*abs(cmp[?FFk.scrolly]))
	                                            sbfg_xy[2] = sbfg_xy[0] + sb_w
	                                            sbfg_xy[3] = (sbfg_xy[1]) + sb_h
                                            
	                                            // Adjust for ending margins for sbfg
	                                            // (Incase scrollbar doesn'true reach or goes past the bg)
	                                            var adj = sbbg_xy[3]-sbfg_xy[3]
	                                            if(adj < per) sbfg_xy[3] += adj
                                            
	                                            // BG
	                                            draw_set_alpha(1)
	                                            draw_rectangle_color(sbbg_xy[0],sbbg_xy[1],sbbg_xy[2],sbbg_xy[3],
	                                                cmp[?FFk.bgc][0],cmp[?FFk.bgc][1],cmp[?FFk.bgc][2],cmp[?FFk.bgc][3],false)
                                            
	                                            // Bar BG
	                                            draw_set_alpha(1)
	                                            draw_rectangle_color(sbfg_xy[0],sbfg_xy[1],sbfg_xy[2],sbfg_xy[3],
	                                                cmp[?FFk.fgc][0],cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],false)
                                            
	                                            // Bar FG
	                                            draw_set_alpha(1)
	                                            draw_rectangle_color(sbfg_xy[0],sbfg_xy[1],sbfg_xy[2],sbfg_xy[3],
	                                                cmp[?FFk.fgc][3],cmp[?FFk.fgc][2],cmp[?FFk.fgc][1],cmp[?FFk.fgc][0],true)
                                            
	                                            // FG
	                                            draw_set_alpha(1)
	                                            draw_rectangle_color(sbbg_xy[0],sbbg_xy[1],sbbg_xy[2],sbbg_xy[3],
	                                                cmp[?FFk.fgc][3],cmp[?FFk.fgc][2],cmp[?FFk.fgc][1],cmp[?FFk.fgc][0],true)
                                            
	                                        #endregion
                                        
	                                    }
                                    
	                                }
                                
	                            #endregion
                            
	                            break
                                
	                        }
                        
	                    #endregion
                    
	                    #region Component List (Scroll Bar)
                        
	                        case FF_component.cmp_list: {
                            
	                            #region Interaction/Hilight Logic
                                
	                                // Init
	                                var l_sz = ds_list_size(cmp[?FFk.cmp_list])
	                                if(mouse_x-M.FF.surface_xy[0] > cmp[?FFk.xy][0]-M.FF.margin.SM and mouse_x-M.FF.surface_xy[0] < cmp[?FFk.xy][2]+M.FF.margin.SM
	                                    and mouse_y-M.FF.surface_xy[1] > cmp[?FFk.xy][1]-M.FF.margin.SM and mouse_y-M.FF.surface_xy[1] < cmp[?FFk.xy][3]+M.FF.margin.SM
	                                    and cmp[?FFk.active] and !M.FF.frame.menu_override and !cmp[?FFk.override]) {
                                    
	                                    if(cmp[?FFk.scroll]) {
                                        
	                                        #region Draw Scroll Bar
                                            
	                                            // Init
	                                            var h = cmp[?FFk.xy][3] - cmp[?FFk.xy][1]
	                                            var sb_w = M.FF.margin.BG
	                                            var sb_h = round(h/l_sz)
	                                            var per = pct(cmp[?FFk.scrolly],cmp[?FFk.scrolly_mn],cmp[?FFk.scrolly_mx])
	                                            if(is_nan(per)) break   // If nothing to scroll, don'true draw scroll bar at all
                                            
	                                            // Scrollbar BG/FG XYs
	                                            var sbbg_xy = []
	                                            sbbg_xy[0] = cmp[?FFk.xy][2]
	                                            sbbg_xy[1] = cmp[?FFk.xy][1]
	                                            sbbg_xy[2] = sbbg_xy[0] + sb_w
	                                            sbbg_xy[3] = cmp[?FFk.xy][3]
	                                            var sbfg_xy = []
	                                            sbfg_xy[0] = cmp[?FFk.xy][2]
	                                            sbfg_xy[1] = (cmp[?FFk.xy][3]-(per*(h-sb_h)))-sb_h
	                                            sbfg_xy[2] = sbfg_xy[0] + sb_w
	                                            sbfg_xy[3] = (sbfg_xy[1]) + sb_h
                                            
	                                            // Adjust for ending margins for sbfg
	                                            // (Incase scrollbar doesn'true reach or goes past the bg)
	                                            var adj = sbbg_xy[3]-sbfg_xy[3]
	                                            if(adj < per) sbfg_xy[3] += adj
                                            
	                                            // Draw
	                                            // BG
	                                            draw_set_alpha(1)
	                                            draw_rectangle_color(sbbg_xy[0],sbbg_xy[1],sbbg_xy[2],sbbg_xy[3],
	                                                cmp[?FFk.bgc][3],cmp[?FFk.bgc][2],cmp[?FFk.bgc][1],cmp[?FFk.bgc][0],false)
                                            
	                                            // Bar BG
	                                            draw_set_alpha(1)
	                                            draw_rectangle_color(sbfg_xy[0],sbfg_xy[1],sbfg_xy[2],sbfg_xy[3],
	                                                cmp[?FFk.fgc][3],cmp[?FFk.fgc][2],cmp[?FFk.fgc][1],cmp[?FFk.fgc][0],false)
                                            
	                                            // Bar FG
	                                            draw_set_alpha(1)
	                                            draw_rectangle_color(sbfg_xy[0],sbfg_xy[1],sbfg_xy[2],sbfg_xy[3],
	                                                cmp[?FFk.fgc][0],cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],true)
                                            
	                                            // FG
	                                            draw_set_alpha(1)
	                                            draw_rectangle_color(sbbg_xy[0],sbbg_xy[1],sbbg_xy[2],sbbg_xy[3],
	                                                cmp[?FFk.fgc][0],cmp[?FFk.fgc][1],cmp[?FFk.fgc][2],cmp[?FFk.fgc][3],true)
                                            
	                                        #endregion
                                        
	                                    }
                                    
	                                }
                                
	                            #endregion
                            
	                            break
                                
	                        }
                        
	                    #endregion
                    
	                }
                
	            }
            
	        }
        
	    }

	}

	M.FF.frame.menu_override = GFMO_update

	if(M.FF.debug) trace("End Draw Frames 2")

}

function is_tab_group_active() {
	
	// Arg
	var tab_group_uid = argument0
	
	// Iterate and repopulat tab data
	for(var i = 0; i < ds_list_size(M.FF.frame.map_list); i++) {
		
	    var e = M.FF.frame.map_list[|i]
	    if(e[?FFk.tg_cfg][?FFk.uid] == tab_group_uid and e[?FFk.tab_group] and e[?FFk.active]) return true
		
	}
	
	return false
	
}

function cmpnt_find_type_first() {
	
	#region Params
		
	    var varr = argument0
	    var toFind = argument1
		
	#endregion
	
	var result = noone
	var varrh = array_height_2d(varr)
	for(var iy = 0; iy < varrh; iy++) {
		
	    var varrw = array_length_2d(varr,iy)
	    for(var ix = 0; ix < varrw; ix++) {
			
	        if(varr[iy][ix][?FFk.cmpnt_type] == toFind) {
				
	            result = [iy,ix]
	            break
				
	        }
			
	    }
		
	    if(result != noone) break
		
	}
	
	return result
	
}

function cmpnt_find_type_last() {
	
	#region Params
		
	    var varr = argument0
	    var toFind = argument1
		
	#endregion
	
	var result = noone
	var varrh = array_height_2d(varr)
	for(var iy = 0; iy < varrh; iy++) {
		
	    var varrw = array_length_2d(varr,iy)
	    for(var ix = 0; ix < varrw; ix++) {
			
	        if(varr[iy][ix][?FFk.cmpnt_type] == toFind)
	            result = [iy,ix]
				
	    }
		
	}
	
	return result
	
}

function prompt_player_creation() {
	
	#region Params
		
	    var w = argument0
	    var h = argument1
	    var hvalign = argument2
	    var pmli = argument3
		
	#endregion
	
	#region Create Query
		
	    // Get Player Data
	    var p = M.FF.player.map_list[|pmli]
	    M.FF.player.focus = pmli
		
	    #region Basic Info; Name - Gender Tab
			
	        // Todos: Multi-Line Bio text input?
			
	        // Make Frame; Dynamic; Tabbed; First
	        var gfi = gui_frame_create(w,h,M.FF.UID.char_basic)
			
	        // Shorten Accessors
	        var e = M.FF.frame.map_list[|gfi]
	        var tg = e[?FFk.tg_cfg]
			
	        // Config Frame
	        e[?FFk.bg] = true
	        e[?FFk.fg] = true
	        e[?FFk.mode] = FF_content.cmpnt
	        e[?FFk.autosize] = true
	        e[?FFk.autodrag] = true
	        e[?FFk.hvalign] = hvalign
	        e[?FFk.title] = true
	        e[?FFk.tab_group] = true
	        tg[?FFk.uid] = M.FF.UID.tg_char
			
	        #region Config Components
				
	            // Init
	            e[?FFk.cmpnt_cfg][?FFk.varr] = [[],[],[]]
	            var varr = e[?FFk.cmpnt_cfg][?FFk.varr]
	            e[?FFk.cmpnt_cfg][?FFk.hvalign] = [fa_middle,fa_center]
				
	            // Char Info header
	            varr[0][0] = horiz_space_create([0,0,0,0],e[?FFk.fgc],e[?FFk.bga],e[?FFk.fgc],e[?FFk.bga],e[?FFk.w]*.8,M.FF.margin.STR_H*2,FF_spacer.line,noone,true)
	            var cmp = varr[0][0]
	            cmp[?FFk.w_pct] = .975
	            cmp[?FFk.h_pct] = .01
	            cmp[?FFk.hvalign] = []
	            cmp[?FFk.hvalign][0] = fa_left
	            cmp[?FFk.hvalign][1] = fa_top
	            cmp[?FFk.str] = "Character Info"
				
	            // First/Last Name Fields
	            varr[1][0] = input_field_create([0,0,0,0],invert_array(e[?FFk.bgc]),e[?FFk.bga],invert_array(e[?FFk.fgc]),e[?FFk.fga],"First Name",FF_input.alpha,FF_action.char_fname,true)
	            cmp = varr[1][0]
	            cmp[?FFk.w_pct] = .45
	            cmp[?FFk.h_pct] = .1
	            cmp[?FFk.hvalign] = []
	            cmp[?FFk.hvalign][0] = fa_middle
	            cmp[?FFk.hvalign][1] = fa_center
	            cmp[?FFk.inp_cfg][?FFk.limit] = 18
	            cmp[?FFk.inp_cfg][?FFk.str] = "First"
	            varr[1][1] = input_field_create([0,0,0,0],invert_array(e[?FFk.bgc]),e[?FFk.bga],invert_array(e[?FFk.fgc]),e[?FFk.fga],"Last Name",FF_input.alpha,FF_action.char_lname,true)
	            cmp = varr[1][1]
	            cmp[?FFk.w_pct] = .45
	            cmp[?FFk.h_pct] = .1
	            cmp[?FFk.hvalign] = []
	            cmp[?FFk.hvalign][0] = fa_middle
	            cmp[?FFk.hvalign][1] = fa_center
	            cmp[?FFk.inp_cfg][?FFk.limit] = 18
	            cmp[?FFk.inp_cfg][?FFk.str] = "Last"
				
	            // Gender Toggles
	            varr[2][0] = toggle_create([0,0,0,0],invert_array(e[?FFk.bgc]),e[?FFk.bga],invert_array(e[?FFk.fgc]),e[?FFk.fga],"Male",M.FF.runtime_vertical_sync,[[FF_action.tog_tog,FF_action.inv,FF_action.char_male],noone,noone],true)
	            cmp = varr[2][0]
	            cmp[?FFk.w_pct] = .1
	            cmp[?FFk.h_pct] = .1
	            cmp[?FFk.hvalign] = []
	            cmp[?FFk.hvalign][0] = fa_middle
	            cmp[?FFk.hvalign][1] = fa_center
	            cmp[?FFk.state] = true
	            varr[2][1] = toggle_create([0,0,0,0],invert_array(e[?FFk.bgc]),e[?FFk.bga],invert_array(e[?FFk.fgc]),e[?FFk.fga],"Female",M.FF.runtime_vertical_sync,[[FF_action.tog_tog,FF_action.inv,FF_action.char_female],varr[2][0],noone],true)
	            cmp = varr[2][1]
	            cmp[?FFk.w_pct] = .1
	            cmp[?FFk.h_pct] = .1
	            cmp[?FFk.hvalign] = []
	            cmp[?FFk.hvalign][0] = fa_middle
	            cmp[?FFk.hvalign][1] = fa_center
	            varr[2][0][?FFk.action][1] = varr[2][1] // Set action for the first toggle now that the second one is created
				
	        #endregion
			
	        // Basic Info Tab Active First
	        e[?FFk.active] = true
			
	    #endregion
		
	    #region Appearance; Styles/Colors Tab
			
	        // Make Frame; Tabbed
	        var gfi = gui_frame_create(w,h,M.FF.UID.char_appear)
			
	        // Shorten Accessors
	        var e = M.FF.frame.map_list[|gfi]
	        var tg = e[?FFk.tg_cfg]
			
	        // Config Frame
	        e[?FFk.bg] = true
	        e[?FFk.fg] = true
	        e[?FFk.mode] = FF_content.cmpnt
	        e[?FFk.autosize] = true
	        e[?FFk.autodrag] = true
	        e[?FFk.hvalign] = hvalign
	        e[?FFk.title] = true
	        e[?FFk.tab_group] = true
	        tg[?FFk.uid] = M.FF.UID.tg_char
			
	        #region Config Components
				
	            // Init
	            e[?FFk.cmpnt_cfg][?FFk.varr] = [[],[],[],[],[]]
	            var varr = e[?FFk.cmpnt_cfg][?FFk.varr]
	            e[?FFk.cmpnt_cfg][?FFk.hvalign] = [fa_middle,fa_center]
				
	            // Char Appear Header
	            varr[0][0] = horiz_space_create([0,0,0,0],e[?FFk.fgc],e[?FFk.bga],e[?FFk.fgc],e[?FFk.bga],e[?FFk.w]*.8,M.FF.margin.STR_H*2,FF_spacer.line,noone,true)
	            var cmp = varr[0][0]
	            cmp[?FFk.w_pct] = .975
	            cmp[?FFk.h_pct] = .01
	            cmp[?FFk.hvalign] = []
	            cmp[?FFk.hvalign][0] = fa_left
	            cmp[?FFk.hvalign][1] = fa_top
	            cmp[?FFk.str] = "Character Appearance"
				
	            #region Color Pickers + Labels
					
	                // First Row
	                varr[1][0] = label_create([0,0,0,0],e[?FFk.fgc],e[?FFk.fga],"Hair Color : ",[fa_middle,fa_center])
	                var cmp = varr[1][0]
	                cmp[?FFk.w_pct] = .3
	                cmp[?FFk.h_pct] = .15
	                varr[1][1] = color_picker_create([0,0,0,0],invert_array(e[?FFk.bgc]),e[?FFk.bga],invert_array(e[?FFk.fgc]),e[?FFk.fga],hair_color_arr(),FF_action.col_hair,true)
	                var cmp = varr[1][1]
	                cmp[?FFk.w_pct] = .6
	                cmp[?FFk.h_pct] = .15
	                cmp[?FFk.hvalign] = []
	                cmp[?FFk.hvalign][0] = fa_middle
	                cmp[?FFk.hvalign][1] = fa_center
					
	                // Next Row
	                varr[2][0] = label_create([0,0,0,0],e[?FFk.fgc],e[?FFk.fga],"Eye  Color : ",[fa_middle,fa_center])
	                var cmp = varr[2][0]
	                cmp[?FFk.w_pct] = .3
	                cmp[?FFk.h_pct] = .15
	                varr[2][1] = color_picker_create([0,0,0,0],invert_array(e[?FFk.bgc]),e[?FFk.bga],invert_array(e[?FFk.fgc]),e[?FFk.fga],eye_color_arr(),FF_action.col_eye,true)
	                var cmp = varr[2][1]
	                cmp[?FFk.w_pct] = .6
	                cmp[?FFk.h_pct] = .15
	                cmp[?FFk.hvalign] = []
	                cmp[?FFk.hvalign][0] = fa_middle
	                cmp[?FFk.hvalign][1] = fa_center
					
	                // Next Row
	                varr[3][0] = label_create([0,0,0,0],e[?FFk.fgc],e[?FFk.fga],"Skin Color : ",[fa_middle,fa_center])
	                var cmp = varr[3][0]
	                cmp[?FFk.w_pct] = .3
	                cmp[?FFk.h_pct] = .15
	                varr[3][1] = color_picker_create([0,0,0,0],invert_array(e[?FFk.bgc]),e[?FFk.bga],invert_array(e[?FFk.fgc]),e[?FFk.fga],skin_color_arr(),FF_action.col_skin,true)
	                var cmp = varr[3][1]
	                cmp[?FFk.w_pct] = .6
	                cmp[?FFk.h_pct] = .15
	                cmp[?FFk.hvalign] = []
	                cmp[?FFk.hvalign][0] = fa_middle
	                cmp[?FFk.hvalign][1] = fa_center
					
	                // Last Row
	                varr[4][0] = label_create([0,0,0,0],e[?FFk.fgc],e[?FFk.fga],"Underwear: ",[fa_middle,fa_center])
	                var cmp = varr[4][0]
	                cmp[?FFk.w_pct] = .3
	                cmp[?FFk.h_pct] = .15
	                varr[4][1] = color_picker_create([0,0,0,0],invert_array(e[?FFk.bgc]),e[?FFk.bga],invert_array(e[?FFk.fgc]),e[?FFk.fga],cloth_color_arr(),FF_action.col_und,true)
	                var cmp = varr[4][1]
	                cmp[?FFk.w_pct] = .6
	                cmp[?FFk.h_pct] = .15
	                cmp[?FFk.hvalign] = []
	                cmp[?FFk.hvalign][0] = fa_middle
	                cmp[?FFk.hvalign][1] = fa_center
					
	            #endregion
				
	            // Preview
	            varr[5][0] = preview_create([0,0,0,0],invert_array(e[?FFk.bgc]),e[?FFk.bga],invert_array(e[?FFk.fgc]),e[?FFk.fga],"",FF_action.none,true)
	            var cmp = varr[5][0]
	            cmp[?FFk.w_pct] = .4
	            cmp[?FFk.h_pct] = .6
	            cmp[?FFk.hvalign] = []
	            cmp[?FFk.hvalign][0] = fa_middle
	            cmp[?FFk.hvalign][1] = fa_center
	            cmp[?FFk.ref] = p
				
	        #endregion
			
	    #endregion
		
	    #region Attributes Tab
			
	        // Init
	        var gfi = gui_frame_create(w,h,M.FF.UID.char_att)
			
	        // Shorten Accessors
	        var e = M.FF.frame.map_list[|gfi]
	        var tg = e[?FFk.tg_cfg]
			
	        // Config Frame
	        e[?FFk.bg] = true
	        e[?FFk.fg] = true
	        e[?FFk.mode] = FF_content.cmpnt
	        e[?FFk.autosize] = true
	        e[?FFk.autodrag] = true
	        e[?FFk.hvalign] = hvalign
	        e[?FFk.title] = true
	        e[?FFk.tab_group] = true
	        tg[?FFk.uid] = M.FF.UID.tg_char
			
	        #region Config Components
				
	            // Init
	            e[?FFk.cmpnt_cfg][?FFk.varr] = [[],[],[],[],[],[],[],[],[]]
	            var varr = e[?FFk.cmpnt_cfg][?FFk.varr]
	            e[?FFk.cmpnt_cfg][?FFk.hvalign] = [fa_middle,fa_center]
				
	            // CFG
	            var cfg = p[?FFk.att_cfg]
				
	            // Stats Header
	            varr[0][0] = horiz_space_create([0,0,0,0],e[?FFk.fgc],e[?FFk.bga],e[?FFk.fgc],e[?FFk.bga],e[?FFk.w]*.8,M.FF.margin.STR_H*2,FF_spacer.line,noone,true)
	            var cmp = varr[0][0]
	            cmp[?FFk.w_pct] = .975
	            cmp[?FFk.h_pct] = .01
	            cmp[?FFk.hvalign] = []
	            cmp[?FFk.hvalign][0] = fa_left
	            cmp[?FFk.hvalign][1] = fa_top
	            cmp[?FFk.str] = "Reassign Attribute Points"
				
	            #region State Iterators
					
		            // First Row
		            varr[1][0] = iterator_create([0,0,0,0],invert_array(e[?FFk.bgc]),e[?FFk.bga],invert_array(e[?FFk.fgc]),e[?FFk.fga],cfg[?FFk.end_cfg],FF_action.iter_end,true)
		            var cmp = varr[1][0]
		            cmp[?FFk.w_pct] = .75
		            cmp[?FFk.h_pct] = .15
		            cmp[?FFk.hvalign] = []
		            cmp[?FFk.hvalign][0] = fa_middle
		            cmp[?FFk.hvalign][1] = fa_center
					
		            // Next Row
		            varr[2][0] = iterator_create([0,0,0,0],invert_array(e[?FFk.bgc]),e[?FFk.bga],invert_array(e[?FFk.fgc]),e[?FFk.fga],cfg[?FFk.str_cfg],FF_action.iter_str,true)
		            var cmp = varr[2][0]
		            cmp[?FFk.w_pct] = .75
		            cmp[?FFk.h_pct] = .15
		            cmp[?FFk.hvalign] = []
		            cmp[?FFk.hvalign][0] = fa_middle
		            cmp[?FFk.hvalign][1] = fa_center
					
		            // Next Row
		            varr[3][0] = iterator_create([0,0,0,0],invert_array(e[?FFk.bgc]),e[?FFk.bga],invert_array(e[?FFk.fgc]),e[?FFk.fga],cfg[?FFk.dex_cfg],FF_action.iter_dex,true)
		            var cmp = varr[3][0]
		            cmp[?FFk.w_pct] = .75
		            cmp[?FFk.h_pct] = .15
		            cmp[?FFk.hvalign] = []
		            cmp[?FFk.hvalign][0] = fa_middle
		            cmp[?FFk.hvalign][1] = fa_center
					
		            // Next Row
		            varr[4][0] = iterator_create([0,0,0,0],invert_array(e[?FFk.bgc]),e[?FFk.bga],invert_array(e[?FFk.fgc]),e[?FFk.fga],cfg[?FFk.int_cfg],FF_action.iter_int,true)
		            var cmp = varr[4][0]
		            cmp[?FFk.w_pct] = .75
		            cmp[?FFk.h_pct] = .15
		            cmp[?FFk.hvalign] = []
		            cmp[?FFk.hvalign][0] = fa_middle
		            cmp[?FFk.hvalign][1] = fa_center
					
		            // Next Row
		            varr[5][0] = iterator_create([0,0,0,0],invert_array(e[?FFk.bgc]),e[?FFk.bga],invert_array(e[?FFk.fgc]),e[?FFk.fga],cfg[?FFk.cha_cfg],FF_action.iter_cha,true)
		            var cmp = varr[5][0]
		            cmp[?FFk.w_pct] = .75
		            cmp[?FFk.h_pct] = .15
		            cmp[?FFk.hvalign] = []
		            cmp[?FFk.hvalign][0] = fa_middle
		            cmp[?FFk.hvalign][1] = fa_center
					
		            // Last Row
		            varr[6][0] = iterator_create([0,0,0,0],invert_array(e[?FFk.bgc]),e[?FFk.bga],invert_array(e[?FFk.fgc]),e[?FFk.fga],cfg[?FFk.fat_cfg],FF_action.iter_fat,true)
		            var cmp = varr[6][0]
		            cmp[?FFk.w_pct] = .75
		            cmp[?FFk.h_pct] = .15
		            cmp[?FFk.hvalign] = []
		            cmp[?FFk.hvalign][0] = fa_middle
		            cmp[?FFk.hvalign][1] = fa_center
					
	            #endregion
				
	            // Point Header
	            varr[7][0] = horiz_space_create([0,0,0,0],e[?FFk.fgc],e[?FFk.bga],e[?FFk.fgc],e[?FFk.bga],e[?FFk.w]*.8,M.FF.margin.STR_H*2,FF_spacer.str_cmplx,noone,true)
	            var cmp = varr[7][0]
	            cmp[?FFk.w_pct] = .975
	            cmp[?FFk.h_pct] = .01
	            cmp[?FFk.hvalign] = []
	            cmp[?FFk.hvalign][0] = fa_middle
	            cmp[?FFk.hvalign][1] = fa_center
	            cmp[?FFk.str_arr] = ["Free: ",[cfg,FFk.free]," / ",[cfg,FFk.total]]
				
	            // Confirm/Cancel Buttons
	            varr[8][0] = button_create([0,0,0,0],invert_array(e[?FFk.bgc]),e[?FFk.bga],invert_array(e[?FFk.fgc]),e[?FFk.fga],"Confirm",FF_action.char_done,true)
	            var cmp = varr[8][0]
	            cmp[?FFk.w_pct] = .4
	            cmp[?FFk.h_pct] = .15
	            cmp[?FFk.hvalign] = []
	            cmp[?FFk.hvalign][0] = fa_middle
	            cmp[?FFk.hvalign][1] = fa_center
	            varr[8][1] = button_create([0,0,0,0],invert_array(e[?FFk.bgc]),e[?FFk.bga],invert_array(e[?FFk.fgc]),e[?FFk.fga],"Cancel",FF_action.char_cancel,true)
	            var cmp = varr[8][1]
	            cmp[?FFk.w_pct] = .4
	            cmp[?FFk.h_pct] = .15
	            cmp[?FFk.hvalign] = []
	            cmp[?FFk.hvalign][0] = fa_middle
	            cmp[?FFk.hvalign][1] = fa_center
				
	        #endregion
			
		    /* TODO TODO TODO TODO
			
		    #region Traits/Skills Tab
				
		        // Init
		        var gfi = gui_frame_create(w,h,"Traits and Skills")
				
		        // Shorten Accessors
		        var e = M.FF.frame.map_list[|gfi]
		        var tg = e[?FFk.tg_cfg]
				
		        // Config Frame
		        e[?FFk.bg] = true
		        e[?FFk.fg] = true
		        e[?FFk.mode] = FF_content.cmpnt
		        e[?FFk.autosize] = true
		        e[?FFk.autodrag] = true
		        e[?FFk.hvalign] = hvalign
		        e[?FFk.title] = true
		        e[?FFk.tab_group] = true
		        tg[?FFk.uid] = M.FF.UID.tg_char
				
		        #region Config Components
					
		            // Init
		            e[?FFk.cmpnt_cfg][?FFk.varr] = [[],[],[]]
		            var varr = e[?FFk.cmpnt_cfg][?FFk.varr]
		            e[?FFk.cmpnt_cfg][?FFk.marginx] = M.FF.margin.MD*2
					
		            // Trait/Skill Header
		            varr[0][0] = horiz_space_create([0,0,0,0],e[?FFk.fgc],e[?FFk.bga],e[?FFk.fgc],e[?FFk.bga],e[?FFk.w]*.8,M.FF.margin.STR_H*2,FF_spacer.line,noone,true)
		            varr[0][0][?FFk.w] = e[?FFk.w]-(M.FF.margin.MD*2)
		            varr[0][0][?FFk.w_mx] = e[?FFk.w]
		            varr[0][0][?FFk.w_mult] = round2(varr[0][0][?FFk.w]/e[?FFk.w],2)
		            varr[0][0][?FFk.str] = "Character Traits & Skills"
		            varr[0][0][?FFk.fill] = false
		            varr[0][0][?FFk.hvalign][0] = fa_left
		            varr[0][0][?FFk.hvalign][1] = fa_bottom
		            varr[0][0][?FFk.line_w] = 1
					
		        #endregion
				
		    #endregion
			
		    */
			
		    // Finally (To update the global tab_group_active variable which is a map of arrays)
		    update_tabs()
			
		#endregion
		
	#endregion
	
	return gfi
	
}

function init_player_hud_stats() {
	
	// Params
	var pmli = argument0
	
	// Init Stat Vars
	var p = M.FF.player.map_list[|pmli]
	var cfg = p[?FFk.stat_cfg]
	var hea = cfg[?FFk.hea_cfg]
	var man = cfg[?FFk.man_cfg]
	var sta = cfg[?FFk.sta_cfg]
	var hun = cfg[?FFk.hun_cfg]
	var thi = cfg[?FFk.thi_cfg]
	var sle = cfg[?FFk.sle_cfg]
	var spe = cfg[?FFk.spe_cfg]
	
	// Init GUI Vars
	var gfi = gui_frame_create(M.FF.margin.RW4,M.FF.margin.RH4,string("{0}{1}{2}",M.FF.UID.hud_stat[0],pmli,M.FF.UID.hud_stat[1]))
	var e = M.FF.frame.map_list[|gfi]
	e[?FFk.fg] = true
	e[?FFk.mode] = FF_content.cmpnt
	e[?FFk.hvalign] = [fa_left,fa_top]
	e[?FFk.autodrag] = true
	e[?FFk.autosize] = true
	     
	#region Componet Config
		
	    // Init Components
	    e[?FFk.cmpnt_cfg][?FFk.varr] = [[],[]]
	    var varr = e[?FFk.cmpnt_cfg][?FFk.varr]
	    e[?FFk.cmpnt_cfg][?FFk.hvalign] = [fa_middle,fa_center]
		
	    // Stats header
	    varr[0][0] = horiz_space_create([0,0,0,0],e[?FFk.fgc],e[?FFk.bga],e[?FFk.fgc],e[?FFk.bga],e[?FFk.w]*.8,M.FF.margin.STR_H*2,FF_spacer.line,noone,true)
	    var cmp = varr[0][0]
	    cmp[?FFk.w_pct] = .975
	    cmp[?FFk.h_pct] = .01
	    cmp[?FFk.hvalign] = []
	    cmp[?FFk.hvalign][0] = fa_left
	    cmp[?FFk.hvalign][1] = fa_top
	    cmp[?FFk.str] = "Stats"
		
	    #region Vertical Bars
			
	        // Health
	        varr[1][0] = vert_bar_create([0,0,0,0],[M.FF.color.red.rgb,M.FF.color.red.rgb,M.FF.color.red.dark.rgb,M.FF.color.red.dark.rgb],1,
	                        [M.FF.color.red.dark.rgb,M.FF.color.red.dark.rgb,M.FF.color.red.rgb,M.FF.color.red.rgb],1,"Health",FF_action.none,true) // Health
	        var cmp = varr[1][0]
	        cmp[?FFk.w_pct] = .075
	        cmp[?FFk.h_pct] = .75
	        cmp[?FFk.hvalign] = []
	        cmp[?FFk.hvalign][0] = fa_middle
	        cmp[?FFk.hvalign][1] = fa_center
	        cmp[?FFk.val_arr] = [[hea,FFk.val],[hea,FFk.val_mn],[hea,FFk.val_mx]]
	        cmp[?FFk.str_arr] = ["Health:",[hea,FFk.val," / ",hea,FFk.val_mx]]
			
	        // Mana
	        varr[1][1] = vert_bar_create([0,0,0,0],[M.FF.color.blue.neon.rgb,M.FF.color.blue.neon.rgb,M.FF.color.blue.dark.rgb,M.FF.color.blue.dark.rgb],1,
	                        [M.FF.color.blue.dark.rgb,M.FF.color.blue.dark.rgb,M.FF.color.blue.neon.rgb,M.FF.color.blue.neon.rgb],1,"Mana",FF_action.none,true) // Mana
	        var cmp = varr[1][1]
	        cmp[?FFk.w_pct] = .075
	        cmp[?FFk.h_pct] = .75
	        cmp[?FFk.hvalign] = []
	        cmp[?FFk.hvalign][0] = fa_middle
	        cmp[?FFk.hvalign][1] = fa_center
	        cmp[?FFk.val_arr] = [[man,FFk.val],[man,FFk.val_mn],[man,FFk.val_mx]]
	        cmp[?FFk.str_arr] = ["Mana:",[man,FFk.val," / ",man,FFk.val_mx]]
			
	        // Stamina
	        varr[1][2] = vert_bar_create([0,0,0,0],[M.FF.color.white.rgb,M.FF.color.white.rgb,M.FF.color.gray.darker.rgb,M.FF.color.gray.darker.rgb],1,
	                        [M.FF.color.gray.darker.rgb,M.FF.color.gray.darker.rgb,M.FF.color.white.rgb,M.FF.color.white.rgb],1,"Stamina",FF_action.none,true) // Stamina
	        var cmp = varr[1][2]
	        cmp[?FFk.w_pct] = .075
	        cmp[?FFk.h_pct] = .75
	        cmp[?FFk.hvalign] = []
	        cmp[?FFk.hvalign][0] = fa_middle
	        cmp[?FFk.hvalign][1] = fa_center
	        cmp[?FFk.val_arr] = [[sta,FFk.val],[sta,FFk.val_mn],[sta,FFk.val_mx]]
	        cmp[?FFk.str_arr] = ["Stamina:",[sta,FFk.val," / ",sta,FFk.val_mx]]
			
	        // Hunger
	        varr[1][3] = vert_bar_create([0,0,0,0],[M.FF.color.bronze.rgb,M.FF.color.bronze.rgb,M.FF.color.brown.rgb,M.FF.color.brown.rgb],1,
	                        [M.FF.color.brown.rgb,M.FF.color.brown.rgb,M.FF.color.bronze.rgb,M.FF.color.bronze.rgb],1,"Hunger",FF_action.none,true) // Hunger
	        var cmp = varr[1][3]
	        cmp[?FFk.w_pct] = .075
	        cmp[?FFk.h_pct] = .75
	        cmp[?FFk.hvalign] = []
	        cmp[?FFk.hvalign][0] = fa_middle
	        cmp[?FFk.hvalign][1] = fa_center
	        cmp[?FFk.val_arr] = [[hun,FFk.val],[hun,FFk.val_mn],[hun,FFk.val_mx]]
	        cmp[?FFk.str_arr] = ["Hunger:",[hun,FFk.val," / ",hun,FFk.val_mx]]
			
	        // Thirst
	        varr[1][4] = vert_bar_create([0,0,0,0],[M.FF.color.cyan.rgb,M.FF.color.cyan.rgb,M.FF.color.cyan.dark.rgb,M.FF.color.cyan.dark.rgb],1,
	                        [M.FF.color.cyan.dark.rgb,M.FF.color.cyan.dark.rgb,M.FF.color.cyan.rgb,M.FF.color.cyan.rgb],1,"Thirst",FF_action.none,true) // Thirst
	        var cmp = varr[1][4]
	        cmp[?FFk.w_pct] = .075
	        cmp[?FFk.h_pct] = .75
	        cmp[?FFk.hvalign] = []
	        cmp[?FFk.hvalign][0] = fa_middle
	        cmp[?FFk.hvalign][1] = fa_center
	        cmp[?FFk.val_arr] = [[thi,FFk.val],[thi,FFk.val_mn],[thi,FFk.val_mx]]
	        cmp[?FFk.str_arr] = ["Thirst:",[thi,FFk.val," / ",thi,FFk.val_mx]]
			
	        // Sleep
	        varr[1][5] = vert_bar_create([0,0,0,0],[M.FF.color.purple.rgb,M.FF.color.purple.rgb,M.FF.color.purple.dark.rgb,M.FF.color.purple.dark.rgb],1,
	                        [M.FF.color.purple.dark.rgb,M.FF.color.purple.dark.rgb,M.FF.color.purple.rgb,M.FF.color.purple.rgb],1,"Sleep",FF_action.none,true) // Sleep
	        var cmp = varr[1][5]
	        cmp[?FFk.w_pct] = .075
	        cmp[?FFk.h_pct] = .75
	        cmp[?FFk.hvalign] = []
	        cmp[?FFk.hvalign][0] = fa_middle
	        cmp[?FFk.hvalign][1] = fa_center
	        cmp[?FFk.val_arr] = [[sle,FFk.val],[sle,FFk.val_mn],[sle,FFk.val_mx]]
	        cmp[?FFk.str_arr] = ["Sleep:",[sle,FFk.val," / ",sle,FFk.val_mx]]
			
	    #endregion
		
	#endregion
	
	// Activate
	e[?FFk.active] = true
	
	return noone
	
}

function draw_tool_tip() {
	
	// Params
	var e = argument0
	var str_arr = argument1
	
	// Init ToolTip Text
	var txt = string_complex_multiline(str_arr)
	var txtm = M.FF.margin.MD           // Text Margin
	var txto = M.FF.margin.MD*1.5       // Text Offset
	var txtx = mouse_x + txtm
	var txty = mouse_y + txtm
	var txtw = M.FF.margin.RW4
	var txtwe = string_width_ext(txt,M.FF.margin.STR_H,txtw)          // Text Width Ext
	var txthe = string_height_ext(txt,M.FF.margin.STR_H,txtw)         // Text Height Ext
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	
	// ToolTip BG
	draw_set_alpha(e[?FFk.bga])
	draw_rectangle_color(mouse_x+txto,mouse_y+txto,txtx+txtwe+txtm+txto,txty+txthe+txtm+txto,
	    e[?FFk.bgc][0],e[?FFk.bgc][1],e[?FFk.bgc][2],e[?FFk.bgc][3],false)
	
	// ToolTip FG
	draw_set_alpha(e[?FFk.fga])
	draw_rectangle_color(mouse_x+txto,mouse_y+txto,txtx+txtwe+txtm+txto,txty+txthe+txtm+txto,
	    e[?FFk.fgc][0],e[?FFk.fgc][1],e[?FFk.fgc][2],e[?FFk.fgc][3],true)
	
	// Draw ToolTip Text
	var a = e[?FFk.fga]
	draw_text_ext_color(txtx+txto,txty+txto,txt,M.FF.margin.STR_H,txtw,
	    e[?FFk.fgc][0],e[?FFk.fgc][1],e[?FFk.fgc][2],e[?FFk.fgc][3],a)
	
	return noone
	
}

function set_top_frame() {
	
	// Params
	var gfi = argument0
	
	if(!is_undefined(M.FF.frame.map_list[|gfi]) and M.FF.frame.map_list[|gfi] != noone) {
		
	    var e = M.FF.frame.map_list[|gfi]
	    ds_list_delete(M.FF.frame.map_list,gfi)
	    ds_list_add(M.FF.frame.map_list,e)
		
	}
	
	return ds_list_size(M.FF.frame.map_list)-1
	
}

function init_inv() {
	
	// Param
	var pmli = argument0
	
	// Make Frame; Static
	var gfi = gui_frame_create(M.FF.runtime_width*0.9,M.FF.runtime_height*0.9,string("{0}{1}{2}",M.FF.command.inv.str,M.FF.command.menu_infix,pmli))
	
	// Shorten Accessors
	var e = M.FF.frame.map_list[|gfi]
	var cmpn = e[?FFk.cmpnt_cfg]
	
	// Config Frame
	e[?FFk.bg] = true
	e[?FFk.fg] = true
	e[?FFk.mode] = FF_content.cmpnt
	e[?FFk.focus_lock] = true
	e[?FFk.autodrag] = true
	e[?FFk.hvalign][0] = fa_middle
	e[?FFk.hvalign][1] = fa_center
	e[?FFk.owner] = pmli
	
	#region Config Components
		
	    // Init
	    cmpn[?FFk.marginx] = M.FF.margin.MD
	    cmpn[?FFk.varr] = [[],[],[],[]] // Have no clue why I have to do this here now, GMEdit issue.
	    e[?FFk.cmpnt_cfg][?FFk.hvalign] = [fa_middle,fa_center]
		
	    // Header 1
	    cmpn[?FFk.varr][0][0] = horiz_space_create([0,0,0,0],e[?FFk.fgc],e[?FFk.bga],e[?FFk.fgc],e[?FFk.bga],e[?FFk.w]*.8,M.FF.margin.STR_H*2,FF_spacer.line,noone,true)
	    var cmp = cmpn[?FFk.varr][0][0]
	    cmp[?FFk.w_pct] = .975
	    cmp[?FFk.h_pct] = .01
	    cmp[?FFk.hvalign] = []
	    cmp[?FFk.hvalign][0] = fa_left
	    cmp[?FFk.hvalign][1] = fa_top
	    cmp[?FFk.str] = "Equipment"
		
	    // Entity Preview + Equipment Slots
	    var w2 = e[?FFk.w]-(cmpn[?FFk.marginx]*6)
	    cmpn[?FFk.varr][1][0] = preview_create([0,0,0,0],invert_array(e[?FFk.bgc]),e[?FFk.bga],invert_array(e[?FFk.fgc]),e[?FFk.fga],"Preview",FF_action.none,true)
	    var cmp = cmpn[?FFk.varr][1][0]
	    cmp[?FFk.w_pct] = .3
	    cmp[?FFk.h_pct] = .4
	    cmp[?FFk.hvalign] = [fa_left,fa_center]
	    cmp[?FFk.ref] = M.FF.player.map_list[|pmli]
		
	    // Wear Slots
	    cmpn[?FFk.varr][1][1] = slot_grid_create([0,0,0,0],e[?FFk.bgc],e[?FFk.bga],e[?FFk.fgc],e[?FFk.fga],3,4,"Wear",FF_action.none,true)
	    var cmp = cmpn[?FFk.varr][1][1]
	    cmp[?FFk.w_pct] = .3
	    cmp[?FFk.h_pct] = .4
	    cmp[?FFk.hvalign] = [fa_middle,fa_center]
	    cmp[?FFk.type] = FF_grids.wear
	    cmp[?FFk.parent] = e
	    var g = cmp[?FFk.grid]
	    g[#0,0][?FFk.type] = M.FF.slot_type.wear.back
	    g[#1,0][?FFk.type] = M.FF.slot_type.wear.head
	    g[#2,0][?FFk.type] = M.FF.slot_type.wear.hands
	    g[#0,1][?FFk.type] = M.FF.slot_type.wear.r_shoulder
	    g[#1,1][?FFk.type] = M.FF.slot_type.wear.torso
	    g[#2,1][?FFk.type] = M.FF.slot_type.wear.l_shoulder
	    g[#0,2][?FFk.type] = M.FF.slot_type.wear.r_arm
	    g[#1,2][?FFk.type] = M.FF.slot_type.wear.waist
	    g[#2,2][?FFk.type] = M.FF.slot_type.wear.l_arm
	    g[#0,3][?FFk.type] = M.FF.slot_type.wear.r_leg
	    g[#1,3][?FFk.type] = M.FF.slot_type.wear.feet
	    g[#2,3][?FFk.type] = M.FF.slot_type.wear.l_arm
		
	    // Wield Slots
	    cmpn[?FFk.varr][1][2] = slot_grid_create([0,0,0,0],e[?FFk.bgc],e[?FFk.bga],e[?FFk.fgc],e[?FFk.fga],2,1,"Wield/Hold",FF_action.none,true)
	    var cmp = cmpn[?FFk.varr][1][2]
	    cmp[?FFk.w_pct] = .3
	    cmp[?FFk.h_pct] = .4
	    cmp[?FFk.hvalign] = [fa_middle,fa_center]
	    cmp[?FFk.type] = FF_grids.wield
	    cmp[?FFk.parent] = e
	    var g = cmp[?FFk.grid]
	    g[#0,0][?FFk.type] = M.FF.slot_type.wear.r_hand
	    g[#1,0][?FFk.type] = M.FF.slot_type.wear.l_hand
		
	    // Header 2
	    cmpn[?FFk.varr][2][0] = horiz_space_create([0,0,0,0],e[?FFk.fgc],e[?FFk.bga],e[?FFk.fgc],e[?FFk.bga],e[?FFk.w]*.8,M.FF.margin.STR_H*2,FF_spacer.line,noone,true)
	    var cmp = cmpn[?FFk.varr][2][0]
	    cmp[?FFk.w_pct] = .975
	    cmp[?FFk.h_pct] = .01
	    cmp[?FFk.hvalign] = []
	    cmp[?FFk.hvalign][0] = fa_left
	    cmp[?FFk.hvalign][1] = fa_top
	    cmp[?FFk.str] = "Inventory"
		
	    // Inventory Slots
	    cmpn[?FFk.varr][3][0] = slot_grid_create([0,0,0,0],e[?FFk.bgc],e[?FFk.bga],e[?FFk.fgc],e[?FFk.fga],10,10,noone,FF_action.none,true)
	    var cmp = cmpn[?FFk.varr][3][0]
	    cmp[?FFk.w_pct] = .975
	    cmp[?FFk.h_pct] = .41
	    cmp[?FFk.hvalign] = [fa_middle,fa_center]
	    cmp[?FFk.type] = FF_grids.inv
	    cmp[?FFk.parent] = e
	    cmp[?FFk.scl_w] = true
	    cmp[?FFk.scroll] = true
	    cmp[?FFk.grid_nums] = true
		
	#endregion
	
	return noone
	
}

function init_log() {
	
	// Param
	var pmli = argument0
	
	// Make Frame; Static
	var gfi = gui_frame_create(M.FF.runtime_width*0.9,M.FF.runtime_height*0.9,string("{0}{1}{2}",M.FF.command.log.str,M.FF.command.menu_infix,pmli))
	
	// Shorten Accessors
	var e = M.FF.frame.map_list[|gfi]
	var cmpn = e[?FFk.cmpnt_cfg]
	
	// Config Frame
	e[?FFk.bg] = true
	e[?FFk.fg] = true
	e[?FFk.mode] = FF_content.cmpnt
	e[?FFk.focus_lock] = true
	e[?FFk.autodrag] = true
	e[?FFk.hvalign][0] = fa_middle
	e[?FFk.hvalign][1] = fa_center
	e[?FFk.owner] = pmli
	
	#region Component Config
		
	    // Init
	    cmpn[?FFk.varr] = [[],[]] // Have no clue why I have to do this here now, GMEdit issue.
	    cmpn[?FFk.hvalign] = [fa_middle,fa_center]
		
	    // Header 1
	    cmpn[?FFk.varr][0][0] = horiz_space_create([0,0,0,0],e[?FFk.fgc],e[?FFk.bga],e[?FFk.fgc],e[?FFk.bga],e[?FFk.w]*.8,M.FF.margin.STR_H,FF_spacer.line,noone,true)
	    var cmp = cmpn[?FFk.varr][0][0]
	    cmp[?FFk.w_pct] = .975
	    cmp[?FFk.h_pct] = .01
	    cmp[?FFk.hvalign] = [fa_left,fa_top]
	    cmp[?FFk.str] = "Journal"
		
	    // Component List
	    var varr = cmpn[?FFk.varr]
	    varr[1][0] = cmp_list_create([0,0,0,0],e[?FFk.bgc],e[?FFk.bga],e[?FFk.fgc],e[?FFk.fga],FF_action.none,true)
	    var cmp = varr[1][0]
	    cmp[?FFk.w_pct] = .3
	    cmp[?FFk.h_pct] = .9
	    cmp[?FFk.hvalign] = [fa_middle,fa_center]
	    cmp[?FFk.bg] = true
	    cmp[?FFk.fg] = true
	    cmp[?FFk.scroll] = true
	    cmp[?FFk.parent] = e
	    ds_list_add(cmp[?FFk.cmp_list],button_create([0,0,0,0],invert_array(cmp[?FFk.bgc]),cmp[?FFk.bga],invert_array(cmp[?FFk.fgc]),cmp[?FFk.fga],"Add Entry",FF_action.journal_add,true))
	    var btn = cmp[?FFk.cmp_list][|ds_list_size(cmp[?FFk.cmp_list])-1]
	    btn[?FFk.parent] = cmp
	    btn[?FFk.w_pct] = 1
	    btn[?FFk.h_pct] = .1
	    btn[?FFk.hvalign] = [fa_middle,fa_center]
		
	    // Vert Spacer
	    varr[1][1] = vert_space_create([0,0,0,0],e[?FFk.bgc],e[?FFk.bga],e[?FFk.fgc],e[?FFk.fga],e[?FFk.w]*0.01,e[?FFk.h]-(cmpn[?FFk.marginy]*3),FF_spacer.line,FF_action.none,true)
	    var cmp = varr[1][1]
	    cmp[?FFk.w_pct] = .01
	    cmp[?FFk.h_pct] = .85
	    cmp[?FFk.hvalign] = [fa_middle,fa_center]
	    cmp[?FFk.line_w] = 3
		
	    // Container
	    varr[1][2] = container_create([0,0,0,0],e[?FFk.bgc],e[?FFk.bga],e[?FFk.fgc],e[?FFk.fga],FF_action.journal_entry,true)
	    var cmp = varr[1][2]
	    cmp[?FFk.w_pct] = .6
	    cmp[?FFk.h_pct] = .9
	    cmp[?FFk.hvalign] = [fa_middle,fa_center]
	    cmp[?FFk.bg] = true
	    cmp[?FFk.fg] = true
	    cmp[?FFk.cmpnt_cfg][?FFk.varr] = [[],[],[],[]]
	    cmp[?FFk.cmpnt_cfg][?FFk.marginx] = M.FF.margin.SM
		
	    #region Container Components Config
			
	        // First Row
	        var varr2 = cmp[?FFk.cmpnt_cfg][?FFk.varr]
	        varr2[0][0] = input_field_create([0,0,0,0],invert_array(cmp[?FFk.bgc]),cmp[?FFk.bga],invert_array(cmp[?FFk.fgc]),cmp[?FFk.fga],"Entry Title",FF_input.none,FF_action.journal_uid,true)
	        var cmp2 = varr2[0][0]
	        cmp2[?FFk.w_pct] = .975
	        cmp2[?FFk.h_pct] = .1
	        cmp2[?FFk.hvalign] = [fa_middle,fa_center]
	        cmp2[?FFk.bg] = true
	        cmp2[?FFk.fg] = true
			
	        // Next Row
	        varr2[1][0] = button_create([0,0,0,0],invert_array(cmp[?FFk.bgc]),cmp[?FFk.bga],invert_array(cmp[?FFk.fgc]),cmp[?FFk.fga],"Pin",FF_action.journal_pin,true)
	        var cmp2 = varr2[1][0]
	        cmp2[?FFk.w_pct] = .3
	        cmp2[?FFk.h_pct] = .1
	        cmp2[?FFk.hvalign] = [fa_middle,fa_center]
	        cmp2[?FFk.bg] = true
	        cmp2[?FFk.fg] = true
	        varr2[1][1] = color_picker_create([0,0,0,0],invert_array(cmp[?FFk.bgc]),cmp[?FFk.bga],invert_array(cmp[?FFk.fgc]),cmp[?FFk.fga],cloth_color_arr(),FF_action.journal_color,true)
	        var cmp2 = varr2[1][1]
	        cmp2[?FFk.w_pct] = .6
	        cmp2[?FFk.h_pct] = .1
	        cmp2[?FFk.hvalign] = [fa_middle,fa_center]
	        cmp2[?FFk.bg] = true
	        cmp2[?FFk.fg] = true
			
	        // Next Row
	        varr2[2][0] = horiz_space_create([0,0,0,0],invert_array(cmp[?FFk.bgc]),cmp[?FFk.bga],invert_array(cmp[?FFk.fgc]),cmp[?FFk.fga],e[?FFk.w]*0.95,cmpn[?FFk.marginy]*2,FF_spacer.line,FF_action.none,true)
	        var cmp2 = varr2[2][0]
	        cmp2[?FFk.w_pct] = .975
	        cmp2[?FFk.h_pct] = .01
	        cmp2[?FFk.hvalign] = [fa_middle,fa_center]
	        cmp2[?FFk.line_w] = 1
			
	        // Last Row
	        varr2[3][0] = multi_field_create([0,0,0,0],invert_array(cmp[?FFk.bgc]),cmp[?FFk.bga],invert_array(cmp[?FFk.fgc]),cmp[?FFk.fga],FF_action.journal_notes,true)
	        var cmp2 = varr2[3][0]
	        cmp2[?FFk.w_pct] = .975
	        cmp2[?FFk.h_pct] = .7
	        cmp2[?FFk.hvalign] = [fa_middle,fa_center]
	        cmp2[?FFk.bg] = true
	        cmp2[?FFk.fg] = true
	        cmp2[?FFk.scroll] = true
			
	    #endregion
		
	#endregion
	
	return noone
	
}

function init_char_sheet() {
	
	return noone
	
}

function init_map() {
	
	return noone
	
}