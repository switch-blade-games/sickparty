//argument0=sprite
//argument1=x
//argument2=y
//argument3=LEN
//argument4=HI
//argument5=color of under rectangle
//argument6= ODDS

//argument 5 is "DEAD"
var PASS=argument5;

var SPR=argument0;
var LEN=argument3;
var HI=argument4;

var ODDS=argument6

var IMGtrack=0;

var IMG=sprite_get_number(SPR);


var set=0;

if(random(ODDS)<1)
MYcol=random_color()



repeat(array_length_1d(BORDER)){

    if(random(ODDS)<1)
        BORDER[set]=floor(random(IMG))
    set+=1
    }



//draw under color

draw_set_color(MYcol)
draw_rectangle(argument1+20,argument2+20,argument1+LEN-20,argument2+HI-20,false)

draw_set_color(c_white)

//top left corner
draw_sprite_part(SPR,BORDER[IMGtrack],0,0,20,20,argument1,argument2)
IMGtrack+=1

var DRAWlen=(LEN-20)/20;

var i=0;

//draw horz lines
repeat(DRAWlen-1){

draw_sprite_part(SPR,BORDER[IMGtrack],20,0,20,20,argument1+20+(20*i),argument2)
IMGtrack+=1

draw_sprite_part(SPR,BORDER[IMGtrack],20,40,20,20,argument1+20+(20*i),argument2+HI-20)
IMGtrack+=1

i+=1

}

var i=0;


//draw top right corner
draw_sprite_part(SPR,BORDER[IMGtrack],40,0,20,20,argument1+(LEN-20),argument2)
IMGtrack+=1

//draw VERT lines

var DRAWhi=(HI-20)/20;

var i=0;

repeat(DRAWhi-1){

draw_sprite_part(SPR,BORDER[IMGtrack],0,20,20,20,argument1,argument2+20+(i*20))
IMGtrack+=1

draw_sprite_part(SPR,BORDER[IMGtrack],40,20,20,20,argument1+LEN-20,argument2+20+(i*20))
IMGtrack+=1

i+=1

}

//draw bottom left corner

draw_sprite_part(SPR,BORDER[IMGtrack],0,40,20,20,argument1,argument2+HI-20)
IMGtrack+=1
//draw bottom right corner

draw_sprite_part(SPR,BORDER[IMGtrack],40,40,20,20,argument1+LEN-20,argument2+HI-20)
IMGtrack+=1