//0= song
//1= ODDS
//2= MIN
//3= MAX

CHANNEL3=argument0
TIME3=audio_sound_length(argument0)
ODDS3=argument1
MIN3=argument2
MAX3=argument3
PITCH3=argument4
SLACK3=0

if (argument[0] == -1)
    exit;

audio_play_sound(argument0,0,true);
audio_sound_gain(argument0,global.CFG[config.BGMgain],0);
audio_sound_set_track_position(argument0,random(TIME3))
audio_sound_pitch(argument0,1+random(PITCH3)-random(PITCH3))
