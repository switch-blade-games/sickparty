///argument0 = object
///argument1 = number of objects
///argument2= ds_grid_length
//argument3= Ds grid_height
//argument4=placement noise
//argument5 SPACE = number to multiply by
//argument6 OFFSET= OFFSET for the top right corner

var OBJ=argument0;
var NUM=argument1;
var Xnum=argument2;
var Ynum=argument3;
var NOISE=argument4;
var SPACE=argument5;
var OFFSET=argument6;


//ds_grid for tele stab man placement
PlaceGrid=ds_grid_create(Xnum,Ynum)

var xset,yset,numset;
xset=0
yset=0
numset=1

repeat(Xnum*Ynum){
ds_grid_set(PlaceGrid,xset,yset,numset)
xset+=1
if(xset>=Xnum){
yset+=1
xset=0
}
numset+=1
}

PlaceList=ds_list_create()

var ListSet;
ListSet=0

//repeat for size of grid
repeat(Xnum*Ynum){
ds_list_insert(PlaceList,ListSet,ListSet+1)
ListSet+=1
}

//shuffle the list
ds_list_shuffle(PlaceList)



//set grid values
var placerX,placerY
placerX=(ds_grid_value_x(PlaceGrid,0,0,Xnum,Ynum,ds_list_find_value(PlaceList,0)))*SPACE +random(NOISE)-random(NOISE) +OFFSET //add noise here
placerY=(ds_grid_value_y(PlaceGrid,0,0,Xnum,Ynum,ds_list_find_value(PlaceList,0)))*SPACE +random(NOISE)-random(NOISE) +OFFSET//add noise here




//repeat for number of other guys wanted
repeat(NUM){
    placerX=(ds_grid_value_x(PlaceGrid,0,0,Xnum,Ynum,ds_list_find_value(PlaceList,0)))*SPACE +random(NOISE)-random(NOISE) +OFFSET//add noise here
    placerY=(ds_grid_value_y(PlaceGrid,0,0,Xnum,Ynum,ds_list_find_value(PlaceList,0)))*SPACE +random(NOISE)-random(NOISE) +OFFSET//add noise here
    
    instance_create(view_xview[0]+placerX,view_yview[0]+placerY,OBJ)
    ds_list_delete(PlaceList,0)
}


//clear out the list when done
ds_grid_destroy(PlaceGrid)
ds_list_destroy(PlaceList)
