if (!instance_exists(par_actor))
    exit;

with(checkpoint_obj)
    {
    if (checkpoint_index < global.CHECKPOINT)
        active = false;
    else if (checkpoint_index == global.CHECKPOINT)
        {
        checkpoint_set = true;
        
        var _state = camera_state;
        var _axis = camera_axis;
        var _node = camera_node;
        var _x = x;
        var _y = y;
        
        with(JB_cam)
            {
            state = _state;
            axis = _axis;
            node_index = _node;
            x = _x;
            y = _y;
            }
        with(par_actor)
            {
            x = SETx+20;
            y = SETy+20;
            }
        }
    }
