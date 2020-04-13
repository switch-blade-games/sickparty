//CHANNEL1

if not(CHANNEL4=-1){


//add time
SLACK4+=1

var TRIG=false;

if(SLACK4>=MAX4)
TRIG=true

    if(random(ODDS4)<1)
    or
    TRIG=true
    and
    SLACK4<MIN4
    
    
    //perform cut
    {
    audio_stop_sound(CHANNEL4)
    audio_play_sound(CHANNEL4,0,true)
    
    audio_sound_pitch(CHANNEL4,1+random(PITCH4)-random(PITCH4))

    audio_sound_set_track_position(CHANNEL4,random(TIME4))

    SLACK4=0
    }

}
