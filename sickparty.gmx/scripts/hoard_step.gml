//argument0 = surface name
//argument1 = background color



surface_set_target(argument0)

        draw_clear_alpha(c_white,0)
        
        
        if(FILL=true){
        draw_set_color(argument1)
        
        draw_rectangle(0,0,400,240,false)
        
        draw_set_color(c_white)
        }
        
        
        //if any of the SPRbg slots are used, draw them
        if not(SPRbg1=-1)
        draw_sprite(SPRbg1,-1,0,0)

        if not(SPRbg2=-1)
        draw_sprite(SPRbg2,-1,0,0)
        
        if not(SPRbg2=-1)
        draw_sprite(SPRbg3,-1,0,0)
        
        //
        
        var set=0;
        repeat(SPR1num){
            draw_sprite_ext(SPR1,SPR1img[set],SPR1x[set],SPR1y[set],1,1,SPR1ang[set],c_white,1)
            set+=1
        }
        set=0
        repeat(SPR2num){
            draw_sprite_ext(SPR2,SPR2img[set],SPR2x[set],SPR2y[set],1,1,SPR2ang[set],c_white,1)
            set+=1
        }
        set=0
        repeat(SPR3num){
            draw_sprite_ext(SPR3,SPR3img[set],SPR3x[set],SPR3y[set],1,1,SPR3ang[set],c_white,1)
            set+=1
        }
surface_reset_target()