/// verlet_link_add(a,b,rest);

var la = argument[0];
var lb = argument[1];
var rd = argument[2];

if (obj_control.links >= obj_control.links_max)
or (!instance_exists(la))
or (!instance_exists(lb))
    return(false);

la.links++;
lb.links++;

with(obj_control)
    {
    link[@links*4+0] = la;
    link[@links*4+1] = lb;
    link[@links*4+2] = rd;
    link[@links*4+3] = true;
    links++;
    }

return(true);
