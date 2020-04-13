//0= song
//1= ODDS
//2= MIN
//3= MAX
//4= PITCH (no more than 1)




CHANNEL1=argument0
TIME1=audio_sound_length(argument0)
ODDS1=argument1
MIN1=argument2
MAX1=argument3

PITCH1=argument4


SLACK1=0

if (argument0=-1)
exit

audio_play_sound(argument0,0,true)
audio_sound_set_track_position(argument0,random(TIME1))
audio_sound_pitch(argument0,1+random(PITCH1)-random(PITCH1))
