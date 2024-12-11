// From Color Picker
function goto_color() {
	
	// Params
	var cmp = argument0
	var goto = argument1
	
	// Init & Loop
	var found = false
	for(var i = 0; i < array_length_1d(cloth_color_arr()); i++) {
		
	    var c = cloth_color_arr()[i]
	    if(c == goto) {
			
	        found = true
	        cmp[?FFk.opt_cfg][?FFk.val] = i
	        break
			
	    }
		
	}
	
	return found
	
}

function dropdown_update() {
	
	#region Params&CFG
		
	    var cmp = argument0
	    var opt = cmp[?FFk.opt_cfg]
	    var menu = cmp[?FFk.menu_cfg]
	    var cell = cmp[?FFk.cell_cfg]
		
	#endregion
	
	// Update menu/cell sizing/positioning when menu is not open
	if(!cmp[?FFk.state]) {
		
	    menu[?FFk.w_mx] = (cmp[?FFk.xy][2]-cmp[?FFk.xy][0])-menu[?FFk.offx]
	    cell[?FFk.w] = menu[?FFk.w_mx]
	    menu[?FFk.w] = menu[?FFk.w_mx]
	    cell[?FFk.h] = M.FF.margin.BG*2
	    menu[?FFk.h_mx] = cell[?FFk.h]*6
	    menu[?FFk.h] = clamp(cell[?FFk.h]*array_length_1d(opt[?FFk.arr]),cell[?FFk.h],menu[?FFk.h_mx])
	    menu[?FFk.scrollx] = 0
	    menu[?FFk.scrolly] = cell[?FFk.h]*opt[?FFk.val]
		
	}
	
	// Keep menu inline with the dropdown field
	menu[?FFk.xy][0] = cmp[?FFk.xy][0]
	menu[?FFk.xy][1] = cmp[?FFk.xy][3]
	menu[?FFk.xy][2] = cmp[?FFk.xy][2]-menu[?FFk.offx]
	menu[?FFk.xy][3] = cmp[?FFk.xy][3]+menu[?FFk.h]
	
	return noone
	
}

function delete_entry() {
	
	var cmp = argument0
	
	switch(cmp[?FFk.action]) {
		
	    case FF_action.journal_entry: {
			
	        // If ref set..
	        if(!is_undefined(cmp[?FFk.ref]) or cmp[?FFk.ref] != noone) {
				
	            ds_map_destroy(cmp[?FFk.ref])
	            cmp[?FFk.ref] = noone
	            var varr = cmp[?FFk.parent][?FFk.parent][?FFk.cmpnt_cfg][?FFk.varr]
	            var contain = varr[1][2]
	            contain[?FFk.ref] = noone
	            var cmp_list = cmp[?FFk.parent][?FFk.cmp_list]
	            var e = list_find_self(cmp,cmp_list)
	            ds_map_destroy(cmp)
	            ds_list_delete(cmp_list,e)
				
	        }
			
			M.FF.frame.draw_break = true
	        break
			
	    }
		
	    default: break
		
	}
	
}

function input_field_update() {
	
	// Arg
	var cmp = argument0
	var npt = cmp[?FFk.inp_cfg]
	var crt = npt[?FFk.carot_cfg]
	
	// Init
	var xy = cmp[?FFk.xy]
	var str = cmp[?FFk.str]
	
	// Update Vars
	cmp[?FFk.w] = xy[2]-xy[0]
	cmp[?FFk.h] = xy[3]-xy[1]
	npt[?FFk.w] = cmp[?FFk.w]*.67
	cmp[?FFk.offy] = string_height_ext(str,M.FF.margin.SM,cmp[?FFk.w]*.5)
	
	return noone
	
}