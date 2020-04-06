/// bezier(a,b,c,x);

var _ab = lerp(argument[0],argument[1],argument[3]);
var _bc = lerp(argument[1],argument[2],argument[3]);
return(lerp(_ab,_bc,argument[3]));
