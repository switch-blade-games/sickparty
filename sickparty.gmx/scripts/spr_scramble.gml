//argument0=sprite index
// argument1 = NOISE 24
//argument2 = PROBABILITY 3
//argument3 = NUM


var NOISE=argument1;

var OFFSET=0;

var PROB=argument2;

var NUM=argument3;

var SLICE=sprite_get_height(argument0)/NUM;

var WID=sprite_get_width(argument0);

var HI=sprite_get_height(argument0);

var i=0;

repeat(NUM+1){

if(random(PROB)<1)
OFFSET=choose(-NOISE,NOISE)
else
OFFSET=0

draw_sprite_part(argument0,-1,0,i*SLICE,WID,(i+1)*SLICE,x-(WID/2)-random(OFFSET)+random(OFFSET),y-(HI/2)+(i*SLICE))

draw_sprite(node_spr,-1,x,y)

//draw_sprite_part(argument0,-1,0,(i+1)*SLICE,WID,i*SLICE,x-(WID/2)-random(OFFSET)+random(OFFSET),y+(i*SLICE))

i+=1
}

exit

/*


if(random(PROB)<1)
OFFSET=choose(-NOISE,NOISE)
else
OFFSET=0

draw_sprite_part(argument0,-1,0,4,64,8,x-24-random(OFFSET)+random(OFFSET),y-22+FADE)

if(random(PROB)<1)
OFFSET=choose(-NOISE,NOISE)
else
OFFSET=0

draw_sprite_part(argument0,-1,0,8,64,12,x-24-random(OFFSET)+random(OFFSET),y-18+FADE)

if(random(PROB)<1)
OFFSET=choose(-NOISE,NOISE)
else
OFFSET=0

draw_sprite_part(argument0,-1,0,12,64,16,x-24-random(OFFSET)+random(OFFSET),y-14+FADE)

if(random(PROB)<1)
OFFSET=choose(-NOISE,NOISE)
else
OFFSET=0

draw_sprite_part(argument0,-1,0,16,64,20,x-24-random(OFFSET)+random(OFFSET),y-10+FADE)

if(random(PROB)<1)
OFFSET=choose(-NOISE,NOISE)
else
OFFSET=0

draw_sprite_part(argument0,-1,0,20,64,24,x-24-random(OFFSET)+random(OFFSET),y-6+FADE)

if(random(PROB)<1)
OFFSET=choose(-NOISE,NOISE)
else
OFFSET=0

draw_sprite_part(argument0,-1,0,24,64,28,x-24-random(OFFSET)+random(OFFSET),y-2+FADE)

