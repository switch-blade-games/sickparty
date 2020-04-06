/// verlet_update();

if (active)
    {
    // handle constraints
    repeat(passes)
        {
        for(var i=0; i<links; i++;)
            {
            // verlet a/b
            var la = link[@i*4+0]; // inst a
            var lb = link[@i*4+1]; // inst b
            var rd = link[@i*4+2]; // resting distance
            
            // position differences
            var dx = la.x - lb.x;
            var dy = la.y - lb.y;
            // distance
            var dis = sqrt(dx*dx + dy*dy);
            
            // distance scalar
            var d = (rd - dis)/dis;
            
            // translate distance
            var tx = dx * d * 0.5;
            var ty = dy * d * 0.5;
            
            // translate verlet a
            la.x += tx;
            la.y += ty;
            // translate verlet b
            lb.x -= tx;
            lb.y -= ty;
            
            if (dis > rd*2)
                link[@i*4+3] = false;
            }
        }
    
    // handle motion
    with(par_verlet)
        {
        if (static)
            {
            x = xstart;
            y = ystart;
            continue;
            }
        
        // velocity
        vx = (x - lx)*0.99;
        vy = (y - ly)*0.99;
        
        // last position
        lx = x;
        ly = y;
        
        // apply motion
        x += vx;
        y += vy + 0.4; // gravity
        }
    }

// handle links
if (links_removed > 0)
    {
    var temp = array_create(links_max);
    var j = 0;
    
    for(var i=0; i<links; i++;)
        {
        if (link[i*4+3])
            {
            temp[@j*4+0] = link[@i*4+0];
            temp[@j*4+1] = link[@i*4+1];
            temp[@j*4+2] = link[@i*4+2];
            temp[@j*4+3] = true;
            j++;
            }
        else
            {
            var la = link[@i*4+0];
            var lb = link[@i*4+1];
            
            la.links--;
            if (la.links <= 0)
                instance_destroy(la);
            lb.links--;
            if (lb.links <= 0)
                instance_destroy(lb);
            }
        }
    
    link = temp;
    links -= links_removed;
    links_removed = 0;
    }
