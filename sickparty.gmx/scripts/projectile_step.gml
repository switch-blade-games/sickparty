/// projectile_step(t);

if (!pt_end)
    {
    if (pt < 1)
        {
        if (argument_count > 0)
            {
            pt_old = pt;
            pt = argument[0];
            }
        else
            {
            pt_old = pt;
            pt += 0.01;
            }
        
        xprevious = x;
        yprevious = y;
        x = bezier(px[0],px[1],px[2],pt);
        y = bezier(py[0],py[1],py[2],pt);
        dx = x-xprevious;
        dy = y-yprevious;
        }
    else if (pt >= 1)
        {
        pt_end = true;
        pt_old = 1;
        pt = 1;
        hspeed = dx;
        vspeed = dy;
        }
    }
