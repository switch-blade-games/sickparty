//0=sound
//1=loops

audio_stop_sound(argument[0]);

var _aud = audio_play_sound(argument[0],0,argument[1]);
audio_sound_gain(_aud,global.CFG[config.SFXgain],0);
