/// anim_update();

if (!skin_ready)
    exit;

if (argument_count > 0)
    face = argument[0];
else
    face = dir;

// determine start/end frame of animation
anim_len = anim_info[anim_state,ANIM_LEN];
if (anim_info[anim_state,ANIM_AIM])
    anim_start = anim_info[anim_state,ANIM_POS0+anim_angle];
else
    anim_start = anim_info[anim_state,ANIM_POS0];
anim_end = anim_start + anim_len;

// detect if animation is from similar group or not
if (anim_group != anim_info[anim_state,ANIM_GROUP])
    {
    // start animation from beginning
    anim_group = anim_info[anim_state,ANIM_GROUP];
    img_index = anim_start;
    }
else
    {
    // continue new animation where previous animation left off
    var _remainder = clamp(img_index-anim_start_old,0,anim_len_old);
    img_index = anim_start+_remainder;
    }
