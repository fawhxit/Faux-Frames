function button_create() {
	
	#region Args
		
	    var cmp = ds_map_create()
	    var xy = argument0
	    cmp[?FFk.xy] = xy
	    var bgc_arr = argument1
	    cmp[?FFk.bgc] = bgc_arr
	    var bga = argument2
	    cmp[?FFk.bga] = bga
	    var fgc_arr = argument3
	    cmp[?FFk.fgc] = fgc_arr
	    var fga = argument4
	    cmp[?FFk.fga] = fga
	    var str = argument5
	    cmp[?FFk.str] = str
	    var action = argument6
	    cmp[?FFk.action] = action
	    var active = argument7
	    cmp[?FFk.active] = active
	    cmp[?FFk.cmpnt_type] = FF_component.btn
		
	    // Other
	    cmp[?FFk.hvalign] = [fa_middle,fa_center]
	    cmp[?FFk.i] = 0
	    cmp[?FFk.bgc_o] = []
	    array_copy(cmp[?FFk.bgc_o],0,cmp[?FFk.bgc],0,array_length_1d(cmp[?FFk.bgc]))
		
	#endregion
	
	return cmp
	
}

function bind_button_create() {
	
	#region Args
		
	    var cmp = ds_map_create()
	    var xy = argument0
	    cmp[?FFk.xy] = xy
	    var bgc_arr = argument1
	    cmp[?FFk.bgc] = bgc_arr
	    var bga = argument2
	    cmp[?FFk.bga] = bga
	    var fgc_arr = argument3
	    cmp[?FFk.fgc] = fgc_arr
	    var fga = argument4
	    cmp[?FFk.fga] = fga
	    var opt = argument5
	    cmp[?FFk.opt_cfg] = ds_map_create()
	    cmp[?FFk.opt_cfg][?FFk.val] = opt
	    var active = argument6
	    cmp[?FFk.active] = active
	    cmp[?FFk.cmpnt_type] = FF_component.bnd_btn
		
	    // Additional Inits
	    cmp[?FFk.bgc_o] = []
	    array_copy(cmp[?FFk.bgc_o],0,cmp[?FFk.bgc],0,array_length_1d(cmp[?FFk.bgc]))
		
	#endregion
	
	return cmp
	
}

function color_picker_create() {
	
	#region Args
		
	    var cmp = ds_map_create()
	    var xy = argument0
	    cmp[?FFk.xy] = xy
	    var bgc_arr = argument1
	    cmp[?FFk.bgc] = bgc_arr
	    var bga = argument2
	    cmp[?FFk.bga] = bga
	    var fgc_arr = argument3
	    cmp[?FFk.fgc] = fgc_arr
	    var fga = argument4
	    cmp[?FFk.fga] = fga
	    var opt_arr = argument5
	    cmp[?FFk.opt_cfg] = ds_map_create()
	    var opt = cmp[?FFk.opt_cfg]
	    opt[?FFk.arr] = opt_arr
	    opt[?FFk.val] = 0
	    var action = argument6
	    cmp[?FFk.action] = action
	    var active = argument7
	    cmp[?FFk.active] = active
	    cmp[?FFk.cmpnt_type] = FF_component.col_pckr
		
	#endregion
	
	#region Additional
		
	    cmp[?FFk.bgc_o] = []
	    cmp[?FFk.bgc_o] = array_dupe(cmp[?FFk.bgc_o],cmp[?FFk.bgc])
	    cmp[?FFk.fgc_o] = []
	    cmp[?FFk.fgc_o] = array_dupe(cmp[?FFk.fgc_o],cmp[?FFk.fgc])
		
	#endregion
	
	// Do Action (To Init Targets)
	color_picker_action(cmp)
	
	return cmp
	
}

function cmp_list_create() {
	
	#region Args
		
	    var cmp = ds_map_create()
	    var xy = argument0
	    cmp[?FFk.xy] = xy
	    var bgc_arr = argument1
	    cmp[?FFk.bgc] = bgc_arr
	    var bga = argument2
	    cmp[?FFk.bga] = bga
	    var fgc_arr = argument3
	    cmp[?FFk.fgc] = fgc_arr
	    var fga = argument4
	    cmp[?FFk.fga] = fga
	    var action = argument5
	    cmp[?FFk.action] = action
	    var active = argument6
	    cmp[?FFk.active] = active
	    cmp[?FFk.cmpnt_type] = FF_component.cmp_list
		
	    // Other inits
	    cmp[?FFk.cmp_list] = ds_list_create()
	    cmp[?FFk.cmp_list_toAdd] = noone
	    cmp[?FFk.parent] = noone
	    cmp[?FFk.surf_id] = noone
	    cmp[?FFk.surf_wh] = [0,0]
	    cmp[?FFk.surf_xy] = [0,0]
	    cmp[?FFk.resize] = false
	    cmp[?FFk.autosize] = false
	    cmp[?FFk.autodrag] = false
	    cmp[?FFk.scroll] = true
	    cmp[?FFk.scrolly] = 0
	    cmp[?FFk.scrolly_mn] = 0
	    cmp[?FFk.scrolly_mx] = 0
	    cmp[?FFk.cmpnt_cfg] = ds_map_create()
	    var cmpn = cmp[?FFk.cmpnt_cfg]
	    cmpn[?FFk.varr] = noone
	    cmpn[?FFk.marginx] = M.FF.margin.MD
	    cmpn[?FFk.marginy] = M.FF.margin.MD
	    cmpn[?FFk.hvalign] = [fa_middle,fa_top]
		
	#endregion
	
	return cmp
	
}

function container_create() {
	
	#region Args
		
	    var cmp = ds_map_create()
	    var xy = argument0
	    cmp[?FFk.xy] = xy
	    var bgc_arr = argument1
	    cmp[?FFk.bgc] = bgc_arr
	    var bga = argument2
	    cmp[?FFk.bga] = bga
	    var fgc_arr = argument3
	    cmp[?FFk.fgc] = fgc_arr
	    var fga = argument4
	    cmp[?FFk.fga] = fga
	    var action = argument5
	    cmp[?FFk.action] = action
	    var active = argument6
	    cmp[?FFk.active] = active
	    cmp[?FFk.cmpnt_type] = FF_component.contain
		
	    // Additional Inits
	    cmp[?FFk.cmpnt_cfg] = ds_map_create()
	    var cmpn = cmp[?FFk.cmpnt_cfg]
	    cmpn[?FFk.varr] = noone
	    cmpn[?FFk.marginx] = M.FF.margin.MD
	    cmpn[?FFk.marginy] = M.FF.margin.MD
	    cmpn[?FFk.hvalign] = [fa_middle,fa_center]
	    cmp[?FFk.resize] = false
	    cmp[?FFk.autosize] = false
	    cmp[?FFk.autodrag] = false
	    cmp[?FFk.scroll] = false
		
	    // Ref Init
	    cmp[?FFk.ref] = noone
	    cmp[?FFk.load] = false
		
	#endregion
	
	return cmp
	
}

function dropdown_create() {
	
	#region Args
		
	    var cmp = ds_map_create()
	    var xy = argument0
	    cmp[?FFk.xy] = xy
	    var bgc_arr = argument1
	    cmp[?FFk.bgc] = bgc_arr
	    var bga = argument2
	    cmp[?FFk.bga] = bga
	    var fgc_arr = argument3
	    cmp[?FFk.fgc] = fgc_arr
	    var fga = argument4
	    cmp[?FFk.fga] = fga
	    var opt_arr = argument5
	    cmp[?FFk.opt_cfg] = ds_map_create()
	    var opt = cmp[?FFk.opt_cfg]
	    opt[?FFk.arr] = opt_arr
	    opt[?FFk.val] = 0
	    opt[?FFk.scrolly] = 0
	    var action = argument6
	    cmp[?FFk.action] = action
	    var active = argument7
	    cmp[?FFk.active] = active
	    cmp[?FFk.state] = false
	    cmp[?FFk.cmpnt_type] = FF_component.drop
		
	    // Addtional Inits (Dropdown Menu)
	    cmp[?FFk.menu_cfg] = ds_map_create()
	    var menu = cmp[?FFk.menu_cfg]
	    menu[?FFk.w_mx] = (cmp[?FFk.xy][2]-cmp[?FFk.xy][0])
	    menu[?FFk.w] = menu[?FFk.w_mx]
	    cmp[?FFk.cell_cfg] = ds_map_create()
	    var cell = cmp[?FFk.cell_cfg]
	    cell[?FFk.w] = menu[?FFk.w_mx]
	    cell[?FFk.h] = M.FF.margin.BG*2
	    menu[?FFk.h_mx] = cell[?FFk.h]*6
	    menu[?FFk.h] = clamp(cell[?FFk.h]*array_length_1d(opt[?FFk.arr]),cell[?FFk.h],menu[?FFk.h_mx])
	    menu[?FFk.offx] = 0
	    menu[?FFk.offy] = 0
	    menu[?FFk.xy] = array_create(4,noone)
	    menu[?FFk.xy][0] = cmp[?FFk.xy][0]
	    menu[?FFk.xy][1] = cmp[?FFk.xy][3]
	    menu[?FFk.xy][2] = cmp[?FFk.xy][2]-menu[?FFk.offx]
	    menu[?FFk.xy][3] = cmp[?FFk.xy][3]+menu[?FFk.h]
	    menu[?FFk.scrollx] = 0
	    menu[?FFk.scrolly] = cell[?FFk.h]*opt[?FFk.val]
	    cmp[?FFk.bgc_o] = array_dupe(cmp[?FFk.bgc_o],cmp[?FFk.bgc])
	    cmp[?FFk.fgc_o] = array_dupe(cmp[?FFk.fgc_o],cmp[?FFk.fgc])
		
	#endregion
	
	return cmp
	
}

function entry_button_create() {
	
	#region Args
		
	    var cmp = ds_map_create()
	    var xy = argument0
	    cmp[?FFk.xy] = xy
	    var bgc_arr = argument1
	    cmp[?FFk.bgc] = bgc_arr
	    var bga = argument2
	    cmp[?FFk.bga] = bga
	    var fgc_arr = argument3
	    cmp[?FFk.fgc] = fgc_arr
	    var fga = argument4
	    cmp[?FFk.fga] = fga
	    var str = argument5
	    cmp[?FFk.str] = str
	    var action = argument6
	    cmp[?FFk.action] = action
	    var active = argument7
	    cmp[?FFk.active] = active
	    cmp[?FFk.cmpnt_type] = FF_component.ent_btn
		
	    // Other
	    cmp[?FFk.hvalign] = [fa_middle,fa_center]
	    cmp[?FFk.del_btn] = true
	    cmp[?FFk.bgc_o] = []
	    array_copy(cmp[?FFk.bgc_o],0,cmp[?FFk.bgc],0,array_length_1d(cmp[?FFk.bgc]))
		
	#endregion
	
	return cmp
	
}

function horiz_space_create() {
	
	#region Args
		
	    var cmp = ds_map_create()
	    var xy = argument0
	    cmp[?FFk.xy] = xy
	    var bgc_arr = argument1
	    cmp[?FFk.bgc] = bgc_arr
	    var bga = argument2
	    cmp[?FFk.bga] = bga
	    var fgc_arr = argument3
	    cmp[?FFk.fgc] = fgc_arr
	    var fga = argument4
	    cmp[?FFk.fga] = fga
	    var spcr_w = argument5
	    cmp[?FFk.w] = spcr_w
	    var spcr_h = argument6
	    cmp[?FFk.h] = spcr_h
	    var spcr_type = argument7
	    cmp[?FFk.type] = spcr_type
	    var action = argument8
	    cmp[?FFk.action] = action
	    var active = argument9
	    cmp[?FFk.active] = active
	    cmp[?FFk.cmpnt_type] = FF_component.horiz_spcr
		
	    // Additional Inits
	    cmp[?FFk.hvalign] = [fa_middle,fa_center]
	    cmp[?FFk.str] = ""
	    cmp[?FFk.fill] = false
	    cmp[?FFk.line_w] = 1
	    cmp[?FFk.offy] = 0 // For adjusting seperator using txt on top/bottom
	    cmp[?FFk.w_mx] = 0
	    cmp[?FFk.w_mult] = 0
	    cmp[?FFk.str_arr] = []    // Used for Complex String Spacers when elements need to be updated
		
	#endregion
	
	return cmp
	
}

function input_field_create() {
	
	#region Args
		
	    var cmp = ds_map_create()
	    var xy = argument0
	    cmp[?FFk.xy] = xy
	    var bgc_arr = argument1
	    cmp[?FFk.bgc] = bgc_arr
	    var bga = argument2
	    cmp[?FFk.bga] = bga
	    var fgc_arr = argument3
	    cmp[?FFk.fgc] = fgc_arr
	    var fga = argument4
	    cmp[?FFk.fga] = fga
	    var str = argument5
	    cmp[?FFk.str] = str
	    var inp_type = argument6
	    cmp[?FFk.inp_cfg] = ds_map_create()
	    var npt = cmp[?FFk.inp_cfg]
	    npt[?FFk.type] = inp_type
	    var action = argument7
	    cmp[?FFk.action] = action
	    var active = argument8
	    cmp[?FFk.active] = active
	    cmp[?FFk.cmpnt_type] = FF_component.inpf
		
	    #region Additional Inits
			
	        cmp[?FFk.w] = xy[0]+((xy[2]-xy[0])/2)
	        cmp[?FFk.h] = xy[1]+((xy[3]-xy[1])/2)
	        cmp[?FFk.state] = false
	        npt[?FFk.str] = ""
	        npt[?FFk.carot_cfg] = ds_map_create()
	        var crt = npt[?FFk.carot_cfg]
	        crt[?FFk.xy] = [0,0,0,0]
	        npt[?FFk.w] = cmp[?FFk.w]*.5
	        cmp[?FFk.offy] = string_height_ext(str,M.FF.margin.SM,cmp[?FFk.w]*.5)
	        npt[?FFk.limit] = noone
	        cmp[?FFk.force_bounds] = false
			
	        // BG/FG Color Olds
	        cmp[?FFk.bgc_o] = []
	        cmp[?FFk.bgc_o] = array_dupe(cmp[?FFk.bgc_o],cmp[?FFk.bgc])
	        cmp[?FFk.fgc_o] = []
	        cmp[?FFk.fgc_o] = array_dupe(cmp[?FFk.fgc_o],cmp[?FFk.fgc])
			
	    #endregion
		
	#endregion
	
	return cmp
	
}

function iterator_create() {
	
	#region Args
		
	    var cmp = ds_map_create()
	    var xy = argument0
	    cmp[?FFk.xy] = xy
	    var bgc_arr = argument1
	    cmp[?FFk.bgc] = bgc_arr
	    var bga = argument2
	    cmp[?FFk.bga] = bga
	    var fgc_arr = argument3
	    cmp[?FFk.fgc] = fgc_arr
	    var fga = argument4
	    cmp[?FFk.fga] = fga
	    var opt = argument5
	    cmp[?FFk.opt_cfg] = opt
	    var action = argument6
	    cmp[?FFk.action] = action
	    var active = argument7
	    cmp[?FFk.active] = active
	    cmp[?FFk.cmpnt_type] = FF_component.iter
		
	#endregion
	
	#region Additional Inits
		
	    // BG/FG Color Olds
	    cmp[?FFk.bgc_o] = []
	    cmp[?FFk.bgc_o] = array_dupe(cmp[?FFk.bgc_o],cmp[?FFk.bgc])
	    cmp[?FFk.fgc_o] = []
	    cmp[?FFk.fgc_o] = array_dupe(cmp[?FFk.fgc_o],cmp[?FFk.fgc])
		
	#endregion
	
	// Do Action (Init)
	iterator_action(cmp,1)
	
	return cmp
	
}

function label_create() {
	
	#region Args
		
	    var cmp = ds_map_create()
	    var xy = argument0
	    cmp[?FFk.xy] = xy
	    var fgc_arr = argument1
	    cmp[?FFk.fgc] = fgc_arr
	    var fga = argument2
	    cmp[?FFk.fga] = fga
	    var str = argument3
	    cmp[?FFk.str] = str
	    var hvalign = argument4
	    cmp[?FFk.hvalign] = hvalign
	    cmp[?FFk.cmpnt_type] = FF_component.lbl
		
	#endregion
	
	// Additional Inits
	cmp[?FFk.w_mx] = 0
	cmp[?FFk.w] = string_width(cmp[?FFk.str])
	
	return cmp
	
}

function multi_field_create() {
	
	#region Args
		
	    var cmp = ds_map_create()
	    var xy = argument0
	    cmp[?FFk.xy] = xy
	    var bgc_arr = argument1
	    cmp[?FFk.bgc] = bgc_arr
	    var bga = argument2
	    cmp[?FFk.bga] = bga
	    var fgc_arr = argument3
	    cmp[?FFk.fgc] = fgc_arr
	    var fga = argument4
	    cmp[?FFk.fga] = fga
	    var action = argument5
	    cmp[?FFk.action] = action
	    var active = argument6
	    cmp[?FFk.active] = active
	    cmp[?FFk.cmpnt_type] = FF_component.multf
		
	    // Other
	    cmp[?FFk.selected] = false
	    cmp[?FFk.scroll] = false
	    cmp[?FFk.scrolly] = 0
	    cmp[?FFk.scrolly_mn] = 0
	    cmp[?FFk.scrolly_mx] = 0
	    cmp[?FFk.limit] = noone
	    cmp[?FFk.overwrite] = false
	    cmp[?FFk.str_cfg] = ds_map_create()
	    cmp[?FFk.str_cfg][?FFk.type] = noone
	    cmp[?FFk.str_cfg][?FFk.hvalign] = [fa_left,fa_top]
	    cmp[?FFk.str_cfg][?FFk.limit] = noone
	    cmp[?FFk.str_cfg][?FFk.str] = ""
	    cmp[?FFk.str_cfg][?FFk.list_2d] = ds_list_create()
	    cmp[?FFk.str_cfg][?FFk.list_2d][|0] = ds_list_create()
	    cmp[?FFk.str_cfg][?FFk.write] = true
	    cmp[?FFk.str_cfg][?FFk.read] = true
	    cmp[?FFk.str_cfg][?FFk.bgc] = cmp[?FFk.bgc]
	    cmp[?FFk.str_cfg][?FFk.bga] = cmp[?FFk.bga]
	    cmp[?FFk.str_cfg][?FFk.fgc] = cmp[?FFk.fgc]
	    cmp[?FFk.str_cfg][?FFk.fga] = cmp[?FFk.fga]
	    cmp[?FFk.str_cfg][?FFk.marginx] = M.FF.margin.MD
	    cmp[?FFk.str_cfg][?FFk.marginy] = M.FF.margin.MD
	    cmp[?FFk.carot_cfg] = ds_map_create()
	    cmp[?FFk.carot_cfg][?FFk.carot_end] = true
	    cmp[?FFk.carot_cfg][?FFk.xx] = 0
	    cmp[?FFk.carot_cfg][?FFk.yy] = 0
	    cmp[?FFk.carot_cfg][?FFk.xy] = [0,0,0,0]
	    cmp[?FFk.carot_cfg][?FFk.select_rng] = noone
	    cmp[?FFk.carot_cfg][?FFk.fgc] = cmp[?FFk.fgc]
	    cmp[?FFk.carot_cfg][?FFk.fga] = cmp[?FFk.fga]
		
	#endregion
	
	return cmp
	
}

function picker_create() {
	
	#region Args
		
	    var cmp = ds_map_create()
	    var xy = argument0
	    cmp[?FFk.xy] = xy
	    var bgc_arr = argument1
	    cmp[?FFk.bgc] = bgc_arr
	    var bga = argument2
	    cmp[?FFk.bga] = bga
	    var fgc_arr = argument3
	    cmp[?FFk.fgc] = fgc_arr
	    var fga = argument4
	    cmp[?FFk.fga] = fga
	    var opt_arr = argument5
	    cmp[?FFk.opt_cfg] = ds_map_create()
	    var opt = cmp[?FFk.opt_cfg]
	    opt[?FFk.arr] = opt_arr
	    opt[?FFk.val] = 0
	    var action = argument6
	    cmp[?FFk.action] = action
	    var active = argument7
	    cmp[?FFk.active] = active
	    cmp[?FFk.cmpnt_type] = FF_component.pckr
		
	#endregion
	
	#region Additional
		
	    cmp[?FFk.bgc_o] = []
	    cmp[?FFk.bgc_o] = array_dupe(cmp[?FFk.bgc_o],cmp[?FFk.bgc])
	    cmp[?FFk.fgc_o] = []
	    cmp[?FFk.fgc_o] = array_dupe(cmp[?FFk.fgc_o],cmp[?FFk.fgc])
		
	#endregion
	
	return cmp
	
}

function preview_create() {
	
	#region Args
		
	    var cmp = ds_map_create()
	    var xy = argument0
	    cmp[?FFk.xy] = xy
	    var bgc_arr = argument1
	    cmp[?FFk.bgc] = bgc_arr
	    var bga = argument2
	    cmp[?FFk.bga] = bga
	    var fgc_arr = argument3
	    cmp[?FFk.fgc] = fgc_arr
	    var fga = argument4
	    cmp[?FFk.fga] = fga
	    var str = argument5
	    cmp[?FFk.str] = str
	    var action = argument6
	    cmp[?FFk.action] = action
	    var active = argument7
	    cmp[?FFk.active] = active
	    cmp[?FFk.cmpnt_type] = FF_component.preview
		
	#endregion
	
	// Additional Inits
	cmp[?FFk.w] = xy[2] - xy[0]
	cmp[?FFk.h] = xy[3] - xy[1]
	cmp[?FFk.hvalign] = [fa_middle,fa_center]
	cmp[?FFk.ref] = noone
	
	return cmp
	
}

function slider_create() {
	
	#region Args
		
	    var cmp = ds_map_create()
	    var xy = argument0
	    cmp[?FFk.xy] = xy
	    var bgc_arr = argument1
	    cmp[?FFk.bgc] = bgc_arr
	    var bga = argument2
	    cmp[?FFk.bga] = bga
	    var fgc_arr = argument3
	    cmp[?FFk.fgc] = fgc_arr
	    var fga = argument4
	    cmp[?FFk.fga] = fga
	    var str = argument5
	    cmp[?FFk.str] = str
	    var sym = argument6
	    cmp[?FFk.sym] = sym
	    var val = argument7
	    cmp[?FFk.val] = val
	    var val_mn = argument8
	    cmp[?FFk.val_mn] = val_mn
	    var val_mx = argument9
	    cmp[?FFk.val_mx] = val_mx
	    var action = argument10
	    cmp[?FFk.action] = action
	    var active = argument11
	    cmp[?FFk.active] = active
	    cmp[?FFk.cmpnt_type] = FF_component.sldr
		
	    // Additional
	    cmp[?FFk.num_dec] = 2
		
	#endregion
	
	return cmp
	
}

function slot_grid_create() {
	
	#region Args
		
	    var cmp = ds_map_create()
	    var xy = argument0
	    cmp[?FFk.xy] = xy
	    var bgc_arr = argument1
	    cmp[?FFk.bgc] = bgc_arr
	    var bga = argument2
	    cmp[?FFk.bga] = bga
	    var fgc_arr = argument3
	    cmp[?FFk.fgc] = fgc_arr
	    var fga = argument4
	    cmp[?FFk.fga] = fga
	    var columns = argument5
	    var rows = argument6
	    cmp[?FFk.grid] = ds_grid_create(columns,rows)
	    var str = argument7
	    cmp[?FFk.str] = str
	    var action = argument8
	    cmp[?FFk.action] = action
	    var active = argument9
	    cmp[?FFk.active] = active
	    cmp[?FFk.cmpnt_type] = FF_component.slot_grid
		
	#endregion
	
	#region Additional Inits
		
	    cmp[?FFk.w] = xy[2] - xy[0]
	    cmp[?FFk.h] = xy[3] - xy[1]
	    cmp[?FFk.bg] = true
	    cmp[?FFk.fg] = true
	    cmp[?FFk.hvalign] = [fa_middle,fa_center]
	    cmp[?FFk.scl_w] = false
	    cmp[?FFk.scl_h] = false
	    cmp[?FFk.scrolly] = 0
	    cmp[?FFk.scroll] = false
	    cmp[?FFk.grid_nums] = false
	    cmp[?FFk.type] = FF_grids.none
	    cmp[?FFk.parent] = noone
	    cmp[?FFk.bgc_o] = []
	    array_copy(cmp[?FFk.bgc_o],0,cmp[?FFk.bgc],0,array_length_1d(cmp[?FFk.bgc]))
		
	#endregion
	
	#region Additional Grid Inits
		
	    var n = 0
	    for(var iy = 0; iy < ds_grid_height(cmp[?FFk.grid]); iy++) {
			
	        for(var ix = 0; ix < ds_grid_width(cmp[?FFk.grid]); ix++) {
				
	            n += 1
	            cmp[?FFk.grid][#ix,iy] = ds_map_create()
	            var ge = cmp[?FFk.grid][#ix,iy]
	            ge[?FFk.type] = noone
	            ge[?FFk.val] = noone
	            ge[?FFk.val_arr] = noone
				
	        }
			
	    }
		
	#endregion
	
	return cmp
	
}

function toggle_create() {
	
	#region Args
		
	    var cmp = ds_map_create()
	    var xy = argument0
	    cmp[?FFk.xy] = xy
	    var bgc_arr = argument1
	    cmp[?FFk.bgc] = bgc_arr
	    var bga = argument2
	    cmp[?FFk.bga] = bga
	    var fgc_arr = argument3
	    cmp[?FFk.fgc] = invert_array(fgc_arr)
	    var fga = argument4
	    cmp[?FFk.fga] = fga
	    var str = argument5
	    cmp[?FFk.str] = str
	    var ste = argument6
	    cmp[?FFk.state] = ste
	    var action = argument7
	    cmp[?FFk.action] = action
	    var active = argument8
	    cmp[?FFk.active] = active
	    cmp[?FFk.cmpnt_type] = FF_component.togl
		
	#endregion
	
	#region Additional
		
	    cmp[?FFk.bgc_o] = []
	    cmp[?FFk.bgc_o] = array_dupe(cmp[?FFk.bgc_o],cmp[?FFk.bgc])
	    cmp[?FFk.fgc_o] = []
	    cmp[?FFk.fgc_o] = array_dupe(cmp[?FFk.fgc_o],cmp[?FFk.fgc])
		
	#endregion
	
	return cmp
	
}

function vert_bar_create() {
	
	#region Args
		
	    var cmp = ds_map_create()
	    var xy = argument0
	    cmp[?FFk.xy] = xy
	    var bgc_arr = argument1
	    cmp[?FFk.bgc] = bgc_arr
	    var bga = argument2
	    cmp[?FFk.bga] = bga
	    var fgc_arr = argument3
	    cmp[?FFk.fgc] = fgc_arr
	    var fga = argument4
	    cmp[?FFk.fga] = fga
	    var str = argument5
	    cmp[?FFk.str] = str
	    var action = argument6
	    cmp[?FFk.action] = action
	    var active = argument7
	    cmp[?FFk.active] = active
	    cmp[?FFk.cmpnt_type] = FF_component.vbar
		
	    // Other Inits
	    cmp[?FFk.w] = 15
	    cmp[?FFk.h] = M.FF.margin.BG*6
	    cmp[?FFk.val_arr] = noone
	    cmp[?FFk.str_arr] = []
		
	#endregion
	
	return cmp
	
}

function vert_space_create() {
	
	#region Args
		
	    var cmp = ds_map_create()
	    var xy = argument0
	    cmp[?FFk.xy] = xy
	    var bgc_arr = argument1
	    cmp[?FFk.bgc] = bgc_arr
	    var bga = argument2
	    cmp[?FFk.bga] = bga
	    var fgc_arr = argument3
	    cmp[?FFk.fgc] = fgc_arr
	    var fga = argument4
	    cmp[?FFk.fga] = fga
	    var spcr_w = argument5
	    cmp[?FFk.w] = spcr_w
	    var spcr_h = argument6
	    cmp[?FFk.h] = spcr_h
	    var spcr_type = argument7
	    cmp[?FFk.type] = spcr_type
	    var action = argument8
	    cmp[?FFk.action] = action
	    var active = argument9
	    cmp[?FFk.active] = active
	    cmp[?FFk.cmpnt_type] = FF_component.vert_spcr
		
	    // Additional Inits
	    cmp[?FFk.hvalign] = [fa_middle,fa_center]
	    cmp[?FFk.line_w] = 1
		
	#endregion
	
	return cmp
	
}