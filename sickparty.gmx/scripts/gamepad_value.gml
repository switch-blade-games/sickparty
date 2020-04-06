/// gamepad_value(slot,function);

var _slot = argument[0];
var _func = argument[1];

if (global.gpcount == 0) or (!global.gp[_slot,gpinfo.connected])
    return(0);

if (global.gp_input[_slot,_func])
    {
    if (_func >= global.gp_button_pos) and (_func <= global.gp_button_end)
        return(gamepad_button_value(_slot,gp_face1+_func));
    else if (_func >= global.gp_axis_pos) and (_func <= global.gp_axis_end)
        return(gamepad_axis_value(_slot,gp_face1+_func));
    }

return(0);
