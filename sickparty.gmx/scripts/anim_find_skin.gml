/// anim_find_skin();

if (!file_exists(sheet_path[skin_id]))
or (!file_exists(json_path[skin_id]))
    show_message("Missing PNG and/or JSON files! Please locate sheet and info files for "+string(skin_tag[skin_id]));

if (!file_exists(sheet_path[skin_id]))
    {
    var path = "";
    while(!file_exists(path))
        path = get_open_filename("Image Files|*.png","");
    file_copy(path,sheet_path[skin_id]);
    }
if (!file_exists(json_path[skin_id]))
    {
    var path = "";
    while(!file_exists(path))
        path = get_open_filename("JSON Files|*.json","");
    file_copy(path,json_path[skin_id]);
    }

autosprite_timer = 60;
sheet_sha1 = sha1_file(sheet_path[skin_id]);
json_sha1  = sha1_file(json_path[skin_id]);
