bodyparts = 3;
hp = bodyparts;
onHit = do_nothing;
react = do_nothing;
state = boss_state_hover;

for(var i = 0; i < bodyparts; i++) {
    eyes[i] = instance_create(x,y,obj_boss_eye);
    eyes[i].owner = id;
    eyes[i].angle = random(20*i)+(360/bodyparts)*i;
    eyes[i].offset = random(8)+28;
    
    fists[i] = instance_create(x,y,obj_boss_fist);
    fists[i].owner = id;
    fists[i].offset = i*pi*(2/bodyparts);
}

radius = 64;
orbitSpeed = 0.001;
realX = x;
realZ = z;
xPercentOnScreen = 0.8;

target = choose(obj_human, obj_dog);
bodyIndex = 0;
alarm[0] = room_speed*3;
pattern[0] = 45;
pattern[1] = 90;
patternIndex = 0;

image_index = 1;

