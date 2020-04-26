

surface_set_target(SURout);
draw_clear(c_white)
        var set=0;
        
        //draw background color
        draw_set_color(MYcol)
        draw_rectangle(0,0,440,280,false)
        draw_set_color(c_white)
        
        
        
        repeat(ONEnum){
            draw_sprite_ext(ONEspr,ONEimg[set],ONEx[set],ONEy[set],1,1,ONEang[set],c_white,1)
            set+=1
        }
        
         set=0
        repeat(TWOnum){
            draw_sprite_ext(TWOspr,TWOimg[set],TWOx[set],TWOy[set],1,1,TWOang[set],c_white,1)
            set+=1
        }
        
        set=0
        repeat(THREEnum){
            draw_sprite_ext(THREEspr,THREEimg[set],THREEx[set],THREEy[set],1,1,THREEang[set],c_white,1)
            set+=1
        }
        
      draw_set_blend_mode(bm_subtract)
      draw_surface(WHITEsur,0,0)
      blend_normal()
       
        
surface_reset_target()
        

// draw the mask:
surface_set_target(SURmask);
draw_clear_alpha(c_black, 0);
with(BLACKobj)
draw_sprite_ext(sprite_index,-1,x,y,image_xscale,image_yscale,image_angle,c_white,image_alpha)
surface_reset_target();
// subtract the mask:
surface_set_target(SURfill);
draw_clear_alpha(c_black, 1);
draw_set_blend_mode(bm_subtract);
draw_surface(SURmask, 0, 0);
draw_set_blend_mode(bm_normal);
surface_reset_target();
// subtract the fill:
surface_set_target(SURout);
draw_set_blend_mode(bm_subtract);
draw_surface(SURfill, 0, 0);
draw_set_blend_mode(bm_normal);
surface_reset_target();

/*


Draw:
Code:

// draw whatever it is that we wanted:
surface_set_target(out);
draw_clear(c_blue);
surface_reset_target();







