//CHANNEL1

if not(CHANNEL3=-1){


//add time
SLACK3+=1

var TRIG=false;

if(SLACK3>=MAX3)
TRIG=true

    if(random(ODDS3)<1)
    or
    TRIG=true
    and
    SLACK3<MIN3
    
    
    //perform cut
    {
    audio_stop_sound(CHANNEL3)
    audio_play_sound(CHANNEL3,0,true)
    
    audio_sound_pitch(CHANNEL3,1+random(PITCH3)-random(PITCH3))

    audio_sound_set_track_position(CHANNEL3,random(TIME3))

    SLACK3=0
    }

}
