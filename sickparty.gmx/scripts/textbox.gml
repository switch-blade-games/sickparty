/// textbox(x,y,w,h,array);
/// @arg x
/// @arg y
/// @arg w
/// @arg h
/// @arg array

var _bx = argument[0];
var _by = argument[1];
var _bw = argument[2];
var _bh = argument[3];
var _a = argument[4];

var _str = _a[0];
var _act = _a[1];

if (_act)
    {
    if (keyboard_check(vk_control))
        {
        if (keyboard_check_pressed(ord("C")))
            clipboard_set_text(_a[0]);
        else if (keyboard_check_pressed(ord("X")))
            {
            clipboard_set_text(_a[0]);
            _a[@0] = "";
            }
        else if (keyboard_check_pressed(ord("V")))
            {
            if (clipboard_has_text())
                {
                var _clip_str = clipboard_get_text();
                if (string_width(_a[0]) < _bw-12)
                    {
                    var _len = 0;
                    while(_len < string_length(_clip_str))
                        {
                        if (string_width(string(a[0]) + string_copy(_clip_str,1,_len+1)) < _bw-12)
                            _len++;
                        else
                            break;
                        }
                    _a[@0] = string(_a[0]) + string_copy(_clip_str,1,_len);
                    }
                }
            }
        }
    if (keyboard_check_pressed(vk_backspace))
        {
        if (string_length(_a[0]) > 0)
            _a[@0] = string_copy(_a[0],1,string_length(_a[0])-1);
        }
    else
        {
        if (keyboard_string != "")
            {
            if (string_width(_str) < _bw-12)
                _a[@0] = string(_a[0])+keyboard_string;
            
            keyboard_string = "";
            }
        }
    
    if (sin(current_time/75) >= 0)
        _str = string(_str)+"|";
    
    draw_set_color($FFFFFF);
    draw_rectangle(_bx,_by,_bx+_bw,_by+_bh,1);
    draw_text(_bx+4,_by,_str);
    
    if (!point_in_rectangle(mouse_x,mouse_y,_bx,_by,_bx+_bw,_by+_bh))
    and (mouse_check_button_pressed(mb_left))
        _a[@1] = false;
    }
else
    {
    if (_a[0] == "")
        _str = _a[2];
    
    if (point_in_rectangle(mouse_x,mouse_y,_bx,_by,_bx+_bw,_by+_bh))
        {
        draw_set_color($CCCCCC);
        draw_rectangle(_bx,_by,_bx+_bw,_by+_bh,1);
        draw_text(_bx+4,_by,_str);
        
        if (mouse_check_button_pressed(mb_left))
            {
            _a[@1] = true;
            keyboard_string = "";
            }
        }
    else
        {
        draw_set_color($AAAAAA);
        draw_rectangle(_bx,_by,_bx+_bw,_by+_bh,1);
        draw_text(_bx+4,_by,_str);
        }
    }
