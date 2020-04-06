/// mus_loop(snd);

// argument[0] = sound id

var _snd = argument[0];

if (audio_exists(global.music))
    audio_stop_sound(global.music);

global.music = audio_play_sound(_snd,0,true);
audio_sound_gain(global.music,global.CFG[config.BGMgain],0);
return(global.music);
