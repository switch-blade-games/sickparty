var muzzle_y = gun_y;

// check if we can fire
var fire = false;
if (input_fire and weapon_auto[cur_weapon])
or (input_fire_pressed)
    {
    if (shoot_timer == 0)
        {
        if (weapon_pmax[cur_weapon] == -1)
        or (instance_number(weapon_proj[cur_weapon]) <= weapon_pmax[cur_weapon])
            fire = true;
        }
    }
if (!fire)
    exit;

shoot_timer = weapon_time[cur_weapon];

// flame thrower aim angle
if (cur_weapon == weapon.flame)
    var ang = flame_ang;
else
    {
    // aim angles based on number of projectiles
    if (weapon_pnum[cur_weapon] == 1)
        var ang = aim;
    else if (weapon_pnum[cur_weapon] == 2)
        var ang = aim-(weapon_sprd[cur_weapon]/2);
    else if (weapon_pnum[cur_weapon] > 2)
        var ang = aim - weapon_sprd[cur_weapon]*floor(weapon_pnum[cur_weapon]/2);
    }

// create the projectile(s)
repeat(weapon_pnum[cur_weapon])
    {
    // aim vector
    var ldx = lengthdir_x(1,ang);
    var ldy = lengthdir_y(1,ang);
    
    switch(cur_weapon)
        {
        case weapon.flame:
            var inst = instance_create(x+ldx*16,y+muzzle_y+ldy*16,weapon_proj[cur_weapon]);
            inst.direction = ang;
            inst.speed = weapon_pspd[cur_weapon];
            break;
        case weapon.rollingCutter:
        case weapon.rollingStone:
            var inst = instance_create(x+ldx*16,y+muzzle_y+ldy*16,weapon_proj[cur_weapon]);
            inst.xspeed = ldx*weapon_pspd[cur_weapon];
            inst.yspeed = ldy*weapon_pspd[cur_weapon];
            inst.roll_dir = face;
            break;
        case weapon.spinFlame:
            var inst = instance_create(x+ldx*16,y+muzzle_y+ldy*16,weapon_proj[cur_weapon]);
            inst.ldx = ldx*weapon_pspd[cur_weapon];
            inst.ldy = ldy*weapon_pspd[cur_weapon];
            break;
        default:
            var inst = instance_create(x+ldx*16,y+muzzle_y+ldy*16,weapon_proj[cur_weapon]);
            inst.direction = ang;
            inst.speed = weapon_pspd[cur_weapon];
            inst.image_angle = ang;
            break;
        }
    
    ang += weapon_sprd[cur_weapon];
    }

// aim vector
var ldx = lengthdir_x(1,aim);
var ldy = lengthdir_y(1,aim);

if (weapon_case[cur_weapon] >= 0)
    {
    // bullet/shell casing
    var inst = instance_create(x+ldx*12,y+muzzle_y+ldy*12,obj_casing);
    if (face > 0)
        inst.direction = aim+random_range(130,160);
    else
        inst.direction = aim-random_range(130,160);
    inst.speed = 4+random(2);
    inst.image_speed = 0;
    inst.image_index = weapon_case[cur_weapon];
    }

if (global.CFG[config.particles])
    {
    // smoke
    repeat(3)
        {
        var inst = instance_create(x+ldx*12,y+muzzle_y+ldy*12,obj_dust);
        inst.direction = aim+random_range(-15,15);
        inst.speed = 6+random(2);
        inst.friction = 0.8;
        inst.image_xscale *= 0.5;
        inst.image_yscale *= 0.5;
        inst.fade = 0.1;
        }
    }

// sound
snd_play_3d(x,y,weapon_snd[cur_weapon],0.5,1);
