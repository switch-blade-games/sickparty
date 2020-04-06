var USElist=HUNNYlist;

with(hunny_node)
ds_list_insert(USElist,0,id)


ds_list_shuffle(HUNNYlist)



//number of entries to delete

NUM=argument0

repeat(NUM)
ds_list_delete(HUNNYlist,0)

ds_list_shuffle(HUNNYlist)


repeat(ds_list_size(HUNNYlist)){

    var NODE=ds_list_find_value(HUNNYlist,0);
    with(NODE)
        MAKE=true
    ds_list_delete(HUNNYlist,0)
}


    
