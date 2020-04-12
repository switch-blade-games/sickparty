//the COL array must be created in the create event!!!
//the FONT array must be created in the create event!!!

//argument0= the original string - DONORstring
//argument1= the spacing between letters - SPACING
//argument2= v spacing - Vspace
//argument3= max string width - MAXlen
//argument4= x placement of string - PLACEx
//argument5= y placement of string - PLACEy
//argument6= drop shadow
//argument7= ODDS

var DONORstring=argument0;

var SPACING=argument1;

var Vspace=argument2;

var MAXlen=argument3;

var PLACEx=argument4;

var PLACEy=argument5;

var ODDS=argument7;

var LEN=string_length(DONORstring);

var i=0;

//populating the array which each letter from DONORstring

repeat(LEN){
    SLICE[i]=string_copy(DONORstring,i+1,1);
    
    i+=1
}

var ii=0;

var Vticks=0;

/*

//draw clips
repeat(LEN){
    
    var Xslice=ii*SPACING-(MAXlen*Vticks);
    
    if(Xslice>MAXlen){
    PLACEy+=Vspace;
    Vticks+=1
    Xslice=ii*SPACING-(MAXlen*Vticks);
    }
    
    if(Vticks>0)
    Xslice-=SPACING
    
    //switch up clip subimages
    if(random(100)<1)
    CLIP[ii]=random(sprite_get_number(color_clip_spr))
    
    draw_sprite(color_clip_spr,CLIP[ii],PLACEx+Xslice+1,PLACEy+1);
    
    ii+=1
}
    */

///////////////////draw text


//reset vars for redraw
var ii=0;

var Vticks=0;

var PLACEx=argument4;

var PLACEy=argument5;

repeat(LEN){
    
    var Xslice=ii*SPACING-(MAXlen*Vticks);
    
    
    if(Xslice>MAXlen){
    PLACEy+=Vspace;
    Vticks+=1
    Xslice=ii*SPACING-(MAXlen*Vticks);
    }
    
    if(Vticks>0)
    Xslice-=SPACING
    
    
    
    //switch up colors
    if(random(ODDS)<1)
    COL[ii]=random_text_color()
    
    
    //switch up fonts
    if(random(ODDS)<1){
    
    if(FONTsize=SMALL)
    FONT[ii]=random_font_small()
    
    if(FONTsize=MED)
    FONT[ii]=random_font_med()
    
    if(FONTsize=LARGE)
    FONT[ii]=random_font_large()
    
    }
    
    draw_set_font(FONT[ii])
    
    var ANG=0+random(3)-random(3);
    
    if not(FONT[ii]=global.RANSOMmed)
    if(argument6=true)
    draw_text_colour(PLACEx+Xslice+1,PLACEy+1,SLICE[ii],DARKpurple,DARKpurple,DARKpurple,DARKpurple,1)
    
    
    
    draw_text_colour(PLACEx+Xslice,PLACEy,SLICE[ii],COL[ii],COL[ii],COL[ii],COL[ii],1)
    

    ii+=1
    
    draw_set_color(c_white)
    
}

