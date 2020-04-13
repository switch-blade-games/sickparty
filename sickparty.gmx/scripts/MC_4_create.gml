//0= song
//1= ODDS
//2= MIN
//3= MAX




CHANNEL4=argument0
TIME4=audio_sound_length(argument0)
ODDS4=argument1
MIN4=argument2
MAX4=argument3
PITCH4=argument4


SLACK4=0

if (argument0=-1)
exit

audio_play_sound(argument0,0,true)
audio_sound_set_track_position(argument0,random(TIME4))
audio_sound_pitch(argument0,1+random(PITCH4)-random(PITCH4))
