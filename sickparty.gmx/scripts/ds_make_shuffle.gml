//argument0 = list name
//argument1 = list number

var LISTname=argument0;
var LISTnum=argument1;

var i=0;

repeat(LISTnum){

    ds_list_insert(LISTname,i,i)
    i+=1
}

ds_list_shuffle(LISTname)


