/// draw_enemy_self();

var _spr = sprite_index;
var _ind = image_index;
var _x = x;
var _y = y;
var _xscl = image_xscale;
var _yscl = image_yscale;
var _ang = image_angle;
var _col = image_blend;
var _alpha = image_alpha;

if (argument_count == 9)
    {
    _spr = argument[0];
    _ind = argument[1];
    _x = argument[2];
    _y = argument[3];
    _xscl = argument[4];
    _yscl = argument[5];
    _ang = argument[6];
    _col = argument[7];
    _alpha = argument[8];
    }

if (flash > 0)
    {
    shader_set(shd_flash);
    draw_sprite_ext(_spr,_ind,_x,_y,_xscl,_yscl,_ang,_col,_alpha);
    shader_reset();
    flash = max(0,flash-0.5);
    }
else
    draw_sprite_ext(_spr,_ind,_x,_y,_xscl,_yscl,_ang,_col,_alpha);
