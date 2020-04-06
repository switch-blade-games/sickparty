/// editor clear();

/*

global.levelname = "Untitled";

// clear colliders
var key = ds_map_find_first(collide_map);
while(key != undefined)
    {
    var inst = ds_map_find_value(collide_map,key);
    with(inst)
        instance_destroy();
    var key = ds_map_find_next(collide_map,key);
    }
ds_map_clear(collide_map);

// clear tiles
for(var i=0; i<layers; i++;)
    {
    tile_layer_delete(layer_depth[i]);
    layer_count[i] = 0;
    }

// clear systems
var key = ds_map_find_first(system_map);
while(key != undefined)
    {
    var inst = ds_map_find_value(system_map,key);
    with(inst)
        instance_destroy();
    var key = ds_map_find_next(system_map,key);
    }
ds_map_clear(system_map);

// clear entities
var key = ds_map_find_first(entity_map);
while(key != undefined)
    {
    var inst = ds_map_find_value(entity_map,key);
    with(inst)
        instance_destroy();
    var key = ds_map_find_next(entity_map,key);
    }
ds_map_clear(entity_map);
