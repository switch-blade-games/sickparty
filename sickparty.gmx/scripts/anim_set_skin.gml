/// anim_set_skin(skin_id);

skin_id = argument[0];
skin_ready = true;
spr_index = -1;
frame_info = -1;
anim_info = -1;
frames = 0;

// copy handle to sheet sprite
if (sprite_exists(global.player_sprite[skin_id]))
    spr_index = global.player_sprite[skin_id];
else
    {
    skin_ready = false;
    return(false);
    }
// copy global frame info from grid to local array
if (ds_exists(global.frame_info[skin_id],ds_type_grid))
    {
    frames = global.frames[skin_id];
    for(var i=0; i<ds_grid_width(global.frame_info[skin_id]); i++;)
        {
        for(var j=0; j<ds_grid_height(global.frame_info[skin_id]); j++;)
            frame_info[i,j] = ds_grid_get(global.frame_info[skin_id],i,j);
        }
    }
else
    {
    skin_ready = false;
    return(false);
    }
// copy global anim info from grid to local array
if (ds_exists(global.anim_info[skin_id],ds_type_grid))
    {
    for(var i=0; i<ds_grid_width(global.anim_info[skin_id]); i++;)
        {
        for(var j=0; j<ds_grid_height(global.anim_info[skin_id]); j++;)
            anim_info[i,j] = ds_grid_get(global.anim_info[skin_id],i,j);
        }
    }
else
    {
    skin_ready = false;
    return(false);
    }

// define animation state speeds
img_speed = -1;
switch(skin_id)
    {
    case skin.stone:
        off_x = 0;
        off_y = 36;
        img_speed[aState.flat_idle] = 0.2;
        img_speed[aState.flat_wait] = 0.2;
        img_speed[aState.flat_fire] = 0.2;
        img_speed[aState.walk_move] = 0.22;
        img_speed[aState.walk_fire] = 0.22;
        img_speed[aState.flat_duck_idle] = 0.2;
        img_speed[aState.flat_duck_fire] = 0.2;
        img_speed[aState.wc_idle] = 0.2;
        img_speed[aState.wc_move] = 0.2;
        img_speed[aState.wc_fire] = 0.2;
        img_speed[aState.mb_idle] = 0.2;
        img_speed[aState.mb_move] = 0.2;
        img_speed[aState.mb_fire] = 0.2;
        img_speed[aState.moto_idle] = 0.2;
        img_speed[aState.moto_fire] = 0.2;
        img_speed[aState.roll] = 0.5;
        img_speed[aState.dead_roll] = 0.3;
        img_speed[aState.dead] = 0;
        img_speed[aState.victory] = 0.2;
        break;
    case skin.foxford:
        off_x = 0;
        off_y = 36;
        img_speed[aState.flat_idle] = 0.2;
        img_speed[aState.flat_wait] = 0.2;
        img_speed[aState.flat_fire] = 0.2;
        img_speed[aState.walk_move] = 0.22;
        img_speed[aState.walk_fire] = 0.22;
        img_speed[aState.flat_duck_idle] = 0.2;
        img_speed[aState.flat_duck_fire] = 0.2;
        img_speed[aState.wc_idle] = 0.2;
        img_speed[aState.wc_move] = 0.2;
        img_speed[aState.wc_fire] = 0.2;
        img_speed[aState.mb_idle] = 0.2;
        img_speed[aState.mb_move] = 0.2;
        img_speed[aState.mb_fire] = 0.2;
        img_speed[aState.moto_idle] = 0.2;
        img_speed[aState.moto_fire] = 0.2;
        img_speed[aState.roll] = 0.5;
        img_speed[aState.dead_roll] = 0.3;
        img_speed[aState.dead] = 0.2;
        img_speed[aState.victory] = 0.2;
        break;
    case skin.yolo:
        off_x = 0;
        off_y = 20;
        img_speed[aState.flat_idle] = 0.2;
        img_speed[aState.flat_wait] = 0.2;
        img_speed[aState.flat_fire] = 0.2;
        img_speed[aState.walk_move] = 0.22;
        img_speed[aState.walk_fire] = 0.22;
        img_speed[aState.flat_duck_idle] = 0.2;
        img_speed[aState.flat_duck_fire] = 0.2;
        img_speed[aState.wc_idle] = 0.2;
        img_speed[aState.wc_move] = 0.2;
        img_speed[aState.wc_fire] = 0.2;
        img_speed[aState.mb_idle] = 0.2;
        img_speed[aState.mb_move] = 0.2;
        img_speed[aState.mb_fire] = 0.2;
        img_speed[aState.moto_idle] = 0.2;
        img_speed[aState.moto_fire] = 0.2;
        img_speed[aState.roll] = 0.5;
        img_speed[aState.dead_roll] = 0.3;
        img_speed[aState.dead] = 0.2;
        img_speed[aState.victory] = 0.2;
        break;
    case skin.pumpkin:
        off_x = 0;
        off_y = 36;
        img_speed[aState.flat_idle] = 0.2;
        img_speed[aState.flat_wait] = 0.2;
        img_speed[aState.flat_fire] = 0.2;
        img_speed[aState.walk_move] = 0.22;
        img_speed[aState.walk_fire] = 0.22;
        img_speed[aState.flat_duck_idle] = 0.2;
        img_speed[aState.flat_duck_fire] = 0.2;
        img_speed[aState.wc_idle] = 0.2;
        img_speed[aState.wc_move] = 0.2;
        img_speed[aState.wc_fire] = 0.2;
        img_speed[aState.mb_idle] = 0.2;
        img_speed[aState.mb_move] = 0.2;
        img_speed[aState.mb_fire] = 0.2;
        img_speed[aState.moto_idle] = 0.2;
        img_speed[aState.moto_fire] = 0.2;
        img_speed[aState.roll] = 0.5;
        img_speed[aState.dead_roll] = 0.3;
        img_speed[aState.dead] = 0.2;
        img_speed[aState.victory] = 0.2;
        break;
    }

skin_ready = true;
return(true);
