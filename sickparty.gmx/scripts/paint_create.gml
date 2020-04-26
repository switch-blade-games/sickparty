////MUST KEEP ALARMS 0,1,2 OPEN FOR THIS TO WORK!!!

///MUST ADD HOARD FUNCTIONS TO ALARMS 0,1,2

//argument0=hoard sprite 1
//argument1=hoard sprite 2
//argument2=hoard sprite 3
//argument3= black fill object
//argument4= hoard BG color fill

//argument5= TIME1
//argument6 = TIME2
//argument7 = TIME3

//argument8 = NUM1
//argument9 = NUM2
//argument10 = NUM3

BLACKobj=argument3

MYcol=argument4

///ONE=
///TWO=
///THREE=

SURout = surface_create(400, 240);
SURmask = surface_create(400, 240);
SURfill = surface_create(400, 240);


//end addition

PAINTsur=surface_create(400,240)
WHITEsur=surface_create(400,240)

ONEnum=argument8
TWOnum=argument9
THREEnum=argument10


ONEtime=argument5
TWOtime=argument6
THREEtime=argument7

ONEspr=argument0
TWOspr=argument1
THREEspr=argument2

alarm[0]=ONEtime
alarm[1]=TWOtime
alarm[2]=THREEtime

var set=0;


repeat(ONEnum){
ONEx[set]=random(400)
ONEy[set]=random(240)
ONEimg[set]=random(sprite_get_number(ONEspr))
ONEang[set]=random(360)
set+=1
}

set=0

repeat(TWOnum){
TWOx[set]=random(400)
TWOy[set]=random(240)
TWOimg[set]=random(sprite_get_number(TWOspr))
TWOang[set]=random(360)
set+=1
}

set=0

repeat(THREEnum){
THREEx[set]=random(400)
THREEy[set]=random(240)
THREEimg[set]=random(sprite_get_number(THREEspr))
THREEang[set]=random(360)
set+=1
}
