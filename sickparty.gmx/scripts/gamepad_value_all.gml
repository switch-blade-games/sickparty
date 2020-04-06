/// gamepad_value_all(function);

var _func = argument[0];

if (global.gpcount == 0)
    return(0);

for(var i=0; i<global.gpmax; i++;)
    {
    if (!global.gp[i,gpinfo.connected])
        continue;
    
    if (global.gp_input[i,_func])
        {
        if (_func >= global.gp_button_pos) and (_func <= global.gp_button_end)
            return(gamepad_button_value(i,gp_face1+_func));
        else if (_func >= global.gp_axis_pos) and (_func <= global.gp_axis_end)
            return(gamepad_axis_value(i,gp_face1+_func));
        }
    }

return(0);
