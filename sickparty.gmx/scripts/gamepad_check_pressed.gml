/// gamepad_check_pressed(slot,function);

var _slot = argument[0];
var _func = argument[1];

if (global.gpcount == 0) or (!global.gp[_slot,gpinfo.connected])
    return(false);

return(global.gp_input[_slot,_func] and !global.gp_ilast[_slot,_func]);
