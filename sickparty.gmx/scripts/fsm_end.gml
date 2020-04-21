/// fsm_end();

if (mb_id != mb_id_last)
    {
    if (mb_id_last != noone)
        mb_id_last.actor_id = noone;
    if (mb_id != noone)
        {
        mb_id.actor_id = id;
        
        if (mb_land_sfx)
            {
            mb_land_sfx = false;
            snd_play(choose(snd_land_metal_1,snd_land_metal_2,snd_land_metal_3),0.1,0.2);
            }
        }
    }

if (vehicle_id != vehicle_id_last)
    {
    if (vehicle_id_last != noone)
        vehicle_id_last.rider_id = noone;
    if (vehicle_id != noone)
        {
        vehicle_id.rider_id = id;
        
        if (vehicle_land_sfx)
            {
            vehicle_land_sfx = false;
            // snd_play(choose(snd_land_metal_1,snd_land_metal_2,snd_land_metal_3),0.1,0.2);
            }
        }
    }
