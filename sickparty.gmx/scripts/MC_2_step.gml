//CHANNEL1

if not(CHANNEL2=-1){


//add time
SLACK2+=1

var TRIG=false;

if(SLACK2>=MAX2)
TRIG=true

    if(random(ODDS2)<1)
    or
    TRIG=true
    and
    SLACK2<MIN2
    
    
    //perform cut
    {
    audio_stop_sound(CHANNEL2)
    audio_play_sound(CHANNEL2,0,true)
    
    audio_sound_pitch(CHANNEL2,1+random(PITCH2)-random(PITCH2))

    audio_sound_set_track_position(CHANNEL2,random(TIME2))

    SLACK2=0
    }

}
