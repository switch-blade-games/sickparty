//0= song
//1= ODDS
//2= MIN
//3= MAX

CHANNEL2=argument0
TIME2=audio_sound_length(argument0)
ODDS2=argument1
MIN2=argument2
MAX2=argument3
PITCH2=argument4
SLACK2=0

if (argument0 == -1)
    exit;

audio_play_sound(argument0,0,true);
audio_sound_gain(argument0,global.CFG[config.BGMgain],0);
audio_sound_set_track_position(argument0,random(TIME2));
audio_sound_pitch(argument0,1+random(PITCH2)-random(PITCH2));
