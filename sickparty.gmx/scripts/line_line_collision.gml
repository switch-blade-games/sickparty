/// line_line_collision(x1,y1,x2,y2,x3,y3,x4,y4);

var denominator = ((argument[2]-argument[0])*(argument[7]-argument[5])) - ((argument[3]-argument[1])*(argument[6]-argument[4]));
var numerator1  = ((argument[1]-argument[5])*(argument[6]-argument[4])) - ((argument[0]-argument[4])*(argument[7]-argument[5]));
var numerator2  = ((argument[1]-argument[5])*(argument[2]-argument[0])) - ((argument[0]-argument[4])*(argument[3]-argument[1]));

// detect coincident lines
if (denominator == 0)
    return((numerator1 == 0) and (numerator2 == 0))

var r = numerator1/denominator;
var s = numerator2/denominator;
return(((r >= 0) and (r <= 1)) and ((s >= 0) and (s <= 1)));
