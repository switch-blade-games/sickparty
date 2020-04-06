/// button(x,y,w,h,text,hilight);

var _w = max(argument[2],string_width(argument[4]));
var _h = max(argument[3],string_height(argument[4]));
var _x1 = argument[0];
var _y1 = argument[1];
var _x2 = argument[0]+_w;
var _y2 = argument[1]+_h;
var _t = argument[4];
var _b = false;
var _c = false;
if (argument_count == 6)
    _c = argument[5];

draw_set_halign(1);
draw_set_valign(1);

var _in = point_in_rectangle(mouse_x,mouse_y,_x1,_y1,_x2,_y2);
if (_in) or (_c)
    {
    draw_set_color($FFFFFF);
    draw_rectangle(_x1,_y1,_x2,_y2,0);
    draw_set_color($000000);
    draw_text(_x1+(_x2-_x1)/2,_y1+(_y2-_y1)/2,_t);
    
    if (mouse_check_button_pressed(mb_left)) and (_in)
        _b = true;
    }
else
    {
    draw_set_color($FFFFFF);
    draw_rectangle(_x1,_y1,_x2,_y2,1);
    draw_text(_x1+(_x2-_x1)/2,_y1+(_y2-_y1)/2,_t);
    }

draw_set_halign(0);
draw_set_valign(0);

return(_b);

