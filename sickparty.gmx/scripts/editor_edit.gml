/// editor_edit();

/*

mode = last;

// view/display/gui setup
view_wview[0] = 800;
view_hview[0] = 480;
surface_resize(application_surface,view_wview[0],view_hview[0]);
gui_w = view_wview[0];
gui_h = view_hview[0];
display_set_gui_size(gui_w,gui_h);

view_xview[0] = edit_vx;
view_yview[0] = edit_vy;

// delete game objects
with(obj_control)
    instance_destroy();
with(obj_player)
    instance_destroy();
with(obj_camera)
    instance_destroy();
with(obj_shader)
    instance_destroy();
with(par_projectile)
    instance_destroy();
with(par_effect)
    instance_destroy();

// show colliders
var key = ds_map_find_first(collide_map);
while(key != undefined)
    {
    var inst = ds_map_find_value(collide_map,key);
    with(inst)
        visible = true;
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

// show systems
var key = ds_map_find_first(system_map);
while(key != undefined)
    {
    var inst = ds_map_find_value(system_map,key);
    with(inst)
        visible = true;
    var key = ds_map_find_next(system_map,key);
    }
