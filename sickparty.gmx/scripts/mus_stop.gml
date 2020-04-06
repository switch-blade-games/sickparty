/// mus_stop();

if (audio_exists(global.music))
    audio_stop_sound(global.music);
global.music = -1;
