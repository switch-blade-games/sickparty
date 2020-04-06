/// offsets_save(path);

/*

var file = argument[0];
if (file != "")
    {
    //show_debug_message("SAVING OFFSETS...");
    var _o = 0;
    
    // save
    var buff = buffer_create(1024,buffer_grow,1);
    buffer_seek(buff,buffer_seek_start,0);
    
    buffer_write(buff,buffer_u8,global.sof_version);
    
    for(var i=0; i<skin_spr.size; i++;)
        {
        buffer_write(buff,buffer_u16,obj_player.sprite_offset_states[i]);
        for(var j=0; j<obj_player.sprite_offset_states[i]; j++;)
            {
            buffer_write(buff,buffer_u8,obj_player.sprite_offset_state[i,j]);
            buffer_write(buff,buffer_s8,obj_player.sprite_offset_x[i,j]);
            buffer_write(buff,buffer_s8,obj_player.sprite_offset_y[i,j]);
            _o++;
            }
        }
    
    //show_debug_message("SAVED "+string(_o)+" OFFSETS!");
    
    var bytes = buffer_tell(buff);
    buffer_save_ext(buff,file,0,bytes);
    buffer_delete(buff);
    }

*/
