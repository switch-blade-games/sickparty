/// editor_play();

/*

last = mode;
mode = -1;

edit_vx = view_xview[0];
edit_vy = view_yview[0];

// hide colliders
var key = ds_map_find_first(collide_map);
while(key != undefined)
    {
    var inst = ds_map_find_value(collide_map,key);
    with(inst)
        visible = false;
    var key = ds_map_find_next(collide_map,key);
    }

// show tiles
for(var i=0; i<layers; i++;)
    {
    var tilelist = tile_get_ids_at_depth(layer_depth[i]);
    var tiles = array_length_1d(tilelist);
    
    for(var j=0; j<tiles; j++;)
        {
        var tile = tilelist[j];
        if (tile_exists(tile))
            tile_set_alpha(tile,1);
        }
    }

// hide systems
var key = ds_map_find_first(system_map);
while(key != undefined)
    {
    var inst = ds_map_find_value(system_map,key);
    with(inst)
        visible = false;
    var key = ds_map_find_next(system_map,key);
    }

// show entities
var key = ds_map_find_first(entity_map);
while(key != undefined)
    {
    var inst = ds_map_find_value(entity_map,key);
    with(inst)
        image_alpha = 1.0;
    var key = ds_map_find_next(entity_map,key);
    }

// reset camera paths
with(obj_camera_path)
    active = true;

// spawn player and controller
with(obj_player_spawn)
    {
    instance_create(0,0,obj_control);
    instance_create(x,y,obj_player);
    }
