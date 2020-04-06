/// config_default();

// video
global.CFG[config.fullscreen] = false;
global.CFG[config.windowScale] = 2;
global.CFG[config.vsync] = 0;
global.CFG[config.CRTeffect] = 0;
global.CFG[config.particles] = false;
// audio
global.CFG[config.BGMgain] = 0.75;
global.CFG[config.SFXgain] = 0.75;
// player 1 keyboard controls
global.CFG[config.keyL1] = vk_left;
global.CFG[config.keyR1] = vk_right;
global.CFG[config.keyU1] = vk_up;
global.CFG[config.keyD1] = vk_down;
global.CFG[config.keyFire1] = ord("Z");
global.CFG[config.keyJump1] = ord("X");
global.CFG[config.keyLock1] = vk_shift;
global.CFG[config.keySwap1] = ord("C");
// player 2 keyboard controls
global.CFG[config.keyL2] = vk_numpad4;
global.CFG[config.keyR2] = vk_numpad6;
global.CFG[config.keyU2] = vk_numpad8
global.CFG[config.keyD2] = vk_numpad5;
global.CFG[config.keyFire2] = vk_control;
global.CFG[config.keyJump2] = vk_numpad0;
global.CFG[config.keyLock2] = vk_add;
global.CFG[config.keySwap2] = vk_numpad7;
// player 1 gamepad controls
global.CFG[config.padL1] = gpinput.padl;
global.CFG[config.padR1] = gpinput.padr;
global.CFG[config.padU1] = gpinput.padu;
global.CFG[config.padD1] = gpinput.padd;
global.CFG[config.padFire1] = gpinput.face3;
global.CFG[config.padJump1] = gpinput.face1;
global.CFG[config.padLock1] = gpinput.bumpr;
global.CFG[config.padSwap1] = gpinput.face4;
// player 2 gamepad controls
global.CFG[config.padL2] = gpinput.padl;
global.CFG[config.padR2] = gpinput.padr;
global.CFG[config.padU2] = gpinput.padu;
global.CFG[config.padD2] = gpinput.padd;
global.CFG[config.padFire2] = gpinput.face3;
global.CFG[config.padJump2] = gpinput.face1;
global.CFG[config.padLock2] = gpinput.bumpr;
global.CFG[config.padSwap2] = gpinput.face4;
// gamepad button style
global.CFG[config.padType] = true;
