//CHANNEL1

if not(CHANNEL1=-1){


//add time
SLACK1+=1

var CUT=false;

if(SLACK1>=MAX1)
CUT=true

if(random(ODDS1)<1)
CUT=true

if(SLACK1<MIN1)
CUT=false

    
    
    //perform cut
    
    if(CUT=true)
    {
    audio_stop_sound(CHANNEL1)
    audio_play_sound(CHANNEL1,0,true)
    audio_sound_pitch(CHANNEL1,1+random(PITCH1)-random(PITCH1))

    audio_sound_set_track_position(CHANNEL1,random(TIME1))

    SLACK1=0
    }

}
