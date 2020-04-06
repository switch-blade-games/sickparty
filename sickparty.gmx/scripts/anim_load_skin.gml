/// anim_load_skin(skin_id,?sheetpath,?jsonpath);

var _skin_id = argument[0];
if (argument_count == 3)
    {
    var _sheet_path = argument[1];
    var _json_path = argument[2];
    }
else
    {
    var _sheet_path = working_directory+"skins\"+string(global.skin_tag[_skin_id])+"_sheet.png";
    var _json_path  = working_directory+"skins\"+string(global.skin_tag[_skin_id])+"_info.json";
    }

// tag enums
TAG_NAME    = 0;
TAG_START   = 1;
TAG_END     = 2;
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

// clear existing sprites and data structures
if (sprite_exists(global.player_sprite[_skin_id]))
    sprite_delete(global.player_sprite[_skin_id]);
if (ds_exists(global.frame_info[_skin_id],ds_type_grid))
    ds_grid_clear(global.frame_info[_skin_id],0);
else
    global.frame_info[_skin_id] = ds_grid_create(1,4);
if (ds_exists(global.anim_info[_skin_id],ds_type_grid))
    ds_grid_clear(global.anim_info[_skin_id],0);
else
    global.anim_info[_skin_id] = ds_grid_create(aState.size,11);
global.frames[_skin_id] = 0;

if (file_exists(_sheet_path)) and (file_exists(_json_path))
    {
    global.sheet_sha1[_skin_id] = sha1_file(_sheet_path);
    global.json_sha1[_skin_id]  = sha1_file(_json_path);
    
    // tag lookup
    tag_map = ds_map_create();
    tag_info = -1;
    tags = 0;
    
    // expected tags
    for(var i=0; i<aState.size; i++;)
        {
        for(var j=0; j<8; j++;)
            tag_expected[i,j] = "";
        }
    tag_expected[aState.flat_idle,0]         = "idle";
    tag_expected[aState.flat_wait,0]         = "wait";
    tag_expected[aState.flat_fire,0]         = "F_0";
    tag_expected[aState.flat_fire,1]         = "F_45";
    tag_expected[aState.flat_fire,2]         = "F_90";
    tag_expected[aState.flat_fire,3]         = "F_270";
    tag_expected[aState.flat_fire,4]         = "F_315";
    tag_expected[aState.walk_move,0]         = "W_0";
    tag_expected[aState.walk_move,1]         = "W_45";
    tag_expected[aState.walk_move,2]         = "W_315";
    tag_expected[aState.walk_fire,0]         = "W_shoot_0";
    tag_expected[aState.walk_fire,1]         = "W_shoot_45";
    tag_expected[aState.walk_fire,2]         = "W_shoot_315";
    tag_expected[aState.flat_duck_idle,0]    = "F_duck";
    tag_expected[aState.flat_duck_fire,0]    = "F_duck";
    tag_expected[aState.wc_idle,0]           = "C_idle";
    tag_expected[aState.wc_move,0]           = "C_move";
    tag_expected[aState.wc_fire,0]           = "C_0";
    tag_expected[aState.wc_fire,1]           = "C_45";
    tag_expected[aState.wc_fire,2]           = "W_90";
    tag_expected[aState.wc_fire,3]           = "C_135";
    tag_expected[aState.wc_fire,4]           = "C_180";
    tag_expected[aState.wc_fire,5]           = "C_225";
    tag_expected[aState.wc_fire,6]           = "C_270";
    tag_expected[aState.wc_fire,7]           = "C_315";
    tag_expected[aState.mb_idle,0]           = "M_idle";
    tag_expected[aState.mb_move,0]           = "M_move";
    tag_expected[aState.mb_fire,0]           = "M_0";
    tag_expected[aState.mb_fire,1]           = "M_45";
    tag_expected[aState.mb_fire,2]           = "M_90";
    tag_expected[aState.mb_fire,3]           = "M_270";
    tag_expected[aState.mb_fire,4]           = "M_315";
    tag_expected[aState.moto_idle,0]         = "B_idle";
    tag_expected[aState.moto_fire,0]         = "B_0";
    tag_expected[aState.moto_fire,1]         = "B_45";
    tag_expected[aState.moto_fire,2]         = "B_90";
    tag_expected[aState.moto_fire,3]         = "B_135";
    tag_expected[aState.moto_fire,4]         = "B_180";
    tag_expected[aState.moto_fire,5]         = "B_225";
    tag_expected[aState.moto_fire,6]         = "B_270";
    tag_expected[aState.moto_fire,7]         = "B_315";
    tag_expected[aState.roll,0]              = "jump";
    tag_expected[aState.dead_roll,0]         = "dead_fly";
    tag_expected[aState.dead,0]              = "dead";
    tag_expected[aState.victory,0]           = "V_pose";
    
    // load the texture
    global.player_sprite[_skin_id] = sprite_add(_sheet_path,1,true,0,0,0);
    
    // load and read json
    var json = "";
    var file = file_text_open_read(_json_path);
    while(!file_text_eof(file))
        json = string(json)+string(file_text_readln(file));
    file_text_close(file);
    
    // decode and parse json
    info_map = json_decode(json);
    if (info_map > -1)
        {
        // first read meta data
        if (ds_map_exists(info_map,"meta"))
            {
            var meta_map = info_map[?"meta"];
            // read sheet size
            if (ds_map_exists(meta_map,"size"))
                {
                size_map = meta_map[?"size"];
                
                sheet_w = sprite_get_width(global.player_sprite[_skin_id]);
                sheet_h = sprite_get_height(global.player_sprite[_skin_id]);
                if (ds_map_exists(size_map,"w"))
                    sheet_w = real(size_map[?"w"]);
                if (ds_map_exists(size_map,"h"))
                    sheet_h = real(size_map[?"h"]);
                }
            
            // load tags
            if (ds_map_exists(meta_map,"frameTags"))
                {
                tag_list = meta_map[?"frameTags"];
                for(var i=0; i<ds_list_size(tag_list); i++;)
                    {
                    var tags_map = tag_list[|i];
                    
                    // tag name
                    if (ds_map_exists(tags_map,"name"))
                        tag_info[tags,TAG_NAME] = tags_map[?"name"];
                    // tag start
                    if (ds_map_exists(tags_map,"from"))
                        tag_info[tags,TAG_START] = real(tags_map[?"from"]);
                    // tag end
                    if (ds_map_exists(tags_map,"to"))
                        tag_info[tags,TAG_END] = real(tags_map[?"to"]);
                    
                    // add to tag lookup
                    ds_map_add(tag_map,tag_info[tags,TAG_NAME],tags);
                    // calculate number of frames
                    if (tag_info[tags,TAG_END]+1 > global.frames[_skin_id])
                        global.frames[_skin_id] = tag_info[tags,TAG_END]+1;
                    
                    // increment
                    tags++;
                    }
                }
            }
        
        // init frame info array
        if (ds_grid_width(global.frame_info[_skin_id]) != global.frames[_skin_id])
        or (ds_grid_height(global.frame_info[_skin_id]) != 4)
            {
            ds_grid_resize(global.frame_info[_skin_id],global.frames[_skin_id],4);
            ds_grid_clear(global.frame_info[_skin_id],0);
            }
        
        // next read frame data
        if (ds_map_exists(info_map,"frames"))
            {
            var frames_map = info_map[?"frames"];
            // loop through frames
            var frames_key = ds_map_find_first(frames_map);
            while(ds_map_exists(frames_map,frames_key))
                {
                // determine frame index
                pos = string_pos(".ase",frames_key)-1;
                len = 1;
                var char = string_char_at(frames_key,pos);
                while(string_digits(char) != "")
                    {
                    pos--;
                    len++;
                    char = string_char_at(frames_key,pos);
                    }
                index = real(string_copy(frames_key,pos,len));
                
                // load frame info
                frame_map = frames_map[?frames_key];
                if (ds_map_exists(frame_map,"frame"))
                    {
                    tex_map = frame_map[?"frame"];
                    
                    // tex x
                    if (ds_map_exists(tex_map,"x"))
                        ds_grid_set(global.frame_info[_skin_id],index,FRAME_TEX_X,tex_map[?"x"]);
                    // tex y
                    if (ds_map_exists(tex_map,"y"))
                        ds_grid_set(global.frame_info[_skin_id],index,FRAME_TEX_Y,tex_map[?"y"]);
                    // tex w
                    if (ds_map_exists(tex_map,"w"))
                        ds_grid_set(global.frame_info[_skin_id],index,FRAME_TEX_W,tex_map[?"w"]);
                    // tex h
                    if (ds_map_exists(tex_map,"h"))
                        ds_grid_set(global.frame_info[_skin_id],index,FRAME_TEX_H,tex_map[?"h"]);
                    }
            
                frames_key = ds_map_find_next(frames_map,frames_key);
                }
            }
        }
    ds_map_destroy(info_map);
    
        // define animations
    var _group = 0;
    anim_create(_skin_id,aState.flat_idle,      _group++);
    anim_create(_skin_id,aState.flat_wait,      _group++);
    anim_create(_skin_id,aState.flat_fire,      _group++,0,1,2,1,0,4,3,4);
    anim_create(_skin_id,aState.walk_move,      _group  ,0,1,0,1,0,2,0,2);
    anim_create(_skin_id,aState.walk_fire,      _group++,0,1,0,1,0,2,0,2);
    anim_create(_skin_id,aState.flat_duck_idle, _group++);
    anim_create(_skin_id,aState.flat_duck_fire, _group++);
    anim_create(_skin_id,aState.wc_idle,        _group++);
    anim_create(_skin_id,aState.wc_move,        _group++);
    anim_create(_skin_id,aState.wc_fire,        _group++,0,1,2,3,4,5,6,7);
    anim_create(_skin_id,aState.mb_idle,        _group++);
    anim_create(_skin_id,aState.mb_move,        _group++);
    anim_create(_skin_id,aState.mb_fire,        _group++,0,1,2,1,0,4,3,4);
    anim_create(_skin_id,aState.moto_idle,      _group++);
    anim_create(_skin_id,aState.moto_fire,      _group++,0,1,2,3,4,5,6,7);
    anim_create(_skin_id,aState.roll,           _group++);
    anim_create(_skin_id,aState.dead_roll,      _group++);
    anim_create(_skin_id,aState.dead,           _group++);
    anim_create(_skin_id,aState.victory,        _group++);
    
    ds_map_destroy(tag_map);
    tag_expected = -1;
    tag_info = -1;
    }
