//argument0 = text
//argument1 = size (1=SMALL, 2=MED, 3=LARGE)

SMALL=1
MED=2
LARGE=3

//word_hoard()

MYtext=argument0

//assign a starting color for each letter

var i=0;

FONTsize=argument1

repeat(string_length(MYtext)){

    COL[i]=random_text_color()
    
    CLIP[i]=random(sprite_get_number(color_clip_spr))
    
    if(FONTsize=1)
    FONT[i]=random_font_small()
    
    if(FONTsize=2)
    FONT[i]=random_font_med()
    
    if(FONTsize=3)
    FONT[i]=random_font_large()
    
    
    i+=1
}



