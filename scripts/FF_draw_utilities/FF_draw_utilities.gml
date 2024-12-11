function draw_player_at(){
	
	var p = argument0
	var xx = argument1
	var yy = argument2
	var scl = argument3
	
	var p = M.FF.player.map_list[|0]
	draw_set_alpha(1)
	
	// Draw Body
	draw_set_color(p[?FFk.col_skin].rgb)
	draw_circle(xx,yy,p[?FFk.rsz]*scl,false)
	
	// Draw Underwear (outline)
	draw_set_color(p[?FFk.col_und].rgb)
	draw_circle(xx,yy,p[?FFk.rsz]*scl,true)
	draw_circle(xx,yy,(p[?FFk.rsz]+1)*scl,true)
	draw_circle(xx,yy,(p[?FFk.rsz]+2)*scl,true)
	draw_circle(xx,yy,(p[?FFk.rsz]+3)*scl,true)
	draw_circle(xx,yy,(p[?FFk.rsz]+4)*scl,true)
	
	// Draw Hair
	var xy = []
	if(p[?FFk.gender] == FFv.male) {
		
	    xy[0] = xx-((p[?FFk.rsz]*scl)*.25)
	    xy[1] = yy-((p[?FFk.rsz]*scl)*1.34)
	    xy[2] = xx+((p[?FFk.rsz]*scl)*.25)
		
	} else {
		
	    xy[0] = xx-(p[?FFk.rsz]*scl)
	    xy[1] = yy-((p[?FFk.rsz]*scl)*1.05)
	    xy[2] = xx+(p[?FFk.rsz]*scl)
		
	}
	xy[3] = yy-((p[?FFk.rsz]*scl)*.6)
	
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
	draw_circle(xx-((p[?FFk.rsz]*scl)/4),yy-((p[?FFk.rsz]*scl)/4),(p[?FFk.rsz]*scl)/4,false)
	draw_circle(xx+((p[?FFk.rsz]*scl)/4),yy-((p[?FFk.rsz]*scl)/4),(p[?FFk.rsz]*scl)/4,false)
	
	// Draw Mouth
	draw_set_color(p[?FFk.col_eye].rgb)
	draw_line_width(xx-((p[?FFk.rsz]*scl)/2),yy+((p[?FFk.rsz]*scl)/2),
	    xx+((p[?FFk.rsz]*scl)/2),yy+((p[?FFk.rsz]*scl)/2),5)
	
}

function draw_screen() {
	
	// BG
	draw_set_alpha(M.FF.runtime_background_alpha)
	draw_set_color(M.FF.runtime_background_color)
	draw_rectangle(0,0,M.FF.runtime_width,M.FF.runtime_height,false)
	
	// FG
	draw_set_alpha(M.FF.runtime_foreground_alpha)
	draw_set_color(M.FF.runtime_foreground_color)
	draw_rectangle(0,0,M.FF.runtime_width,M.FF.runtime_height,true)
	
	return noone
	
}