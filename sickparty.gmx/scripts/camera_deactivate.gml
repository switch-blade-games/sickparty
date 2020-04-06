/// camera_deactivate(margin);

var margin = argument[0];

// deactivate objects
instance_deactivate_object(par_solid);
instance_deactivate_object(par_jt);
instance_deactivate_object(par_mb);
instance_deactivate_object(par_enemy);

// reactivate region
instance_activate_region(view_xview[0]-margin,view_yview[0]-margin,view_wview[0]+(margin*2),view_hview[0]+(margin*2),true);
// always reactivate these objects
instance_activate_object(par_stay_active);
instance_activate_object(par_active_enemy);

/*
// clown world
if (room == clown_room)
or (room == cloud_room)
    {
    instance_activate_object(big_balloon);
    instance_activate_object(clown_hang);
    instance_activate_object(clown_man);
    instance_activate_object(clown_ball);
    }
if (room == clown_judge_mockup)
    {
    instance_activate_object(clown_judge_controller)
    instance_activate_object(muslim_spin)
    instance_activate_object(muslim_boat)
    }
*/
