/// config_init();

global.CFGversion = 9;
global.CFGfile = working_directory+"config.ini";
global.CFGsurf = working_directory+"pause.dat";

////////////////////////////////////////////////////////

// === enums ===

enum config
    {
    // video
    fullscreen,
    windowScale,
    vsync,
    CRTeffect,
    particles,
    // audio
    BGMgain,
    SFXgain,
    // player 1 keyboard controls
    keyL1,
    keyR1,
    keyU1,
    keyD1,
    keyFire1,
    keyJump1,
    keyLock1,
    keySwap1,
    // player 2 keyboard controls
    keyL2,
    keyR2,
    keyU2,
    keyD2,
    keyFire2,
    keyJump2,
    keyLock2,
    keySwap2,
    // player 1 gamepad controls
    padL1,
    padR1,
    padU1,
    padD1,
    padFire1,
    padJump1,
    padLock1,
    padSwap1,
    // player 2 gamepad controls
    padL2,
    padR2,
    padU2,
    padD2,
    padFire2,
    padJump2,
    padLock2,
    padSwap2,
    // pad style
    padType,
    size
    }

// video
global.CFGtag[config.fullscreen] = "fullscreen";
global.CFGtag[config.windowScale] = "windowScale";
global.CFGtag[config.vsync] = "vsync";
global.CFGtag[config.CRTeffect] = "CRTeffect";
global.CFGtag[config.particles] = "particles";
// audio
global.CFGtag[config.BGMgain] = "BGMgain";
global.CFGtag[config.SFXgain] = "SFXgain";
// player 1 keyboard controls
global.CFGtag[config.keyL1] = "keyL1";
global.CFGtag[config.keyR1] = "keyR1";
global.CFGtag[config.keyU1] = "keyU1";
global.CFGtag[config.keyD1] = "keyD1";
global.CFGtag[config.keyFire1] = "keyFire1";
global.CFGtag[config.keyJump1] = "keyJump1";
global.CFGtag[config.keyLock1] = "keyLock1";
global.CFGtag[config.keySwap1] = "keySwap1";
// player 2 keyboard controls
global.CFGtag[config.keyL2] = "keyL2";
global.CFGtag[config.keyR2] = "keyR2";
global.CFGtag[config.keyU2] = "keyU2";
global.CFGtag[config.keyD2] = "keyD2";
global.CFGtag[config.keyFire2] = "keyFire2";
global.CFGtag[config.keyJump2] = "keyJump2";
global.CFGtag[config.keyLock2] = "keyLock2";
global.CFGtag[config.keySwap2] = "keySwap2";
// player 1 gamepad controls
global.CFGtag[config.padL1] = "padL1";
global.CFGtag[config.padR1] = "padR1";
global.CFGtag[config.padU1] = "padU1";
global.CFGtag[config.padD1] = "padD1";
global.CFGtag[config.padFire1] = "padFire1";
global.CFGtag[config.padJump1] = "padJump1";
global.CFGtag[config.padLock1] = "padLock1";
global.CFGtag[config.padSwap1] = "padSwap1";
// player 2 gamepad controls
global.CFGtag[config.padL2] = "padL2";
global.CFGtag[config.padR2] = "padR2";
global.CFGtag[config.padU2] = "padU2";
global.CFGtag[config.padD2] = "padD2";
global.CFGtag[config.padFire2] = "padFire2";
global.CFGtag[config.padJump2] = "padJump2";
global.CFGtag[config.padLock2] = "padLock2";
global.CFGtag[config.padSwap2] = "padSwap2";
// pad style
global.CFGtag[config.padType] = "padType";

////////////////////////////////////////////////////////

// config string to index
global.CFGmap = ds_map_create();
for(var i=0; i<config.size; i++;)
    global.CFGmap[?global.CFGtag[i]] = i;

config_default();
