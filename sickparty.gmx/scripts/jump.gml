on_ground = false;
yspeed = -8;

repeat(5)
    {
    var inst = instance_create(x+random_range(-8,8),y+16,obj_dust);
    inst.direction = choose(0,180)+random_range(-15,15);
    inst.speed = 4+random(2);
    }
