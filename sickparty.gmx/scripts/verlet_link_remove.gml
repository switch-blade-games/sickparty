/// verlet_link_remove(a,b);

var la = argument[0];
var lb = argument[1];

with(obj_control)
    {
    for(var i=0; i<links; i++;)
        {
        if (((link[@i*4+0] == la) and (link[@i*4+1] == lb))
        or ((link[@i*4+0] == lb) and (link[@i*4+1] == la))) and (link[@i*4+3])
            {
            links_removed++;
            link[@i*4+3] = false;
            return(true);
            }
        }
    }
return(false);
