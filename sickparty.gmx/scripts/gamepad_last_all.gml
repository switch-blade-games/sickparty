/// gamepad_last_all();

if (global.gpcount == 0)
    return(-1);

for(var i=0; i<global.gpmax; i++;)
    {
    if (!global.gp[i,gpinfo.connected])
    or (global.gp[i,gpinfo.last] == -1)
        continue;
    
    return(global.gp[i,gpinfo.last]);
    }

return(-1);
