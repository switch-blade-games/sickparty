/// slider(x1,y1,x2,y2,array);

var _x1 = min(argument[0],argument[2]);
var _y1 = min(argument[1],argument[3]);
var _x2 = max(argument[2],argument[0]);
var _y2 = max(argument[3],argument[1]);
var _a = argument[4];
var _v = (_y2-_y1) > (_x2-_x1);

var _val = _a[0];
var _ele = _a[1];
var _btn = _a[2];

draw_set_color($FFFFFF);
draw_rectangle(_x1,_y1,_x2,_y2,1);

if (_ele <= 0)
    {
    _a[@2] = false;
    return(_a);
    }

if (_v)
    {
    var _ssz = _y2-_y1;
    var _bsz = max(16,floor(_ssz/_ele));
    var _bx1 = _x1+1; var _bx2 = _x2-2;
    var _by1 = _y1+(_ssz-_bsz)*_val+1;
    var _by2 = _by1+_bsz-1;
    }
else
    {
    var _ssz = _x2-_x1;
    var _bsz = max(16,floor(_ssz/_ele));
    var _by1 = _y1+1; var _by2 = _y2-1;
    var _bx1 = _x1+(_ssz-_bsz)*_val+1;
    var _bx2 = _bx1+_bsz-2;
    }

if (_btn)
    {
    draw_set_color($FFFFFF);
    draw_rectangle(_bx1,_by1,_bx2,_by2,0);
    
    if (mouse_check_button(mb_left))
        {
        if (_v)
            _a[@0] = clamp(((mouse_y-_bsz/2)-_y1)/(_ssz-_bsz),0,1);
        else
            _a[@0] = clamp(((mouse_x-_bsz/2)-_x1)/(_ssz-_bsz),0,1);
        }
    else
        _a[@2] = false;
    }
else
    {
    if (point_in_rectangle(mouse_x,mouse_y,_x1,_y1,_x2,_y2))
        {
        if (mouse_check_button_pressed(mb_left))
            _a[@2] = true;
        
        draw_set_color($CCCCCC);
        draw_rectangle(_bx1+2,_by1+2,_bx2-2,_by2-2,0);
        }
    else
        {
        draw_set_color($AAAAAA);
        draw_rectangle(_bx1+2,_by1+2,_bx2-2,_by2-2,0);
        }
    }

return(_a);

