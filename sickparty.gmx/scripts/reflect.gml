/// reflect(ix,iy,nx,ny);

// two unit vectors as inputs
// return angle of reflection

var ix = argument[0]; var iy = argument[1];
var nx = argument[2]; var ny = argument[3];

var dot = dot_product(nx,ny,ix,iy);
return(point_direction(0,0,ix-2*dot*nx,iy-2*dot*ny));
