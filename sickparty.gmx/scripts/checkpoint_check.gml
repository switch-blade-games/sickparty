if (!instance_exists(par_actor))
    exit;

with(checkpoint_obj)
    {
    if (CHK < global.CHECKPOINT)
        instance_destroy();
    
    var SETindex = MYindex;
    var SETstate = MYstate;
    var SETx = x;
    var SETy = y;
    
    if (CHK = global.CHECKPOINT)
        {
        with(JB_cam)
            {
            state = SETstate;
            cam_x = SETx;
            cam_y = SETy;
            if (SETindex != -1)
                Ycurrent = MYarray[SETindex];
            }
        with(par_actor)
            {
            x = SETx+20;
            y = SETy+20;
            }
        }
    }
