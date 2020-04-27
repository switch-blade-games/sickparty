/// target(obj,?mode);

// target an actor/enemy/shootable object
// by default chooses the instance targeted the least

var _target_obj  = argument[0];
var _target_mode = 0;
if (argument_count == 2)
    _target_mode = argument[1];

var _target_min = +999999;
var _target_max = -999999;
var _target_id  = noone;

if (_target_mode == 0) // default (targeted the least)
    {
    with(_target_obj)
        {
        if (target_num < _target_min)
            {
            show_debug_message("ID: "+string(id));
            _target_min = target_num;
            _target_id  = id;
            }
        }
    }
else if (_target_mode == 1) // highest HP
    {
    with(_target_obj)
        {
        if (hp > _target_max)
            {
            _target_max = hp;
            _target_id  = id;
            }
        }
    }
else if (_target_mode == 2) // longest alive
    {
    var _time = get_timer();
    with(_target_obj)
        {
        if (_time-life_time > _target_max)
            {
            _target_max = _time-life_time;
            _target_id  = id;
            }
        }
    }
else if (_target_mode == 3) // closest
    {
    var _x = x;
    var _y = y;
    with(_target_obj)
        {
        var _dis = point_distance(_x,_y,x,y);
        if (_dis < _target_min)
            {
            _target_min = _dis;
            _target_id  = id;
            }
        }
    }
else if (_target_mode == 4) // furthest
    {
    var _x = x;
    var _y = y;
    with(_target_obj)
        {
        var _dis = point_distance(_x,_y,x,y);
        if (_dis > _target_max)
            {
            _target_max = _dis;
            _target_id  = id;
            }
        }
    }

target_id = _target_id;
target_id.target_num++;

return(target_id);
