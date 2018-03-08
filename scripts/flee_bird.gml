speed = random(2)+4;
direction = choose(random(90)-45,random(90)+135);
if(direction > 90 && direction < 270)
    image_xscale = -1;
image_speed = ANIMATION*4;
state = bird_fly;
