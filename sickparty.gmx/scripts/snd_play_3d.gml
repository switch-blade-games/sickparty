/// snd_play_3d(x,y,snd,?pitch,?volume);

// argument[0] = x position of sound
// argument[1] = y position of sound
// argument[2] = sound id

// OPTIONAL ARGUMENTS
// argument[3] = pitch variance
// argument[4] = volume

var _sx = argument[0];
var _sy = argument[1];

var _pit = 0;
var _vol = 1;
var _snd = argument[2];
if (argument_count > 3)
    _pit = argument[3];
if (argument_count > 4)
    _vol = argument[4];

audio_stop_sound(_snd);
var _aud = audio_play_sound_at(_snd,_sx,_sy,0,global.FODmin,global.FODmax,1,false,0);
audio_sound_gain(_aud,global.CFG[config.SFXgain]*_vol,0);
audio_sound_pitch(_aud,1+random_range(-_pit,+_pit));
return(_aud);
