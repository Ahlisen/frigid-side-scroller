speed = random(3)+5;
direction = random(360);
if(direction > 90 && direction < 270)
    image_xscale = -1;
image_speed = ANIMATION*4;
state = bird_fly;
