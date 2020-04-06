/// room_init();

// camera
if (instance_number(JB_cam) > 1)
    {
    with(JB_cam)
        instance_destroy();
    }
if (!instance_exists(JB_cam))
    instance_create(0,0,JB_cam);
