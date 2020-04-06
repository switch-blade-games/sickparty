/// input();

input_left  = false;
input_right = false;
input_up    = false;
input_down  = false;
input_fire  = false;
input_jump  = false;
input_lock  = false;
input_swap  = false;

input_left_pressed  = false;
input_right_pressed = false;
input_up_pressed    = false;
input_down_pressed  = false;
input_fire_pressed  = false;
input_jump_pressed  = false;
input_lock_pressed  = false;
input_swap_pressed  = false;

if (slot <= 0)
    {
    var _keyL = global.CFG[config.keyL1];
    var _keyR = global.CFG[config.keyR1];
    var _keyU = global.CFG[config.keyU1];
    var _keyD = global.CFG[config.keyD1];
    var _keyFire = global.CFG[config.keyFire1];
    var _keyJump = global.CFG[config.keyJump1];
    var _keyLock = global.CFG[config.keyLock1];
    var _keySwap = global.CFG[config.keySwap1];
    
    var _padL = global.CFG[config.padL1];
    var _padR = global.CFG[config.padR1];
    var _padU = global.CFG[config.padU1];
    var _padD = global.CFG[config.padD1];
    var _padFire = global.CFG[config.padFire1];
    var _padJump = global.CFG[config.padJump1];
    var _padLock = global.CFG[config.padLock1];
    var _padSwap = global.CFG[config.padSwap1];
    }
else if (slot == 1)
    {
    var _keyL = global.CFG[config.keyL2];
    var _keyR = global.CFG[config.keyR2];
    var _keyU = global.CFG[config.keyU2];
    var _keyD = global.CFG[config.keyD2];
    var _keyFire = global.CFG[config.keyFire2];
    var _keyJump = global.CFG[config.keyJump2];
    var _keyLock = global.CFG[config.keyLock2];
    var _keySwap = global.CFG[config.keySwap2];
    
    var _padL = global.CFG[config.padL2];
    var _padR = global.CFG[config.padR2];
    var _padU = global.CFG[config.padU2];
    var _padD = global.CFG[config.padD2];
    var _padFire = global.CFG[config.padFire2];
    var _padJump = global.CFG[config.padJump2];
    var _padLock = global.CFG[config.padLock2];
    var _padSwap = global.CFG[config.padSwap2];
    }

input_left  = keyboard_check(_keyL);
input_right = keyboard_check(_keyR);
input_up    = keyboard_check(_keyU);
input_down  = keyboard_check(_keyD);
input_fire  = keyboard_check(_keyFire);
input_jump  = keyboard_check(_keyJump);
input_lock  = keyboard_check(_keyLock);
input_swap  = keyboard_check(_keySwap);

input_left_pressed  = keyboard_check_pressed(_keyL);
input_right_pressed = keyboard_check_pressed(_keyR);
input_up_pressed    = keyboard_check_pressed(_keyU);
input_down_pressed  = keyboard_check_pressed(_keyD);
input_fire_pressed  = keyboard_check_pressed(_keyFire);
input_jump_pressed  = keyboard_check_pressed(_keyJump);
input_lock_pressed  = keyboard_check_pressed(_keyLock);
input_swap_pressed  = keyboard_check_pressed(_keySwap);

if (slot >= 0) and (slot <= 1)
    {
    input_left  = input_left    or gamepad_check(slot,_padL);
    input_right = input_right   or gamepad_check(slot,_padR);
    input_up    = input_up      or gamepad_check(slot,_padU);
    input_down  = input_down    or gamepad_check(slot,_padD);
    input_fire  = input_fire    or gamepad_check(slot,_padFire);
    input_jump  = input_jump    or gamepad_check(slot,_padJump);
    input_lock  = input_lock    or gamepad_check(slot,_padLock);
    input_swap  = input_swap    or gamepad_check(slot,_padSwap);
    
    input_left_pressed  = input_left_pressed    or gamepad_check_pressed(slot,_padL);
    input_right_pressed = input_right_pressed   or gamepad_check_pressed(slot,_padR);
    input_up_pressed    = input_up_pressed      or gamepad_check_pressed(slot,_padU);
    input_down_pressed  = input_down_pressed    or gamepad_check_pressed(slot,_padD);
    input_fire_pressed  = input_fire_pressed    or gamepad_check_pressed(slot,_padFire);
    input_jump_pressed  = input_jump_pressed    or gamepad_check_pressed(slot,_padJump);
    input_lock_pressed  = input_lock_pressed    or gamepad_check_pressed(slot,_padLock);
    input_swap_pressed  = input_swap_pressed    or gamepad_check_pressed(slot,_padSwap);
    }

if (input_left+input_right+input_up+input_down+input_fire+input_swap+input_jump == 0)
    wait++;
else
    wait = 0;
