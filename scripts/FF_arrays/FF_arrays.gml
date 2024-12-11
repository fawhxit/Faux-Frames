// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function display_mode_arr() {
	
	return [M.FF.option.windowed,M.FF.option.fullscreen,M.FF.option.borderless]
	
}

function resolution_arr() {
	
	return [M.FF.display.a,M.FF.display.b,M.FF.display.c,M.FF.display.d,M.FF.display.e,M.FF.display.f,M.FF.display.g,M.FF.display.h,M.FF.display.i,
		M.FF.display.j,M.FF.display.k,M.FF.display.l,M.FF.display.m,M.FF.display.n,M.FF.display.o,M.FF.display.p,M.FF.display.q]
	
}

function gfx_arr() {
	
	var r = [M.FF.anti_alias.low]
	
	if(display_aa == 2) r = [M.FF.anti_alias.low,M.FF.anti_alias.medium]
	else if(display_aa == 4) r = [M.FF.anti_alias.low,M.FF.anti_alias.high]
	else if(display_aa == 6) r = [M.FF.anti_alias.low,M.FF.anti_alias.medium,M.FF.anti_alias.high]
	else if(display_aa == 8) r = [M.FF.anti_alias.low,M.FF.anti_alias.highest]
	else if(display_aa == 10) r = [M.FF.anti_alias.low,M.FF.anti_alias.medium,M.FF.anti_alias.highest]
	else if(display_aa == 12) r = [M.FF.anti_alias.low,M.FF.anti_alias.high,M.FF.anti_alias.highest]
	else if(display_aa == 14) r = [M.FF.anti_alias.low,M.FF.anti_alias.medium,M.FF.anti_alias.high,M.FF.anti_alias.highest]
	
	return r
	
}

function hair_color_arr() {
	
	return [M.FF.color.brown,M.FF.color.gold,M.FF.color.ginger,M.FF.color.black,M.FF.color.gray.darkest,
		M.FF.color.gray.darker,M.FF.color.gray.dark,M.FF.color.gray,M.FF.color.gray.light,M.FF.color.gray.lighter,
		M.FF.color.gray.lightest,M.FF.color.white]
	
}

function eye_color_arr() {
	
	return [M.FF.color.black,M.FF.color.brown,M.FF.color.bronze,M.FF.color.green,M.FF.color.green.dark,
		M.FF.color.copper_rust,M.FF.color.blue,M.FF.color.blue.dark]
	
}

function skin_color_arr() {
	
	return [M.FF.color.pale_skin,M.FF.color.light_skin,M.FF.color.tan_skin,M.FF.color.dark_skin,
		M.FF.color.darker_skin]
	
}

function cloth_color_arr() {
	
	return [M.FF.color.red,M.FF.color.red.light,M.FF.color.green,M.FF.color.green.light,M.FF.color.blue,
		M.FF.color.blue.light,M.FF.color.black,M.FF.color.gray.darkest,M.FF.color.gray.darker,
		M.FF.color.gray.dark,M.FF.color.gray,M.FF.color.gray.light,M.FF.color.gray.lighter,
		M.FF.color.gray.lightest,M.FF.color.white,M.FF.color.cyan,M.FF.color.cyan.light,M.FF.color.yellow,
		M.FF.color.yellow.light,M.FF.color.purple,M.FF.color.purple.light,M.FF.color.orange,
		M.FF.color.copper_rust,M.FF.color.brown,M.FF.color.bronze,M.FF.color.silver,M.FF.color.gold,
		M.FF.color.ginger,M.FF.color.pink]
	
}