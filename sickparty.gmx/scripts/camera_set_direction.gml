/// camera_set_direction(direction);

var _axis = 0;
if (argument_count == 0)
    return _axis;
if (argument_count == 1)
    {
    var _d = argument[0];
    var _h = sign(lengthdir_x(1,_d));
    var _v = sign(lengthdir_y(1,_d));
    if (_h > 0) _axis += 1;
    if (_v < 0) _axis += 2;
    if (_h < 0) _axis += 4;
    if (_v > 0) _axis += 8;
    }
return _axis;
