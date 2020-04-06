/// config_action(action);

var _action = argument[0];
var _type = "";

switch(_action)
    {
    case config.fullscreen:
        _type = "video";
        break;
    
    case config.windowScale:
        var _dw = display_get_width();
        var _dh = display_get_height();
        if (view_wview[0]*global.CFG[config.windowScale] > _dw)
        or (view_hview[0]*global.CFG[config.windowScale] > _dh)
            global.CFG[config.windowScale] = 1;
        
        _type = "video";
        break;
    
    case config.vsync:
        _type = "video";
        break;
    }

switch(_type)
    {
    case "video":
        display_reset(0,global.CFG[config.vsync]);
        window_set_fullscreen(global.CFG[config.fullscreen]);
        if (!global.CFG[config.fullscreen])
            {
            var _scl = global.CFG[config.windowScale];
            window_set_size(view_wview[0]*_scl,view_hview[0]*_scl);
            window_set_position(display_get_width()/2-(view_wview[0]/2)*_scl,display_get_height()/2-(view_hview[0]/2)*_scl);
            }
        surface_resize(application_surface,view_wview[0],view_hview[0]);
        display_set_gui_size(view_wview[0],view_hview[0]);
        break;
    }
