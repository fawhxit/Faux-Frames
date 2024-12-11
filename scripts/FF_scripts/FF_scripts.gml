// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function string_trim2() {
	
	// Args
	var str = argument0
	var lead = argument1 // (Trim Leading Whitespace?)
	var xtra = argument2 // (Trim Extra/Redundant Whitespace?)
	var trail = argument3 // (Trim Trailing Whitespace?)
	
	// Init
	var ret_str = str
	var strl = string_length(ret_str)
	
	#region Logic
		
	    // Remove leading whitespace
	    while(string_char_at(ret_str,1) == " " and ret_str != " " and lead)
	        ret_str = string_copy(ret_str,2,strl)
		
	    // Remove redundant whitespace
	    while(string_count("  ",ret_str) > 0 and xtra)
	        ret_str = string_replace_all(ret_str,"  "," ")
        
	    // Remove trailing whitespace
	    while(string_char_at(ret_str,strl) == " " and trail)
	        ret_str = string_copy(ret_str,1,strl-1)
		
	#endregion
	
	return ret_str
	
}

function chance() {
	
	// Args
	var percent = argument0
	
	// Return result
	if(percent >= random_range(0,100)) return true
	else return false
	
}

function round2() {
	
	// Args
	var num = argument0
	var dec = argument1
	
	// Prepare Calc
	var base = 1
	repeat(dec) base = base*10
	
	// Return result
	return round(num*base)/base
	
}

function string_capital() {
	
	// Args
	var str = argument0
	
	// Set first char to uppercase and copy it into new string with first char taken out
	return string_upper(string_char_at(str,1)) + string_copy(str,2,string_length(str))
	
}

function string_capital_all() {
	
	// Args
	var str = argument0
	
	// Init
	var str_arr = string_split(str," ")
	
	for(var i = 0; i < array_length_1d(str_arr); i++)
	    str_arr[i] = string_capital(str_arr[i])
	
	return string_join2(str_arr," ")
	
}

function string_split() {
	
	// Args
	var str = argument0
	var delim = argument1
	
	// Init
	var ret_arr = []
	var arri = 0
	var strl = string_length(str)
	var ind = 1
	var str2 = ""
	
	// Iterate and Split
	// I don'true know why the +2 and +1 works but it just does, otherwise cuts off too early
	for(var i = 1; i <= strl+1; i++) {
		
	    if(delim != noone) {
			
	        if(string_char_at(str,i) == delim
	            or i == strl+1) {
				
	            if(str2 != "") {
					
	                ret_arr[arri] = str2
	                arri += 1
	                str2 = ""
					
	            }
				
	        } else str2 += string_char_at(str,i)
			
	    // If no delim, split all chars
	    } else {
			
	        ret_arr[i-1] = string_char_at(str,i)
	        if(i == strl) break
			
	    }
		
	}
	
	if(ret_arr == []) return noone
	else return ret_arr
	
}

function string_join2() {
	
	// Args
	var str_arr = argument0
	var delim = argument1
	
	// Init
	var ret_str = ""
	var arrl = array_length_1d(str_arr)
	
	for(var i = 0; i < arrl; i++) {
		
	    if(i == arrl-1) ret_str += str_arr[i]
	    else ret_str += str_arr[i] + delim
		
	}
	
	return ret_str
	
}

function string_num() {
	
	// Args
	var str = argument0
	
	// Init
	var str = string_trim2(str,true,true,false)
	var ret_str = ""
	
	// Remove all Not Nums
	var neg = (string_char_at(str,1) == "-")
	for(var i = 1; i < string_length(str)+1; i++)
	    ret_str += string_digits(string_char_at(str,i))
	
	if(neg and ret_str != "") ret_str = string(-int64(ret_str))
	
	return ret_str
	
}

function string_posnum() {
	
	// Args
	var str = argument0
	
	// Init
	var str = string_trim2(str,true,true,false)
	var ret_str = ""
	
	// If negative return nothing
	var neg = (string_char_at(str,1) == "-")
	if(neg) return ""
	
	// Remove all Not Nums
	for(var i = 1; i < string_length(str)+1; i++)
	    ret_str += string_digits(string_char_at(str,i))
	
	return ret_str
	
}

function string_negnum() {
	
	// Args
	var str = argument0
	
	// Init
	var str = string_trim2(str,true,true,false)
	var ret_str = ""
	
	// If NOT negative return nothing
	var neg = (string_char_at(str,1) == "-")
	if(!neg) return ""
	
	// Remove all Not Nums
	for(var i = 1; i < string_length(str)+1; i++)
	    ret_str += string_digits(string_char_at(str,i))
	
	return string(-int64(ret_str))
	
}

function string_alpha() {
	
	// Args
	var str = argument0
	
	// Init
	var str = string_trim2(str,true,true,false)
	var ret_str = ""
	
	// Remove all Not Nums
	for(var i = 1; i < string_length(str)+1; i++)
	    ret_str += string_letters(string_char_at(str,i))
	
	return ret_str
	
}

function string_alphanum() {
	
	// Args
	var str = argument0
	
	// Init
	var str = string_trim2(str,true,true,false)
	var ret_str = ""
	
	// Remove all Not Nums
	for(var i = 1; i < string_length(str)+1; i++)
	    ret_str += string_lettersdigits(string_char_at(str,i))
		
	return ret_str
	
}

function kb_hold_iter() {
	
	// NOTE: Doesn'true work right in GMS1; but is fine in GMS2.
	if(keyboard_check(vk_nokey)
	    or keyboard_check_released(vk_anykey)) {
		
	    M.FF.key_held = vk_nokey
	    M.FF.key_heldi = noone
		
	} else if(keyboard_check_pressed(vk_anykey)
	    and M.FF.key_held != keyboard_key) {
		
	    M.FF.key_held = keyboard_key
	    M.FF.key_heldi = 0
		
	} else {
		
	    /* DBUG DBUG DBUG DBUG DBUG DBUG DBUG DBUG DBUG DBUG DBUG DBUG DBUG DBUG DBUG DBUG DBUG DBUG DBUG DBUG DBUG DBUG DBUG DBUG DBUG DBUG DBUG DBUG DBUG DBUG DBUG DBUG DBUG DBUG DBUG DBUG DBUG DBUG
	    if(M.FF.caps_lock)
	        if(M.FF.key_shift) M.FF.key_held = string_lower(M.FF.key_held)
	        else M.FF.key_held = string_upper(M.FF.key_held)
	    else if(M.FF.key_shift) M.FF.key_held = string_upper(M.FF.key_held)
	    else M.FF.key_held = string_lower(M.FF.key_held)
	    */
		
	    var doKey = false
	    if(M.FF.key_heldi < room_speed*1.5) {
	        if(M.FF.key_heldi > round(room_speed/2)
	            and M.FF.key_heldi%round(room_speed/4) == 0)
	            doKey = true
	    } else if(M.FF.key_heldi < room_speed*2.5) {
	        if(M.FF.key_heldi%round(room_speed/6) == 0)
	            doKey = true
	    } else if(M.FF.key_heldi < room_speed*3) {
	        if(M.FF.key_heldi%round(room_speed/8) == 0)
	            doKey = true
	    } else if(M.FF.key_heldi < room_speed*4.5) {
	        if(M.FF.key_heldi%round(room_speed/16) == 0)
	            doKey = true
	    } else doKey = true
		
	    M.FF.key_heldi += 1
		
	    if(doKey) {
			
	        switch(M.FF.key_held) {
				
	            case vk_backspace: {
					
	                keyboard_string = string_copy(keyboard_string,1,string_length(keyboard_string)-1)
					
	                break
					
	            }
				
	            default: {
					
	                if(string_char_at(keyboard_string,string_length(keyboard_string)) == chr(M.FF.key_held)) {
						
	                    if(M.FF.key_shift) keyboard_string += string_trim2(string_char_at(keyboard_string,string_length(keyboard_string)),true,true,true)
	                    else keyboard_string += string_lower(string_trim2(string_char_at(keyboard_string,string_length(keyboard_string)),true,true,true))
						
	                }
					
	                break
					
	            }
				
	        }
			
	    }
    
		return noone
	
	}

}

function make_random_color_rgb() {
	
	// Args
	var r_arr = argument0
	var g_arr = argument1
	var b_arr = argument2
	
	return make_color_rgb(irandom_range(r_arr[0],r_arr[1]),irandom_range(g_arr[0],g_arr[1]),irandom_range(b_arr[0],b_arr[1]))
	
}

function get_color_rgb() {

// Args
var col = argument0

var ret_arr = [0,0,0]
ret_arr[0] = color_get_red(col)
ret_arr[1] = color_get_green(col)
ret_arr[2] = color_get_blue(col)

return ret_arr
	
}

function init_char() {
	
	// Param
	var pmli = argument0
	
	// Init
	var p = M.FF.player.map_list[|pmli]
	
	// Misc
	p[?FFk.type] = FFv.player
	
	// Position/Size Vars
	p[?FFk.xx] = M.FF.margin.RW2
	p[?FFk.yy] = M.FF.margin.RH2
	p[?FFk.rsz] = 67
	
	// Info Init
	p[?FFk.fname] = "First"
	p[?FFk.lname] = "Last"
	p[?FFk.gender] = FFv.male
	
	// Colors Init
	p[?FFk.col_hair] = hair_color_arr()[0]
	p[?FFk.col_eye] = eye_color_arr()[0]
	p[?FFk.col_skin] = skin_color_arr()[0]
	p[?FFk.col_und] = cloth_color_arr()[0]
	
	#region Attribute Init
		
	    // ATT CFG
	    p[?FFk.att_cfg] = ds_map_create()
	    var cfg = p[?FFk.att_cfg]
	    cfg[?FFk.free] = M.FF.attribute.free
	    cfg[?FFk.used] = M.FF.attribute.used
	    cfg[?FFk.total] = M.FF.attribute.total
		
	    // Endurance CFG
	    cfg[?FFk.end_cfg] = ds_map_create()
	    var cfg2 = cfg[?FFk.end_cfg]
	    cfg2[?FFk.uid] = M.FF.attribute.endurance.uid
	    cfg2[?FFk.str] = M.FF.attribute.endurance.str
	    cfg2[?FFk.val] = M.FF.attribute.endurance.val
	    cfg2[?FFk.val_mn] = M.FF.attribute.endurance.val_mn
	    cfg2[?FFk.val_mx] = M.FF.attribute.endurance.val_mx
	    cfg2[?FFk.desc] = M.FF.attribute.endurance.desc
		
	    // Strength CFG
	    cfg[?FFk.str_cfg] = ds_map_create()
	    cfg2 = cfg[?FFk.str_cfg]
	    cfg2[?FFk.uid] = M.FF.attribute.strength.uid
	    cfg2[?FFk.str] = M.FF.attribute.strength.str
	    cfg2[?FFk.val] = M.FF.attribute.strength.val
	    cfg2[?FFk.val_mn] = M.FF.attribute.strength.val_mn
	    cfg2[?FFk.val_mx] = M.FF.attribute.strength.val_mx
	    cfg2[?FFk.desc] = M.FF.attribute.strength.desc
		
	    // Dexterity CFG
	    cfg[?FFk.dex_cfg] = ds_map_create()
	    cfg2 = cfg[?FFk.dex_cfg]
	    cfg2[?FFk.uid] = M.FF.attribute.dexterity.uid
	    cfg2[?FFk.str] = M.FF.attribute.dexterity.str
	    cfg2[?FFk.val] = M.FF.attribute.dexterity.val
	    cfg2[?FFk.val_mn] = M.FF.attribute.dexterity.val_mn
	    cfg2[?FFk.val_mx] = M.FF.attribute.dexterity.val_mx
	    cfg2[?FFk.desc] = M.FF.attribute.dexterity.desc
		
	    // Intelligence CFG
	    cfg[?FFk.int_cfg] = ds_map_create()
	    cfg2 = cfg[?FFk.int_cfg]
	    cfg2[?FFk.uid] = M.FF.attribute.intelligence.uid
	    cfg2[?FFk.str] = M.FF.attribute.intelligence.str
	    cfg2[?FFk.val] = M.FF.attribute.intelligence.val
	    cfg2[?FFk.val_mn] = M.FF.attribute.intelligence.val_mn
	    cfg2[?FFk.val_mx] = M.FF.attribute.intelligence.val_mx
	    cfg2[?FFk.desc] = M.FF.attribute.intelligence.desc
		
	    // Charisma CFG
	    cfg[?FFk.cha_cfg] = ds_map_create()
	    cfg2 = cfg[?FFk.cha_cfg]
	    cfg2[?FFk.uid] = M.FF.attribute.charisma.uid
	    cfg2[?FFk.str] = M.FF.attribute.charisma.str
	    cfg2[?FFk.val] = M.FF.attribute.charisma.val
	    cfg2[?FFk.val_mn] = M.FF.attribute.charisma.val_mn
	    cfg2[?FFk.val_mx] = M.FF.attribute.charisma.val_mx
	    cfg2[?FFk.desc] = M.FF.attribute.charisma.desc
		
	    // Fate CFG
	    cfg[?FFk.fat_cfg] = ds_map_create()
	    cfg2 = cfg[?FFk.fat_cfg]
	    cfg2[?FFk.uid] = M.FF.attribute.fate.uid
	    cfg2[?FFk.str] = M.FF.attribute.fate.str
	    cfg2[?FFk.val] = M.FF.attribute.fate.val
	    cfg2[?FFk.val_mn] = M.FF.attribute.fate.val_mn
	    cfg2[?FFk.val_mx] = M.FF.attribute.fate.val_mx
	    cfg2[?FFk.desc] = M.FF.attribute.fate.desc
		
	#endregion
	
	return noone
	
}

function fini_char() {
	
	// Param
	var pmli = argument0
	
	// Init
	var p = M.FF.player.map_list[|pmli]
	
	// Position/Size Vars
	p[?FFk.xx] = M.FF.margin.RW2
	p[?FFk.yy] = M.FF.margin.RH2
	p[?FFk.rsz] = 100
	
	#region Stats
		
	    // STAT CFG
	    p[?FFk.stat_cfg] = ds_map_create()
	    var cfg = p[?FFk.stat_cfg]
		
	    // Health CFG
	    cfg[?FFk.hea_cfg] = ds_map_create()
	    var cfg2 = cfg[?FFk.hea_cfg]
	    cfg2[?FFk.mod_varr] = M.FF.stat.vHealth.mod_varr
	    cfg2[?FFk.str] = M.FF.stat.vHealth.str
	    cfg2[?FFk.val] = M.FF.stat.vHealth.val
	    cfg2[?FFk.val_mn] = M.FF.stat.vHealth.val_mn
	    cfg2[?FFk.val_mx] = M.FF.stat.vHealth.val_mx
	    cfg2[?FFk.type] = M.FF.stat.vHealth.type
	    cfg2[?FFk.rate] = M.FF.stat.vHealth.rate
	    cfg2[?FFk.rate_type] = M.FF.stat.vHealth.rate_type
		
	    init_stat(p,cfg2,M.FF.stat.vHealth.val_mx)
	    cfg2[?FFk.pct] = pct(cfg2[?FFk.val],cfg2[?FFk.val_mn],cfg2[?FFk.val_mx])
		
	    // Mana CFG
	    cfg[?FFk.man_cfg] = ds_map_create()
	    var cfg2 = cfg[?FFk.man_cfg]
	    cfg2[?FFk.mod_varr] = M.FF.stat.mana.mod_varr
	    cfg2[?FFk.str] = M.FF.stat.mana.str
	    cfg2[?FFk.val] = M.FF.stat.mana.val
	    cfg2[?FFk.val_mn] = M.FF.stat.mana.val_mn
	    cfg2[?FFk.val_mx] = M.FF.stat.mana.val_mx
	    cfg2[?FFk.type] = M.FF.stat.mana.type
	    cfg2[?FFk.rate] = M.FF.stat.mana.rate
	    cfg2[?FFk.rate_type] = M.FF.stat.mana.rate_type
		
	    init_stat(p,cfg2,M.FF.stat.mana.val_mx)
	    cfg2[?FFk.pct] = pct(cfg2[?FFk.val],cfg2[?FFk.val_mn],cfg2[?FFk.val_mx])
		
	    // Stamina CFG
	    cfg[?FFk.sta_cfg] = ds_map_create()
	    var cfg2 = cfg[?FFk.sta_cfg]
	    cfg2[?FFk.mod_varr] = M.FF.stat.stamina.mod_varr
	    cfg2[?FFk.str] = M.FF.stat.stamina.str
	    cfg2[?FFk.val] = M.FF.stat.stamina.val
	    cfg2[?FFk.val_mn] = M.FF.stat.stamina.val_mn
	    cfg2[?FFk.val_mx] = M.FF.stat.stamina.val_mx
	    cfg2[?FFk.type] = M.FF.stat.stamina.type
	    cfg2[?FFk.rate] = M.FF.stat.stamina.rate
	    cfg2[?FFk.rate_type] = M.FF.stat.stamina.rate_type
		
	    init_stat(p,cfg2,M.FF.stat.stamina.val_mx)
	    cfg2[?FFk.pct] = pct(cfg2[?FFk.val],cfg2[?FFk.val_mn],cfg2[?FFk.val_mx])
		
	    // Hunger CFG
	    cfg[?FFk.hun_cfg] = ds_map_create()
	    var cfg2 = cfg[?FFk.hun_cfg]
	    cfg2[?FFk.mod_varr] = M.FF.stat.hunger.mod_varr
	    cfg2[?FFk.str] = M.FF.stat.hunger.str
	    cfg2[?FFk.val] = M.FF.stat.hunger.val
	    cfg2[?FFk.val_mn] = M.FF.stat.hunger.val_mn
	    cfg2[?FFk.val_mx] = M.FF.stat.hunger.val_mx
	    cfg2[?FFk.type] = M.FF.stat.hunger.type
	    cfg2[?FFk.rate] = M.FF.stat.hunger.rate
	    cfg2[?FFk.rate_type] = M.FF.stat.hunger.rate_type
		
	    init_stat(p,cfg2,M.FF.stat.hunger.val_mx)
	    cfg2[?FFk.pct] = pct(cfg2[?FFk.val],cfg2[?FFk.val_mn],cfg2[?FFk.val_mx])
		
	    // Thirst CFG
	    cfg[?FFk.thi_cfg] = ds_map_create()
	    var cfg2 = cfg[?FFk.thi_cfg]
	    cfg2[?FFk.mod_varr] = M.FF.stat.thirst.mod_varr
	    cfg2[?FFk.str] = M.FF.stat.thirst.str
	    cfg2[?FFk.val] = M.FF.stat.thirst.val
	    cfg2[?FFk.val_mn] = M.FF.stat.thirst.val_mn
	    cfg2[?FFk.val_mx] = M.FF.stat.thirst.val_mx
	    cfg2[?FFk.type] = M.FF.stat.thirst.type
	    cfg2[?FFk.rate] = M.FF.stat.thirst.rate
	    cfg2[?FFk.rate_type] = M.FF.stat.thirst.rate_type
		
	    init_stat(p,cfg2,M.FF.stat.thirst.val_mx)
	    cfg2[?FFk.pct] = pct(cfg2[?FFk.val],cfg2[?FFk.val_mn],cfg2[?FFk.val_mx])
		
	    // Sleep CFG
	    cfg[?FFk.sle_cfg] = ds_map_create()
	    var cfg2 = cfg[?FFk.sle_cfg]
	    cfg2[?FFk.mod_varr] = M.FF.stat.sleep.mod_varr
	    cfg2[?FFk.str] = M.FF.stat.sleep.str
	    cfg2[?FFk.val] = M.FF.stat.sleep.val
	    cfg2[?FFk.val_mn] = M.FF.stat.sleep.val_mn
	    cfg2[?FFk.val_mx] = M.FF.stat.sleep.val_mx
	    cfg2[?FFk.type] = M.FF.stat.sleep.type
	    cfg2[?FFk.rate] = M.FF.stat.sleep.rate
	    cfg2[?FFk.rate_type] = M.FF.stat.sleep.rate_type
		
	    init_stat(p,cfg2,M.FF.stat.sleep.val_mx)
	    cfg2[?FFk.pct] = pct(cfg2[?FFk.val],cfg2[?FFk.val_mn],cfg2[?FFk.val_mx])
		
	    // Speed CFG
	    cfg[?FFk.spe_cfg] = ds_map_create()
	    var cfg2 = cfg[?FFk.spe_cfg]
	    cfg2[?FFk.mod_varr] = M.FF.stat.vSpeed.mod_varr
	    cfg2[?FFk.str] = M.FF.stat.vSpeed.str
	    cfg2[?FFk.val] = M.FF.stat.vSpeed.val
	    cfg2[?FFk.type] = M.FF.stat.vSpeed.type
	    cfg2[?FFk.rate_type] = M.FF.stat.vSpeed.rate_type
		
	    init_stat(p,cfg2,M.FF.stat.vSpeed.val)
	    cfg2[?FFk.pct] = 1
		
	    // PCT Totals
	    cfg[?FFk.need_pct] = round2(((cfg[?FFk.hun_cfg][?FFk.pct] + cfg[?FFk.thi_cfg][?FFk.pct]
	                        + cfg[?FFk.sle_cfg][?FFk.pct])/3)*100,2)/100
	    cfg[?FFk.condition_pct] = round2(((cfg[?FFk.hea_cfg][?FFk.pct] + cfg[?FFk.man_cfg][?FFk.pct]
	                        + cfg[?FFk.sta_cfg][?FFk.pct])/3)*100,2)/100
		
	#endregion
	
	return noone
	
}

function init_stat() {
	
	// Params
	var p = argument0
	var cfg2 = argument1
	var stat_dlt = argument2
	
	for(var iy = 0; iy < array_height_2d(cfg2[?FFk.mod_varr]); iy++) {
		
	    var mo = cfg2[?FFk.mod_varr][iy][0]
	    var va = cfg2[?FFk.mod_varr][iy][1] 
		
	    var ky = ds_map_find_first(p[?FFk.att_cfg])
	    while(!is_undefined(p[?FFk.att_cfg][?ky])) {
			
	        if(!is_undefined(p[?FFk.att_cfg][?ky][?FFk.uid])
	            and p[?FFk.att_cfg][?ky][?FFk.uid] == mo.uid) {
				
	            var dlt = round2(stat_dlt * ((p[?FFk.att_cfg][?ky][?FFk.val]-1) * va),1)
				
	            if(cfg2[?FFk.type] == FFv.pos) { // Positive Value Type Mod
					
	                cfg2[?FFk.val_mx] += dlt
	                cfg2[?FFk.val] = clamp(cfg2[?FFk.val]+dlt,cfg2[?FFk.val_mn],cfg2[?FFk.val_mx])
					
	            } else if(cfg2[?FFk.type] == FFv.neu) { // Neutral Value Type Mod
					
	                cfg2[?FFk.val] += dlt
					
	            } else if(cfg2[?FFk.type] == FFv.neg) { // Negative Value Type Mod
					
	                cfg2[?FFk.val_mx] += dlt
	                cfg2[?FFk.val] = clamp(cfg2[?FFk.val]-dlt,cfg2[?FFk.val_mn],cfg2[?FFk.val_mx])
					
	            }
				
	        }
			
	        ky = ds_map_find_next(p[?FFk.att_cfg],ky)
			
	    }
		
	}
	
}

function string_complex_inline() {
	
	// Params
	var str_arr = argument0
	
	var res_str = ""
	for(var iy = 0; iy < array_height_2d(str_arr); iy++) {
		
	    var e = noone
	    if(!is_array(str_arr[iy])) res_str += string(str_arr[iy])
	    else {
			
	        e = str_arr[iy][0]
	        for(var ix = 1; ix < array_length_2d(str_arr,iy); ix++) {
				
	            if(ix == array_length_2d(str_arr,iy)-1)
	                res_str += string(e[?str_arr[iy][ix]])
	            else e = e[?str_arr[iy][ix]]
				
	        }
			
	    }
		
	}
	
	return res_str
	
}

function string_complex_multiline() {
	
	// Params
	var str_arr = argument0
	
	// Init Resulting String
	var res_str = ""
	for(var iy = 0; iy < array_height_2d(str_arr); iy++) { // Loop through 2d array rows
		
	    if(!is_array(str_arr[iy])) {
			
	        // This row isn'true an array, it is just a single string, so we add it as its own line.
	        res_str += string(str_arr[iy]) + M.FF.line_break
	        continue
			
	    } else {
			
	        // Init ref as noone
	        var e = noone
	        for(var ix = 0; ix < array_length_2d(str_arr,iy); ix++) { // Loop through 2d array columns
				
	            if(e == noone and !is_string(str_arr[iy][ix])) e = str_arr[iy][ix]
	            else if(is_string(str_arr[iy][ix])) { // Append strings in the row to the result
	                if(e != noone) { // If there is a pointer, add the pointed value first
	                    res_str += string(e)
	                    e = noone // Clear the pointer
	                }
	                res_str += string(string(str_arr[iy][ix])) // Now append the string
	            } else if(e != noone and ix == array_length_2d(str_arr,iy)-1) // If end of array and pointer is set..
	                res_str += string(e[?str_arr[iy][ix]]) // Add the pointed value
	            else e = e[?str_arr[iy][ix]] // Otherwise, Continue accessor chain of pointer
				
	        }
			
	    }
		
	    // If there is another row, go to next line in result
	    if(iy != array_height_2d(str_arr)-1) res_str += M.FF.line_break
		
	}
	
	// Return Resulting String
	return res_str
	
}

function pct() {
	
	// Params
	var val = argument0
	var val_mn = argument1
	var val_mx = argument2
	
	// Return PCT of value based on range as a val 0 to 1.
	return ( ( ( val - val_mn ) * 100 ) / ( val_mx - val_mn ) ) / 100
	
}

function map_val_arr() {
	
	// Params
	var val_arr = argument0
	
	var res_map = ds_map_create()
	var arr_h = array_height_2d(val_arr)
	for(var iy = 0; iy < arr_h; iy++) {
		
	    var sub_len = array_length_2d(val_arr,iy)
	    var e = val_arr[iy][0]
	    for(var ix = 1; ix < sub_len; ix++) {
			
	        if(ix == sub_len-1) {
				
	            res_map[?val_arr[iy][ix]] = e[?val_arr[iy][ix]]
				
	        } else e = e[?val_arr[iy][ix]]
			
	    }
		
	}
	
	return res_map
	
}

function get_stat_mods() {
	
	// Params
	var p = argument0
	var cfg = argument1
	
	var res_val = 0
	for(var iy = 0; iy < array_height_2d(cfg[?FFk.mod_varr]); iy++) {
		
	    var base_attribute = cfg[?FFk.mod_varr][iy][0]
	    var weight = cfg[?FFk.mod_varr][iy][1] 
		
	    var ky = ds_map_find_first(p[?FFk.att_cfg])
	    while(!is_undefined(p[?FFk.att_cfg][?ky])) {
			
	        if(!is_undefined(p[?FFk.att_cfg][?ky][?FFk.uid])
	            and p[?FFk.att_cfg][?ky][?FFk.uid] == base_attribute.uid)
	            res_val += p[?FFk.att_cfg][?ky][?FFk.val]*weight
			
	        ky = ds_map_find_next(p[?FFk.att_cfg],ky)
			
	    }
		
	}
	
	return res_val
	
}

function get_limit() {
	
	// Params
	var val = argument0
	var pol = argument1 // Polarity
	
	if(pol == FFv.pos) {
		
	    if(val > M.FF.limit.pos.most) return M.FF.limit.pos.most
	    else if(val > M.FF.limit.pos.highest) return M.FF.limit.pos.highest
	    else if(val > M.FF.limit.pos.higher) return M.FF.limit.pos.higher
	    else if(val > M.FF.limit.pos.high) return M.FF.limit.pos.high
	    else if(val > M.FF.limit.pos.medium_high) return M.FF.limit.pos.medium_high
	    else if(val > M.FF.limit.pos.medium) return M.FF.limit.pos.medium
	    else if(val > M.FF.limit.pos.medium_low) return M.FF.limit.pos.medium_low
	    else if(val > M.FF.limit.pos.low) return M.FF.limit.pos.low
	    else if(val > M.FF.limit.pos.lower) return M.FF.limit.pos.lower
	    else if(val > M.FF.limit.pos.lowest) return M.FF.limit.pos.lowest
	    else return M.FF.limit.pos.least
		
	} else if(pol == FFv.neg) {
		
	    if(val > M.FF.limit.neg.most) return M.FF.limit.neg.most
	    else if(val > M.FF.limit.neg.highest) return M.FF.limit.neg.highest
	    else if(val > M.FF.limit.neg.higher) return M.FF.limit.neg.higher
	    else if(val > M.FF.limit.neg.high) return M.FF.limit.neg.high
	    else if(val > M.FF.limit.neg.medium_high) return M.FF.limit.neg.medium_high
	    else if(val > M.FF.limit.neg.medium) return M.FF.limit.neg.medium
	    else if(val > M.FF.limit.neg.medium_low) return M.FF.limit.neg.medium_low
	    else if(val > M.FF.limit.neg.low) return M.FF.limit.neg.low
	    else if(val > M.FF.limit.neg.lower) return M.FF.limit.neg.lower
	    else if(val > M.FF.limit.neg.lowest) return M.FF.limit.neg.lowest
	    else return M.FF.limit.neg.least
		
	}
	
}

function spawn_entity() {
	
	// Init
	var valid = true
	var toi = 0
	
	// To Return
	var xx = noone
	var yy = noone
	var uid = noone
	var scl = noone
	
	do {
		
	    // Init X/Y
	    xx = irandom_range(100,M.FF.runtime_width-100)
	    yy = irandom_range(100,M.FF.runtime_height-100)
	    uid = irandom_range(0,5)
	    scl = round2(random_range(.8,1.2),2)
		
	    // Make sure new entity isnt ontop/too close to another entity
	    for(var i = 0; i < ds_list_size(M.FF.entity.map_list); i++) {
			
	        var e = M.FF.entity.map_list[|i]
			
	        if(point_distance(e[?FFk.xx],e[?FFk.yy],xx,yy) <= 100)
	            valid = false
			
	    }
	    for(var i = 0; i < ds_list_size(M.FF.entity.dynamic.map_list); i++) {
			
	        var e = M.FF.entity.dynamic.map_list[|i]
			
	        if(point_distance(e[?FFk.xx],e[?FFk.yy],xx,yy) <= 100)
	            valid = false
			
	    }
		
	    if(!valid) toi += 1
		
	} until(valid or toi >= M.FF.main.to_lim)
	
	if(!valid) return noone
	return [xx,yy,uid,scl]
	
}

function add_to_inv() {
	
	// Params
	var pmli = argument0
	var e = argument1
	// Extract
	var inv = get_p_inv(pmli)
	
	var stack = e[?FFk.ref].stack
	var no_stack = !stack
	var cmp = inv[?FFk.cmpnt_cfg][?FFk.varr][3][0]
	var g = cmp[?FFk.grid]
	var gw = ds_grid_width(g)
	var gh = ds_grid_height(g)
	for(var iy = 0; iy < gh; iy++) {
		
	    for(var ix = 0; ix < gw; ix++) {
			
	        if(stack and !no_stack and g[#ix,iy][?FFk.val_arr] != noone) {
				
	            // UID Match
	            if(g[#ix,iy][?FFk.val_arr][0][?FFk.ref].uid == e[?FFk.ref].uid) {
					
	                // Fit in stack?
	                var sz = array_length_1d(g[#ix,iy][?FFk.val_arr])
	                if(sz < e[?FFk.ref].stack_lim) {
						
	                    // Add to Stack and Return True
	                    g[#ix,iy][?FFk.val_arr][sz] = e
	                    return true
						
	                }
					
	            }
				
	        // Get Next Empty Slot
	        } else if(g[#ix,iy][?FFk.val] == noone and g[#ix,iy][?FFk.val_arr] == noone
	            and no_stack) {
				
	            // If Stack, add to val_arr, if not add to val
	            // Then return True
	            if(stack) {
					
	                g[#ix,iy][?FFk.val_arr] = []
	                g[#ix,iy][?FFk.val_arr][0] = e
					
	            } else g[#ix,iy][?FFk.val] = e
				
	            return true
				
	        }
        
	        // If No Stack found, restart and get next open inv
	        if(stack and !no_stack and iy >= gh-1 and ix >= gw-1) {
				
	            no_stack = true
	            iy = -1
				
	        }
        
	    }
		
	}
	
	// If no open ever found return false
	return false
	
}

function get_p_inv() {
	
	// Param
	var pmli = argument0
	
	var res = noone
	var gfml_sz = ds_list_size(M.FF.frame.map_list)
	for(var i = 0; i < gfml_sz; i++) {
		
	    var e = M.FF.frame.map_list[|i]
		
	    if(e[?FFk.uid] != string("{0}{1}{2}",M.FF.command.inv.str,M.FF.command.menu_infix,pmli)) continue
	    else { 
			
	        res = e
	        break
			
	    }
		
	}
	
	return res
	
}

function array_to_list() {
	
	// Param
	var arr = argument0
	
	// Init
	var res_list = ds_list_create()
	var arr_sz = array_length_1d(arr)
	
	// Add Array to List
	for(var i = 0; i < arr_sz; i++)
	    ds_list_add(res_list,arr[i])
	
	// If empty, destroy and set res to noone
	if(ds_list_empty(res_list)) {
		
	    ds_list_destroy(res_list)
	    res_list = noone
		
	}
	
	// Return
	return res_list
	
}

function list_to_array() {
	
	// NOTE: WILL NEED TO DESTROY LIST IF NEEDED AFTER SCRIPT
	// Param
	var l = argument0
	
	// Init
	var res_arr = []
	var l_sz = ds_list_size(l)
	
	// Add Array to List
	for(var i = 0; i < l_sz; i++)
	    res_arr[i] = l[|i]
	
	// If empty, destroy and set res to noone
	if(res_arr == [])
	    res_arr = noone
	
	// Return
	return res_arr
	
}

function list_pop() {
	
	// Params
	var l = argument0
	
	if(ds_exists(l,ds_type_list) and !ds_list_empty(l)) {
		
	    var rtn = l[|0]
	    ds_list_delete(l,0)
	    return rtn
		
	} else return noone
	
}

function array_pop() {
	
	/*
	 *  NOTE: Returns an arr,
	 *  i:0 = popped element,
	 *  i:1 = array supplied with popped element removed
	 */
	
	// Params
	var arr = argument0
	
	var arr_len = array_length_1d(arr)
	if(is_array(arr) and arr_len > 0) {
		
	    var rtn = arr[0]
	    var arr_rtn = []
	    if(arr_len == 1)
	        arr_rtn = noone
	    else array_copy(arr_rtn,0,arr,1,array_length_1d(arr))
	    return [rtn,arr_rtn]
		
	} else return noone
	
}

function drop_entity() {
	
	// Params
	var p = argument0
	var e = argument1
	
	// Drop T/B of Player
	if(chance(50)) {
    
	    if(chance(50)) e[?FFk.yy] = p[?FFk.yy]-(p[?FFk.rsz]*1.25)
	    else e[?FFk.yy] = p[?FFk.yy]+(p[?FFk.rsz]*1.25)
	    e[?FFk.xx] = irandom_range(p[?FFk.xx]-p[?FFk.rsz],p[?FFk.xx]+p[?FFk.rsz])
		
	// Drop L/R of Player
	} else {
		
	    if(chance(50)) e[?FFk.xx] = p[?FFk.xx]-(p[?FFk.rsz]*1.25)
	    else e[?FFk.xx] = p[?FFk.xx]+(p[?FFk.rsz]*1.25)
	    e[?FFk.yy] = irandom_range(p[?FFk.yy]-p[?FFk.rsz],p[?FFk.yy]+p[?FFk.rsz])
		
	}
	
	ds_list_add(M.FF.entity.dynamic.map_list,e)
	
	return noone
	
}

function invert_array() {
	
	var arr = argument0
	var ret = []
	
	var arr_sz = array_length_1d(arr)
	for(var i = arr_sz-1; i >= 0; i--)
	    ret[abs(i-(arr_sz-1))] = arr[i]
	
	if(ret == []) return noone
	else return ret
	
}

function list_find_self() {
	
	// Params
	var toFind = argument0
	var list = argument1
	
	var l_sz = ds_list_size(list)
	for(var i = 0; i < l_sz; i++)
	    if(toFind == list[|i]) return i
	
	return noone
	
}

function string_word_count() {
	
	var str = argument0
	return array_length_1d(string_split(str," "))
	
}

function list_to_string() {
	
	// Params
	var l = argument0
	
	var str_ret = ""
	for(var i = 0; i < ds_list_size(l); i++)
	    str_ret += l[|i]
	
	return str_ret
	
}

function string_extract_word() {
	
	// Params
	var str = argument0
	var toGet = argument1
	var remove = argument2
	
	// Init
	var word = ""
	var arr = string_split(str," ")
	var ws = [string_extract_whitespace(str,toGet-1,false),string_extract_whitespace(str,toGet,false)]
	
	// Return noone if can'true extract
	if(array_length_1d(arr) < toGet) return noone
	else word = arr[toGet]
	
	// Return
	if(remove) return [word,ws,string_join2(array_del(arr,toGet)," ")]
	else return [word,ws,str]
	
}

function array_del() {
	
	//Params
	var arr = argument0
	var ind = argument1
	
	// Init
	var arrl = array_length_1d(arr)
	var ret_arr = []
	
	// Return orig arr if index out of bounds
	if(arrl < ind) return arr
	else {
		
	    // Build return arr, skipping element to remove
	    var ret_arr = []
	    for(var i = 0; i < arrl; i++)
	        if(i == ind) continue
	        else ret_arr[array_length_1d(ret_arr)] = arr[i]
		
	}
	
	return ret_arr
	
}

function string_wrap_count() {
	
	// Params
	var str = argument0
	var w = argument1
	
	// Init
	return floor(string_width(str)/w)
	
}

function list_split() {
	
	// Params
	var l = argument0
	var li = argument1
	var remove = argument2
	
	// Init
	var l_sz = ds_list_size(l)
	var l2 = ds_list_create()
	
	// Add from list to new list
	for(var i = li; i < l_sz; i++)
	    ds_list_add(l2,l[|i])
	
	// Remove from old list
	if(remove) while(li < ds_list_size(l))
	    ds_list_delete(l,li)
	
	// Return new List
	return l2
	
}

function list_join() {
	
	// Params
	var src = argument0
	var dst = argument1
	var pos = argument2
	var destroy = argument3
	
	// Init
	var src_sz = ds_list_size(src)
	var posi = 0
	
	// Add from src to dst
	for(var i = 0; i < src_sz; i++) {
		
	    if(pos != noone) {
			
	        ds_list_insert(dst,pos+posi,src[|i])
	        posi += 1
			
	    } else ds_list_add(dst,src[|i])
		
	}
	
	// Destroy src
	if(destroy) ds_list_destroy(src)
	
	// Return nothing
	return noone
	
}

function list_extract_string() {
	
	// Params
	var l = argument0
	
	// Init and Extract
	var str_ret = ""
	for(var i = 0; i < ds_list_size(l); i++)
	    str_ret += string(l[|i])
	
	// Return Extract
	return str_ret
	
}

function string_extract_whitespace() {
	
	// Params
	var str = argument0
	var toGet = argument1
	var remove = argument2
	
	// Init
	var len = string_length(str)
	var ret_arr = [""]
	var ret_arri = 0
	for(var i = 0; i < len+1; i++) {
		
	    var c = string_char_at(str,i)
		
	    if(ret_arr[ret_arri] != "" and c != " ") {
			
	        ret_arri += 1
	        ret_arr[ret_arri] = ""
			
	    } else if(c == " ") ret_arr[ret_arri] += c
		
	}
	
	if(ret_arr == [""]) return noone
	else return ret_arr[toGet]
	
}

function stack_can_take() {
	
	#region Params
    
	    var slot = argument0
    
	#endregion
	
	// Return noone if slot and drag are empty
	if(slot[?FFk.val_arr] == noone and M.FF.mouse_drag_list == noone) return noone
	
	// Otherwise grab references and compare stack sizes for space
	// Init Source (Slot)
	var src_ref = noone
	var src_stack = 0
	if(slot[?FFk.val_arr] == noone) {
		
	    src_ref = M.FF.mouse_drag_list[|0][?FFk.ref]
		
	} else {
		
	    src_ref = slot[?FFk.val_arr][0][?FFk.ref]
	    src_stack = array_length_1d(slot[?FFk.val_arr])
		
	}
	
	// Init Destination (Drag List)
	var dst_ref = noone
	var dst_stack = 0
	if(M.FF.mouse_drag_list == noone) {
		
	    dst_ref = slot[?FFk.val_arr][0][?FFk.ref]
		
	} else {
		
	    dst_ref = M.FF.mouse_drag_list[|0][?FFk.ref]
	    dst_stack = ds_list_size(M.FF.mouse_drag_list)
		
	}
	
	// Compare and return delta unless uids don't match or not able to give
	var delta = min((src_ref.stack_lim*M.FF.entity.stack_pickup_multiplier)-dst_stack, src_stack)
	if(src_ref.uid == dst_ref.uid
	    and delta > 0) return delta
	else return false
	
}

function stack_can_give() {
	
	#region Params
		
	    var slot = argument0
		
	#endregion
	
	// Return noone if slot and drag are empty
	if(slot[?FFk.val_arr] == noone and M.FF.mouse_drag_list == noone) return noone
	
	// Init Source (Drag List)
	var src_ref = noone
	var src_stack = 0
	if(M.FF.mouse_drag_list == noone) {
		
	    src_ref = slot[?FFk.val_arr][0][?FFk.ref]
		
	} else {
		
	    src_ref = M.FF.mouse_drag_list[|0][?FFk.ref]
	    src_stack = ds_list_size(M.FF.mouse_drag_list)
		
	}
	
	// Otherwise grab references and compare stack sizes for space
	// Init Destination (Slot)
	var dst_ref = noone
	var dst_stack = 0
	if(slot[?FFk.val_arr] == noone) {
		
	    dst_ref = M.FF.mouse_drag_list[|0][?FFk.ref]
		
	} else {
		
	    dst_ref = slot[?FFk.val_arr][0][?FFk.ref]
	    dst_stack = array_length_1d(slot[?FFk.val_arr])
		
	}
	
	// Compare and return delta unless uids don't match or not able to give
	var delta = min(src_stack, src_ref.stack_lim - dst_stack)
	if(src_ref.uid == dst_ref.uid
	    and delta > 0) return delta
	else return false
	
}

function slot_drag_type_check() {
	
	// Params
	var drag_ref = argument0
	var slot_type = argument1
	
	// If slot is noone then auto match
	if(slot_type == noone) {
		
	    if(M.FF.debug_slot_grid_types)
	        trace("slot type match?: slot_type is noone (no type requirement; true)")
	    return true
		
	} else {
		
	    // If slot type noone, auto match
	    if(drag_ref == noone) {
			
	        if(M.FF.debug_slot_grid_types)
	            trace("slot type match?: drag_ref is noone type (nothing to check; true)")
	        return true
			
	    } else {
			
	        if(is_array(drag_ref.slots)) {
				
	            for(var i = 0; i < array_length_1d(drag_ref.slots); i++) {
					
	                if(drag_ref.slots[i] == slot_type.uid) {
						
	                    if(M.FF.debug_slot_grid_types)
	                        trace("slot type match?: " + drag_ref.slots[i1]
	                            + " matches " + slot_type + " (match found; true)")
	                    return true
						
	                }
                
	            }
            
	       }
        
	    }
    
	}
	
	// Otherwise no match found, return false
	if(M.FF.debug_slot_grid_types)
	    trace("slot type match?: No match found (requirements not met; false)")
	return false
	
}

function color_get_composite_percentage() {
	
	// Param
	var color = argument0
	
	// Init
	var rgb_arr = get_color_rgb(color)
	var sum = array_sum_of_elements_1d(rgb_arr)
	
	return round2(765/sum,2)
	
}

function array_sum_of_elements_1d() {
	
	// Param
	var arr = argument0
	
	// Init
	if(!array_is_numbers_1d(arr)) return noone
	var sum = 0
	var arr_len = array_length_1d(arr)
	
	// Add em' up!
	for(var i = 0; i < arr_len; i++)
	    sum += int64(arr[i])
	
	return sum
	
}

function array_is_numbers_1d() {
	
	// Param
	var arr = argument0
	
	// Init
	var arr_len = array_length_1d(arr)
	for(var i = 0; i < arr_len; i++)
	    if(!is_int64(arr[i])) return false
	
	return true
	
}

function array_dupe() {
	
	// Params
	var dst = argument0
	var src = argument1
	
	// Init
	var dst = []
	
	// Return noone if src not array
	if(!is_array(src)) return noone
	
	array_copy(dst,0,src,0,array_length_1d(src))
	
	return dst
	
}