/// gamepad_last(slot);

var _slot = argument[0];

if (global.gpcount == 0) or (!global.gp[_slot,gpinfo.connected])
    return(-1);

return(global.gp[_slot,gpinfo.last]);
