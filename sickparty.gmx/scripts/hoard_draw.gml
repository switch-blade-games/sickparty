if !surface_exists(argument0)
    {
    argument0 = surface_create(400, 240);
    //ds_list_insert(global.SURlist,0,argument0)
    }
 else
    {
       draw_surface(argument0,0,0);
    }