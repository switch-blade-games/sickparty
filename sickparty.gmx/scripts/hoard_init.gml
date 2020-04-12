//"background" sprites as needed
SPRbg1=argument0
SPRbg2=argument1
SPRbg3=argument2

FILL=argument3


alarm[0]=SPR1time
alarm[1]=SPR2time
alarm[2]=SPR3time

var set=0;


repeat(SPR1num){
SPR1x[set]=random(room_width)
SPR1y[set]=random(room_height)
SPR1img[set]=random(sprite_get_number(SPR1))
SPR1ang[set]=random(360)
set+=1
}

set=0

repeat(SPR2num){
SPR2x[set]=random(room_width)
SPR2y[set]=random(room_height)
SPR2img[set]=random(sprite_get_number(SPR2))
SPR2ang[set]=random(360)
set+=1
}

set=0

repeat(SPR3num){
SPR3x[set]=random(room_width)
SPR3y[set]=random(room_height)
SPR3img[set]=random(sprite_get_number(SPR3))
SPR3ang[set]=random(360)
set+=1
}
