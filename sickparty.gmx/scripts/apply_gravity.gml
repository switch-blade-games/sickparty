switch(move_state)
    {
    case mState.walk:
    case mState.duck:
    
        // detect if we're standing on ground
        on_ground = false;
        if (detect_ground)
            {
            on_ground = true;
            grace_jump = 8;
            drop = false;
            
            // sfx
            if (land_sfx)
                {
                land_sfx = false;
                snd_play(choose(snd_land_stone_1,snd_land_stone_2,snd_land_stone_3),0.1,0.2);
                }
            }
        
        // gravity
        if (on_ground)
            on_ramp = detect_ramp;
        else
            {
            if (detect_vehicle) and (vehicle_id == noone) and (y >= detect_vehicle_id.y-12) and (yspeed >= 0)
                {
                vehicle_id = detect_vehicle_id;
                detect_vehicle_id.rider = id;
                
                move_state = mState.moto;
                on_vehicle = true;
                
                y = detect_vehicle_id.y-12;
                xspeed = 0;
                yspeed = 0;
                }
            
            // start hanging
            if (detect_mb) and (mb_id == noone)
                {
                var temp_mb = detect_mb_id;
                
                var x1 = temp_mb.x+temp_mb.x1;
                var x2 = temp_mb.x+temp_mb.x2;
                var y1 = temp_mb.y+temp_mb.y1;
                var y2 = temp_mb.y+temp_mb.y2;
                var len = temp_mb.len;
                var amt = (x-min(x1,x2))/max(1,abs(x2-x1));
                var yto = round(lerp(ternary(x1<x2,y1,y2),ternary(x1<x2,y2,y1),amt));
                var off = round(ternary(x1<x2,amt*len,len-(amt*len)));
                
                // make sure we can smoothly transition to monkeybar
                if (off >= 0) and (off <= len) and (abs(y-(yto+32)) <= yspeed)
                and (yspeed > 0) and (can_mb) and (!place_meeting(x,yto+32,par_solid))
                    {
                    move_state = mState.mb;
                    y = yto+32;
                    mb_id = temp_mb;
                    mb_offset = off;
                    mb_sign = ternary(x1<x2,+1,-1);
                    xspeed = 0;
                    yspeed = 0;
                    
                    // sfx
                    snd_play(choose(snd_land_metal_1,snd_land_metal_2,snd_land_metal_3),0.1,0.2);
                    }
                }
            if (yspeed < fall_speed)
                yspeed += grav;
            
            // sfx
            land_sfx = true;
            }
        break;
    
    case mState.mb:
        var fall = false;
        if (!instance_exists(mb_id))
            fall = true;
        else if (mb_offset < 0) or (mb_offset > mb_id.len)
            {
            fall = true;
            
            // move to position
            var x1 = mb_id.x+mb_id.x1;
            var x2 = mb_id.x+mb_id.x2;
            var y1 = mb_id.y+mb_id.y1;
            var y2 = mb_id.y+mb_id.y2;
            var ldx = lengthdir_x(mb_offset,mb_id.dir);
            var ldy = lengthdir_y(mb_offset,mb_id.dir);
            if (!place_meeting(round(x1+ldx),round(y1+ldy)+32,par_solid))
                {
                x = round(x1+ldx);
                y = round(y1+ldy)+32;
                mb_sign = ternary(x2>=x1,+1,-1);
                }
            
            // manually detect a possible monkey bar
            var temp_mb = collision_line(x,y-28,x,y-40,par_mb,true,true);
            if (temp_mb != noone)
                {
                var x1 = temp_mb.x+temp_mb.x1;
                var x2 = temp_mb.x+temp_mb.x2;
                var y1 = temp_mb.y+temp_mb.y1;
                var y2 = temp_mb.y+temp_mb.y2;
                var len = temp_mb.len;
                var amt = (x-min(x1,x2))/max(1,abs(x2-x1));
                var yto = round(lerp(ternary(x1<x2,y1,y2),ternary(x1<x2,y2,y1),amt));
                var off = round(ternary(x1<x2,amt*len,len-(amt*len)));
                
                // make sure we can smoothly continue hanging from a monkeybar
                if (off >= 0) and (off <= len) and (abs(y-(yto+32)) <= 10)
                and (can_mb) and (!place_meeting(x,yto+32,par_solid))
                    {
                    move_state = mState.mb;
                    y = yto+32;
                    mb_id = temp_mb;
                    mb_offset = off;
                    mb_sign = ternary(x1<x2,+1,-1);
                    xspeed = 0;
                    yspeed = 0;
                    fall = false;
                    }
                }
            }
        
        if (fall)
            {
            mb_id = noone;
            no_mb_time = 12;
            
            // wall climb
            if (detect_wc) and (can_wc)
            and (((input_right) and (wc_side & tile_side.left  == tile_side.left))
            or   ((input_left)  and (wc_side & tile_side.right == tile_side.right)))
                move_state = mState.wc;
            else
                {
                move_state = mState.walk;
                drop = true;
                }
            }
        
        yspeed = 0;
        grace_jump = 0;
        on_ground = false;
        break;
    
    case mState.wc:
        on_ground = false;
        // detect if we are on the ground for potential
        // wallclimb to walking transition
        if (place_meeting(x,y+1,par_solid))
        or (!place_meeting(x,y,par_jt) and place_meeting(x,y+1,par_jt) and yspeed >= 0)
        or (position_meeting(x,bbox_bottom+1,par_ramp))
            on_ground = true;
        break;
    
    case mState.moto:
        if (!instance_exists(vehicle_id))
            {
            move_state = mState.walk;
            on_ground = false;
            break;
            }
        
        // player gravity
        on_vehicle = false;
        if (y >= vehicle_id.y-12) and (yspeed >= 0)
            {
            on_vehicle = true;
            y = vehicle_id.y-12;
            yspeed = 0;
            }
        else
            {
            // start hanging
            if (detect_mb) and (mb_id == noone)
                {
                var temp_mb = detect_mb_id;
                
                var x1 = temp_mb.x+temp_mb.x1;
                var x2 = temp_mb.x+temp_mb.x2;
                var y1 = temp_mb.y+temp_mb.y1;
                var y2 = temp_mb.y+temp_mb.y2;
                var len = temp_mb.len;
                var amt = (x-min(x1,x2))/max(1,abs(x2-x1));
                var yto = round(lerp(ternary(x1<x2,y1,y2),ternary(x1<x2,y2,y1),amt));
                var off = round(ternary(x1<x2,amt*len,len-(amt*len)));
                
                // make sure we can smoothly transition to monkeybar
                if (off >= 0) and (off <= len) and (abs(y-(yto+32)) <= yspeed)
                and (yspeed > 0) and (can_mb) and (!place_meeting(x,yto+32,par_solid))
                    {
                    move_state = mState.mb;
                    y = yto+32;
                    mb_id = temp_mb;
                    mb_offset = off;
                    mb_sign = ternary(x1<x2,+1,-1);
                    xspeed = 0;
                    yspeed = 0;
                    
                    vehicle_id.rider = noone;
                    vehicle_id = noone;
                    on_vehicle = false;
                    
                    // sfx
                    snd_play(choose(snd_land_metal_1,snd_land_metal_2,snd_land_metal_3),0.1,0.2);
                    }
                }
            if (yspeed < fall_speed)
                yspeed += grav;
            }
        break;
    
    case mState.dead:
        // detect if we're standing on ground
        on_ground = false;
        if (detect_ground)
            on_ground = true;
        
        // gravity
        if (!on_ground) and (yspeed < fall_speed)
            yspeed += grav;
        break;
    }

if (grace_jump > 0)
    grace_jump--;
