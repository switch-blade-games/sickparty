/// gamepad_check_pressed_all(function);

var _func = argument[0];

if (global.gpcount == 0)
    return(false);

for(var i=0; i<global.gpmax; i++;)
    {
    if (!global.gp[i,gpinfo.connected])
        continue;
    
    if (global.gp_input[i,_func] and !global.gp_ilast[i,_func])
        return(true);
    }

return(false);
