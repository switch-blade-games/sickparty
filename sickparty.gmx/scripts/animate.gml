/// animate();

// capture old variables
skin_id_old = skin_id;
spr_index_old = spr_index;
img_index_old = img_index;

anim_group_old = anim_group;
anim_state_old = anim_state;
anim_start_old = anim_start;
anim_end_old = anim_end;
anim_len_old = anim_len;
anim_angle_old = anim_angle;

// determine appropriate animation state
switch(move_state)
    {
    case mState.walk:
        if (on_ground)
            {
            if (x != xpre)
                {
                if (input_fire)
                    {
                    if (anim_state != aState.walk_fire)
                        anim_state = aState.walk_fire;
                    }
                else
                    {
                    if (anim_state != aState.walk_move)
                        anim_state = aState.walk_move;
                    }
                if (img_index >= anim_start+0) and (img_index < anim_start+1)
                or (img_index >= anim_start+5) and (img_index < anim_start+6)
                    {
                    if (step_sfx)
                        {
                        step_sfx = false;
                        snd_play(choose(snd_step_stone_1,snd_step_stone_2,snd_step_stone_3),0.1,0.2);
                        }
                    }
                else
                    step_sfx = true;
                }
            else
                {
                if (input_fire)
                    {
                    if (anim_state != aState.flat_fire)
                        anim_state = aState.flat_fire;
                    }
                else
                    {
                    if (wait > 5*room_speed)
                        {
                        if (anim_state != aState.flat_wait)
                            anim_state = aState.flat_wait;
                        }
                    else
                        {
                        if (anim_state != aState.flat_idle)
                            anim_state = aState.flat_idle;
                        }
                    }
                }
            }
        else
            {
            if (anim_state != aState.roll)
                anim_state = aState.roll;
            }
        break;
    
    case mState.duck:
        if (input_fire)
            {
            if (anim_state != aState.flat_duck_fire)
                anim_state = aState.flat_duck_fire;
            }
        else
            {
            if (anim_state != aState.flat_duck_idle)
                anim_state = aState.flat_duck_idle;
            }
        break;
    
    case mState.mb:
        if (input_fire)
            {
            if (anim_state != aState.mb_fire)
                anim_state = aState.mb_fire;
            }
        else
            {
            if (mb_offset != mb_offset_old)
                {
                mb_offset_old = mb_offset;
                if (anim_state != aState.mb_move)
                    anim_state = aState.mb_move;
                
                if (img_index >= anim_start+0) and (img_index < anim_start+1)
                or (img_index >= anim_start+5) and (img_index < anim_start+6)
                    {
                    if (step_sfx)
                        {
                        step_sfx = false;
                        snd_play(choose(snd_step_metal_1,snd_step_metal_2,snd_step_metal_3),0.1,0.2);
                        }
                    }
                else
                    step_sfx = true;
                }
            else
                {
                if (anim_state != aState.mb_idle)
                    anim_state = aState.mb_idle;
                }
            }
        break;
    
    case mState.wc:
        if (wc_side == tile_side.bottom)
            {
            if (input_fire)
                {
                if (anim_state != aState.mb_fire)
                    anim_state = aState.mb_fire;
                }
            else
                {
                if (x != xpre)
                    {
                    if (anim_state != aState.mb_move)
                        anim_state = aState.mb_move;
                    }
                else
                    {
                    if (anim_state != aState.mb_idle)
                        anim_state = aState.mb_idle;
                    }
                }
            }
        else
            {
            if (input_fire)
                {
                if (anim_state != aState.wc_fire)
                    anim_state = aState.wc_fire;
                }
            else
                {
                if (y != ypre)
                    {
                    if (anim_state != aState.wc_move)
                        anim_state = aState.wc_move;
                    }
                else
                    {
                    if (anim_state != aState.wc_idle)
                        anim_state = aState.wc_idle;
                    }
                }
            }
        break;
    
    case mState.moto:
        if (on_vehicle)
            {
            if (input_fire)
                {
                if (anim_state != aState.moto_fire)
                    anim_state = aState.moto_fire;
                }
            else
                {
                if (anim_state != aState.moto_idle)
                    anim_state = aState.moto_idle;
                }
            }
        else
            {
            if (anim_state != aState.roll)
                anim_state = aState.roll
            }
        break;
    
    case mState.dead:
        if (on_ground)
            {
            if (anim_state != aState.dead)
                anim_state = aState.dead;
            }
        else
            {
            if (anim_state != aState.dead_roll)
                anim_state = aState.dead_roll;
            }
        break;
    }

// determine animation angle index
anim_angle_old = anim_angle;
switch(anim_state)
    {
    case aState.wc_fire:
        if (dir > 0)
            anim_angle = floor(aim/45);
        else
            anim_angle = (12-floor(aim/45)) mod 8;
        break;
    
    default:
        anim_angle = floor(aim/45);
        break;
    }

// update animation
switch(anim_state)
    {
    case aState.flat_wait:
        anim_update();
        img_index += img_speed[anim_state];
        //if (img_index >= anim_end)
            //wait = 0;
        break;
    
    case aState.flat_idle:
    case aState.flat_fire:
    case aState.walk_move:
    case aState.walk_fire:
        anim_update();
        img_index += img_speed[anim_state];
        gun_y = -18;
        break;
    
    case aState.flat_duck_idle:
        anim_update();
        img_index = anim_start;
        break;
    
    case aState.flat_duck_fire:
        anim_update();
        img_index += img_speed[anim_state];
        gun_y = -6;
        break;
    
    case aState.wc_idle:
    case aState.wc_move:
    case aState.wc_fire:
        anim_update();
        img_index += img_speed[anim_state];
        gun_y = -18;
        break;
    
    case aState.mb_idle:
    case aState.mb_move:
        anim_update();
        img_index += img_speed[anim_state];
        break;
    case aState.mb_fire:
        if (dir > 0)
            {
            if (anim_angle <= 2) or (anim_angle >= 6)
                anim_update(+dir);
            else
                anim_update(-dir);
            }
        else if (dir < 0)
            {
            if (anim_angle >= 2) and (anim_angle <= 6)
                anim_update(+dir);
            else
                anim_update(-dir);
            }
        img_index += img_speed[anim_state];
        gun_y = -18;
        break;
    
    case aState.moto_idle:
    case aState.moto_fire:
        anim_update(1);
        img_index += img_speed[anim_state];
        gun_y = -18;
        break;
    
    case aState.roll:
    case aState.dead_roll:
        anim_update();
        img_index += img_speed[anim_state];
        gun_y = -18;
        break;
    
    case aState.dead:
        anim_update();
        img_index += img_speed[anim_state];
        break;
    
    case aState.victory:
        anim_update();
        if (img_index >= anim_end)
            img_index = anim_end-0.1;
        break;
    }

if (img_index >= anim_end)
    img_index = anim_start;
else if (img_index < anim_start)
    img_index = anim_end-0.1;
