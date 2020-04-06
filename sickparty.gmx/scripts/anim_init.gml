/// anim_init();

skin_ready = false;

// player skin
skin_id = -1;
spr_index = -1;
img_index = 0;
img_speed = -1;

// player anim
anim_state = aState.flat_idle;
anim_group = -1;
anim_angle = 0;
anim_start = 0;
anim_end = 0;
anim_len = 0;

// frame/info data
frame_info = -1;
anim_info = -1;
frames = 0;

// frame enums
FRAME_TEX_X = 0;
FRAME_TEX_Y = 1;
FRAME_TEX_W = 2;
FRAME_TEX_H = 3;
// anim enums
ANIM_LEN   = 0;
ANIM_AIM   = 1;
ANIM_GROUP = 2;
ANIM_POS0  = 3;
ANIM_POS1  = 4;
ANIM_POS2  = 5;
ANIM_POS3  = 6;
ANIM_POS4  = 7;
ANIM_POS5  = 8;
ANIM_POS6  = 9;
ANIM_POS7  = 10;
