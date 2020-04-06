/// offsets_load(path);

/*

var file = argument[0];
if (file_exists(file))
    {
    //show_debug_message("LOADING OFFSETS...");
    var _o = 0;
    
    // load
    var buff = buffer_load(file);
    buffer_seek(buff,buffer_seek_start,0);
    
    v = buffer_read(buff,buffer_u8);
    if (v != global.sof_version)
        {
        buffer_delete(buff);
        return(false);
        }
    
    // clear
    for(var i=0; i<skin_spr.size; i++;)
        {
        obj_player.sprite_offset_states[i] = 0;
        obj_player.sprite_offset_state[i,0] = -1;
        obj_player.sprite_offset_x[i,0] = 0;
        obj_player.sprite_offset_y[i,0] = 0;
        }
    
    for(var i=0; i<skin_spr.size; i++;)
        {
        var num = buffer_read(buff,buffer_u16);
        for(var j=0; j<num; j++;)
            {
            var state = buffer_read(buff,buffer_u8);
            var offx  = buffer_read(buff,buffer_s8);
            var offy  = buffer_read(buff,buffer_s8);
            
            if (state < aState.size)
                {
                obj_player.sprite_offset_state[i,j] = state;
                obj_player.sprite_offset_x[i,j] = offx;
                obj_player.sprite_offset_y[i,j] = offy;
                obj_player.sprite_offset_states[i]++;
                }
            
            _o++;
            }
        }
    
    //show_debug_message("LOADED "+string(_o)+" OFFSETS!");
    
    buffer_delete(buff);
    }

return(true);

*/
