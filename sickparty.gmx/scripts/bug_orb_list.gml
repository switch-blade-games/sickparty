ORBlist=ds_list_create()

var i=0;

repeat(NUM){

    ds_list_insert(ORBlist,i,i)
    i+=1
    
}

ds_list_shuffle(ORBlist)
