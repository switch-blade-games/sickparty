var h_dir = input_right-input_left;
var v_dir = input_down-input_up;

switch(move_state)
    {
    case mState.walk:
        lock = (input_lock or (input_fire and !weapon_walk[cur_weapon])) and (on_ground);
        
        if (lock)
            {
            // aim
            if (h_dir != 0)
                dir = h_dir;
            if (h_dir == 0 and v_dir == 0)
                {
                if (dir > 0)
                    aim = 0;
                else if (dir < 0)
                    aim = 180;
                }
            else
                aim = point_direction(0,0,h_dir,v_dir);
            
            // friction
            if (xspeed > 0)
                xspeed = max(0,xspeed-fric);
            else if (xspeed < 0)
                xspeed = min(0,xspeed+fric);
            }
        else
            {
            // horizontal movement input
            if (h_dir != 0)
                {
                xspeed = walk_speed*h_dir;
                dir = h_dir;
                
                // transition from walking to wallclimb
                if (detect_wc) and (can_wc)
                and (((input_right) and (wc_side & tile_side.left  == tile_side.left))
                or   ((input_left)  and (wc_side & tile_side.right == tile_side.right)))
                    {
                    // ground transition from walking to wallclimb
                    if (on_ground and input_up)
                    or (!on_ground)
                        {
                        move_state = mState.wc;
                        if (!place_meeting(x,y+wc_speed*v_dir,par_solid))
                            yspeed = wc_speed*v_dir;
                        }
                    }
                
                // move left or right
                if (input_right)
                    {
                    // aim
                    if (input_up)
                        aim = 45;
                    else if (input_down)
                        aim = 315;
                    else
                        aim = 0;
                    }
                if (input_left)
                    {
                    // aim
                    if (input_up)
                        aim = 135;
                    else if (input_down)
                        aim = 225;
                    else
                        aim = 180;
                    }
                }
            else
                {
                // aim
                if (input_up)
                    aim = 90;
                else if (input_down)
                    {
                    if (!on_ground)
                        aim = 270;
                    }
                else if (dir > 0)
                    aim = 0;
                else if (dir < 0)
                    aim = 180;
                
                // friction
                if (xspeed > 0)
                    xspeed = max(0,xspeed-fric);
                else if (xspeed < 0)
                    xspeed = min(0,xspeed+fric);
                }
            
            // duck
            if (input_down) and (on_ground)
                {
                if (h_dir == 0)
                    {
                    // stop walking and duck
                    move_state = mState.duck;
                    mask_index = msk_player_duck;
                    }
                }
            
            // climb wall above the player
            if (detect_wc) and (can_wc)
            and ((input_up) and (wc_side & tile_side.bottom == tile_side.bottom))
                {
                if (!on_ground) and (!input_down)
                    {
                    move_state = mState.wc;
                    yspeed = 0;
                    xspeed = 0;
                    // start moving to use correct animation
                    if ((input_left) xor (input_right))
                    and (!place_meeting(x+wc_speed*h_dir,y,par_solid))
                        xspeed = wc_speed*h_dir;
                    }
                }
            }
        
        // jump
        if ((on_ground) or (grace_jump > 0)) and (input_jump_pressed)
        and (move_state != mState.duck)
            jump();
        
        // fire weapon
        fire_weapon();
        break;
    
    case mState.duck:
        lock = (input_lock) and (on_ground);
        
        if (lock)
            {
            move_state = mState.walk;
            mask_index = msk_player;
            break;
            }
        
        if (dir > 0)
            aim = 0;
        else if (dir < 0)
            aim = 180;
        
        if (h_dir != 0)
            {
            // stop crouching, start moving
            move_state = mState.walk;
            mask_index = msk_player;
            break;
            }
        
        // friction
        if (xspeed > 0)
            xspeed = max(0,xspeed-fric);
        else if (xspeed < 0)
            xspeed = min(0,xspeed+fric);
        
        if (input_down)
            {
            // drop through platforms
            if (input_jump_pressed)
                {
                if (on_ground)
                and (place_meeting(x,y+1,par_jt))
                and (!place_meeting(x,y+1,par_solid))
                    {
                    // stop crouching, drop through
                    move_state = mState.walk;
                    on_ground = false;
                    grace_jump = 0;
                    drop = true;
                    
                    mask_index = msk_player;
                    y += 1;
                    }
                }
            }
        else
            {
            // stop crouching
            if (!place_meeting(x,y-8,par_solid))
                {
                move_state = mState.walk;
                mask_index = msk_player;
                }
            }
            
        // stop crouching, jump
        if (on_ground) and (input_jump_pressed)
            {
            move_state = mState.walk;
            mask_index = msk_player;
            jump();
            }
        
        // shoot
        fire_weapon();
        break;
    
    case mState.mb:
        if (h_dir != 0)
            dir = h_dir;
        if (input_fire) or (input_lock)
            {
            fire_weapon();
            
            // aim
            if (h_dir == 0 and v_dir == 0)
                {
                if (dir > 0)
                    aim = 0;
                else if (dir < 0)
                    aim = 180;
                }
            else
                aim = point_direction(0,0,h_dir,v_dir);
            }
        else
            {
            // horizontal movement input
            if (h_dir != 0)
                {
                mb_offset += mb_speed*mb_sign*h_dir;
                
                // move left or right
                if (input_right)
                    aim = 0;
                if (input_left)
                    aim = 180;
                }
            }
        
        // let go of monkeybar
        if (input_jump_pressed) and (!input_lock)
            {
            var _no_jump = mb_id.no_jump;
            
            move_state = mState.walk;
            mb_id = noone;
            no_mb_time = 12;
            drop = true;
            // jump up if unobstructed, otherwise just fall
            if (!input_down) and (!_no_jump) and (!place_meeting(x,y-10,par_solid))
                {
                drop = false;
                jump();
                }
            }
        break;
    
    case mState.wc:
        if (detect_wc)
            {
            var wc_l = (wc_side & tile_side.left == tile_side.left);
            var wc_r = (wc_side & tile_side.right == tile_side.right);
            var wc_b = (wc_side & tile_side.bottom == tile_side.bottom);
            
            // hanging from ceiling takes priority
            if (((!wc_l) and input_right) or ((!wc_r) and input_left))
            and (wc_b and (!input_fire))
                wc_side = tile_side.bottom;
            
            // face away from wall you are climbing on
            if (wc_r)
                dir = -1;
            else if (wc_l)
                dir = +1;
            else if (wc_b) // ONLY CLIMB BOTTOM?
                {
                // face in direction of movement
                if (h_dir != 0)
                    dir = h_dir;
                }
            
            if (input_lock) or (input_fire)
                {
                // friction
                if (xspeed > 0)
                    xspeed = max(0,xspeed-fric);
                else if (xspeed < 0)
                    xspeed = min(0,xspeed+fric);
                if (yspeed > 0)
                    yspeed = max(0,yspeed-fric);
                else if (yspeed < 0)
                    yspeed = min(0,yspeed+fric);
                
                // aim
                if (wc_r)
                    {
                    dir = -1;
                    if (h_dir == 0 and v_dir == 0)
                        aim = 0;
                    else
                        aim = point_direction(0,0,h_dir,v_dir);
                    }
                else if (wc_l)
                    {
                    dir = 1;
                    if (h_dir == 0 and v_dir == 0)
                        aim = 180;
                    else
                        aim = point_direction(0,0,h_dir,v_dir);
                    }
                else if (wc_b)
                    {
                    aim = point_direction(0,0,dir,0);
                    if (h_dir != 0) or (input_down)
                        aim = point_direction(0,0,input_right-input_left,input_down);
                    }
                
                fire_weapon();
                }
            else
                {
                // move and aim
                if (wc_l) or (wc_r)
                    {
                    xspeed = 0;
                    
                    // aim
                    if (wc_l)
                        aim = 180;
                    else if (wc_r)
                        aim = 0;
                    
                    // vertical movement
                    if (v_dir == 0)
                        {
                        // friction
                        if (yspeed > 0)
                            yspeed = max(0,yspeed-fric);
                        else if (yspeed < 0)
                            yspeed = min(0,yspeed+fric);
                        }
                    else
                        {
                        yspeed = wc_speed*v_dir;
                        
                        // transition from wall climb to monkey bar
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
                            
                            // don't move up into a monkey bar
                            if ((off < 0) or (off > len)) or (y <= yto+33)
                                yspeed = max(0,yspeed);
                            
                            // transition from wallclimb to monkeybar
                            if ((input_right and wc_r) or (input_left and wc_l)) and (input_up)
                            and (can_mb) and (abs(y-(yto+32)) <= wc_speed)
                            and (!place_meeting(x,yto+32,par_solid))
                                {
                                move_state = mState.mb;
                                y = yto+32;
                                mb_id = temp_mb;
                                mb_offset = off;
                                mb_sign = ternary(x1<x2,+1,-1);
                                xspeed = 0;
                                yspeed = 0;
                                }
                            }
                        }
                    
                    // jump/fall off
                    if (input_jump_pressed)
                    or (on_ground and (input_down or (wc_r and input_right) or (wc_l and input_left)))
                        {
                        move_state = mState.walk;
                        no_wc_time = 12;
                        aim = point_direction(0,0,dir,0);
                        drop = true;
                        }
                    }
                else if (wc_b)
                    {
                    yspeed = 0;
                    
                    // horizontal movement
                    if (h_dir == 0)
                        {
                        // friction
                        if (xspeed > 0)
                            xspeed = max(0,xspeed-fric);
                        else if (xspeed < 0)
                            xspeed = min(0,xspeed+fric);
                        }
                    else
                        {
                        xspeed = mb_speed*h_dir;
                        if (dir > 0)
                            aim = 0;
                        else if (dir < 0)
                            aim = 180;
                        }
                    
                    // fall off
                    if (input_jump_pressed and !input_up)
                    or (input_down and on_ground)
                        {
                        move_state = mState.walk;
                        no_wc_time = 12;
                        aim = point_direction(0,0,dir,0);
                        drop = true;
                        }
                    }
                }
            }
        else
            {
            // transition from wallclimb to walk
            move_state = mState.walk;
            no_wc_time = 12;
            drop = true;
            }
        break;
    
    case mState.moto:
        lock = (input_lock) and (on_vehicle);
        if (lock)
            {
            // aim
            if (h_dir != 0)
                dir = h_dir;
            if (h_dir == 0 and v_dir == 0)
                {
                if (dir > 0)
                    aim = 0;
                else if (dir < 0)
                    aim = 180;
                }
            else
                aim = point_direction(0,0,h_dir,v_dir);
            
            // friction
            if (xspeed > 0)
                xspeed = max(0,xspeed-fric);
            else if (xspeed < 0)
                xspeed = min(0,xspeed+fric);
            }
        else
            {
            // horizontal movement input
            if (h_dir != 0)
                {
                xspeed = moto_speed*h_dir;
                dir = h_dir;
                
                // move left or right
                if (input_right)
                    {
                    // aim
                    if (input_up)
                        aim = 45;
                    else if (input_down)
                        aim = 315;
                    else
                        aim = 0;
                    }
                if (input_left)
                    {
                    // aim
                    if (input_up)
                        aim = 135;
                    else if (input_down)
                        aim = 225;
                    else
                        aim = 180;
                    }
                }
            else
                {
                dir = 1;
                
                // aim
                if (input_up)
                    aim = 90;
                else if (input_down)
                    {
                    if (!on_ground)
                        aim = 270;
                    }
                else
                    aim = 0;
                
                // friction
                if (xspeed > 0)
                    xspeed = max(0,xspeed-fric);
                else if (xspeed < 0)
                    xspeed = min(0,xspeed+fric);
                }
            }
        
        // jump
        if (on_vehicle) and (input_jump_pressed) and (!input_down)
            {
            jump();
            on_vehicle = false;
            }
        
        // fire weapon
        fire_weapon();
        break;
    
    case mState.dead:
        if (on_ground)
            {
            // friction
            if (xspeed > 0)
                xspeed = max(0,xspeed-fric);
            else if (xspeed < 0)
                xspeed = min(0,xspeed+fric);
            }
        break;
    }

// swap weapons
if (input_swap_pressed)
    {
    cur_weapon++;
    if (cur_weapon >= weapons)
        cur_weapon = 0;
    }
