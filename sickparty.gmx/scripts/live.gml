if (move_state == mState.dead)
    {
    // stay dead and do nothing for a bit
    if (death_timer > 0)
        death_timer--;
    else
        {
        // gameover?
        if (global.P1LIVES <= 0)
            {
            room_goto(game_over_room);
            exit;
            }
        
        // respawn
        life = lifemax;
        respawn_timer = respawn_time;
        block_projectiles = true;
        death_time = get_timer();
        
        xspeed = 0;
        yspeed = 0;
        no_mb = false;
        mb_id = noone;
        
        // normal vs. moto respawn
        if (instance_exists(motor_controller))
        or (instance_exists(sub_controller))
            {
            move_state = mState.moto;
            drop = false;
            }
        else
            {
            move_state = mState.walk;
            drop = true;
            }
        
        // respawn coordinates
        if (point_in_rectangle(xstart,ystart,view_xview[0],view_yview[0],view_xview[0]+view_wview[0],view_yview[0]+view_hview[0]))
            {
            x = xstart;
            y = ystart;
            }
        else
            {
            x = view_xview[0]+64;
            y = view_yview[0];
            }
        while(place_meeting(x,y,par_solid))
            y++;
        }
    }
else
    {
    if (move_state == mState.moto)
        {
        mShake += (0-mShake)*0.125;
        if (mShake_timer > 0)
            mShake_timer--;
        else if (abs(mShake) < 1)
            {
            mShake_timer = 70+irandom(70);
            mShake = choose(2,2,3);
            }
        }
    else
        {
        mShake = 0;
        mShake_timer = 140;
        }
    
    if (life > 0)
        {
        if (respawn_timer > 0)
            {
            // respawn flash
            respawn_timer--;
            if (respawn_timer mod flash_rate == 0)
                respawn_flash = !respawn_flash;
            // invincibility
            take_damage = false;
            }
        else if (!take_damage)
            {
            // end invincibility/respawn flash
            take_damage = true;
            respawn_flash = false;
            }
        }
    else
        {
        // die
        global.P1LIVES--;
        death_timer = death_time;
        
        // stop blocking projectiles
        block_projectiles = false;
        take_damage = false;
        respawn_flash = false;
        
        // dead state and knockback
        move_state = mState.dead;
        on_ground = false;
        xspeed = choose(-2,2);
        yspeed = -8;
        
        // screen flash
        if (instance_exists(obj_shader))
            obj_shader.flash = 3;
        }
    }
