/// apply_force();

switch(move_state)
    {
    case mState.mb:
        if (!instance_exists(mb_id))
            {
            move_state = mState.walk;
            mb_id = noone;
            no_mb_time = 12;
            drop = true;
            break;
            }
        
        var x1 = mb_id.x+mb_id.x1;
        var y1 = mb_id.y+mb_id.y1;
        var x2 = mb_id.x+mb_id.x2;
        var y2 = mb_id.y+mb_id.y2;
        var ldx = lengthdir_x(mb_offset,mb_id.dir);
        var ldy = lengthdir_y(mb_offset,mb_id.dir);
        
        if (!place_meeting(round(x1+ldx),round(y1+ldy)+32,par_solid))
            {
            x = round(x1+ldx);
            y = round(y1+ldy)+32;
            mb_sign = ternary(x2>=x1,+1,-1);
            }
        else
            {
            mb_id = noone;
            no_mb_time = 12;
            }
        break;
    }
