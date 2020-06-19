/// camera_set_axis(right,up,left,down);

var _axis = 0;
if (argument_count == 0)
    return _axis;
if (argument_count == 4)
    {
    if (argument[0]) _axis += 1;
    if (argument[1]) _axis += 2;
    if (argument[2]) _axis += 4;
    if (argument[3]) _axis += 8;
    }
return _axis;
