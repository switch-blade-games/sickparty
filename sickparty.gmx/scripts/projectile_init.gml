/// projectile_init(xfrom,yfrom,xto,yto,h);

// xfrom/yfrom - start position
// xto/yto     - target position
// h           - arc vertical height

// completion
pt = 0;
pt_old = 0;
pt_end = false;
// delta x/y
dx = 0;
dy = 0;

// arc coordinates
px[0] = argument[0];
py[0] = argument[1];
px[1] = lerp(argument[0],argument[2],0.5);
py[1] = min(argument[1],argument[3])-argument[4];
px[2] = argument[2];
py[2] = argument[3];
