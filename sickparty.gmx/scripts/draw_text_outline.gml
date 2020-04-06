/// draw_text_outline(x,y,str,...);

var _bg_col = $000000;
var _fg_col = $FFFFFF;
if (argument_count > 3)
    _fg_col = argument[3];
if (argument_count > 4)
    _bg_col = argument[4];

draw_set_color(_bg_col);
draw_text(argument[0]+1,argument[1]+1,argument[2]);
draw_set_color(_fg_col);
draw_text(argument[0],argument[1],argument[2]);
