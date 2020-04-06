/// detect();

// detect ground
detect_ground = false;
if (place_meeting(x,y+1,par_solid))
or ((position_meeting(bbox_left,bbox_bottom+1,par_jt) or position_meeting(bbox_right,bbox_bottom+1,par_jt))
and (!position_meeting(bbox_left,bbox_bottom,par_jt) and !position_meeting(bbox_right,bbox_bottom,par_jt)) and yspeed >= 0)
    detect_ground = true;

// detect ramp
detect_ramp = false;
detect_ramp_id = noone;
if (detect_ground)
    {
    detect_ramp_id = instance_place(x,y+1,par_ramp);
    if (detect_ramp_id != noone)
        {
        detect_ramp = true;
        ramp_slope = detect_ramp_id.slope;
        }
    }

// detect monkey bar
detect_mb = false;
detect_mb_id = noone;
if (move_state == mState.mb)
or (move_state == mState.wc)
    {
    detect_mb_id = instance_position(x,y-32,par_mb);
    if (detect_mb_id != noone)
        detect_mb = true;
    }
else
    {
    detect_mb_id = collision_line(x,y-28,x,y-40,par_mb,true,true);
    if (detect_mb_id != noone)
        detect_mb = true;
    }
if (no_mb_time > 0)
    no_mb_time--;
can_mb = (!no_mb) and (no_mb_time == 0);

// detect climbable walls
detect_wc = false;
wc_side = tile_side.none;
var temp_id = instance_place(x+1,y,par_climb);
if (temp_id != noone) and (temp_id.sides & tile_side.left == tile_side.left)
    {
    detect_wc = true;
    wc_side += tile_side.left;
    }
var temp_id = instance_place(x-1,y,par_climb);
if (temp_id != noone) and (temp_id.sides & tile_side.right == tile_side.right)
    {
    detect_wc = true;
    wc_side += tile_side.right;
    }
var temp_id = instance_place(x,y-1,par_climb);
if (temp_id != noone) and (temp_id.sides & tile_side.bottom == tile_side.bottom)
    {
    detect_wc = true;
    wc_side += tile_side.bottom;
    }
if (no_wc_time > 0)
    no_wc_time--;
can_wc = (!no_wc) and (no_wc_time == 0);

// detect motorcycle
detect_vehicle = false;
detect_vehicle_id = noone;
detect_vehicle_id = instance_place(x,y+1,par_vehicle);
if (detect_vehicle_id != noone) and (detect_vehicle_id.rider == noone)
    detect_vehicle = true;
