//place in tail parent destroy event to destroy tail

var set=0;

repeat(NUM){

    with(TAILson[set])
    instance_destroy()
        
    set+=1
    
    DEAD=true
}
