//argument0=border amount

//if outside of the view, destroy self


if(y<view_yview[0]-argument0)
instance_destroy()
if(y>view_yview[0]+view_hview[0]+argument0)
instance_destroy()
if(x>view_xview[0]+view_wview[0]+argument0)
instance_destroy()
if(x<view_xview[0]-argument0)
instance_destroy()
