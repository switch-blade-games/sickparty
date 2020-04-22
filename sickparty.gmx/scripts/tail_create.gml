//0=path_length
//1=number of segments
//2=tail object

TAILpath=path_add()
path_set_closed(TAILpath,false)
PATHlen=argument0

NUM=argument1

var set=0;

TAILobj=argument2

repeat(NUM){
    TAILson[set]=instance_create(x,y,TAILobj)
    with(TAILson[set])
    TAIL=true
    set+=1
}
