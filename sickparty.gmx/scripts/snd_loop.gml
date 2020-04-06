/// snd_loop(snd,?volume,?pitch);

// argument[0] = sound id

// OPTIONAL ARGUMENTS
// argument[1] = pitch variance
// argument[2] = volume

var _pit = 0;
var _vol = 1;
var _snd = argument[0];
if (argument_count > 1)
    _pit = argument[1];
if (argument_count > 2)
    _vol = argument[2];

audio_stop_sound(_snd);
var _aud = audio_play_sound(_snd,0,true);
audio_sound_gain(_aud,global.CFG[config.SFXgain]*_vol,0);
audio_sound_pitch(_aud,1+random_range(-_pit,+_pit));
return(_aud);
