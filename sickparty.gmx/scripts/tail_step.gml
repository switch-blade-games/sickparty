//handle tail

path_add_point(TAILpath,x,y,0)

var set=0;
var SEGdist=PATHlen/NUM;

repeat(NUM){

    if(path_get_point_x(TAILpath,path_get_number(TAILpath)-(SEGdist*set+1))>0){

        if(instance_number(TAILson[set])=1){
        TAILson[set].x=path_get_point_x(TAILpath,path_get_number(TAILpath)-(SEGdist*set+1))
        TAILson[set].y=path_get_point_y(TAILpath,path_get_number(TAILpath)-(SEGdist*set+1))
        }
    }
    
    
    set+=1
}

path_delete_point(TAILpath,path_get_number(TAILpath)-PATHlen)
