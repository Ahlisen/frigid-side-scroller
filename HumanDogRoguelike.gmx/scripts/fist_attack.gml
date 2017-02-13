var tarOldY = argument0;

if(y+velocityY < tarOldY) {
    y += velocityY;
    velocityY += 0.2;
} else {
    if(!attacked) {
        y = tarOldY;
        velocityY = 0;
        var sfx = instance_create(x,y,obj_sfx);
        depth = -y;
        sfx.depth = depth-2;
        attacked = true;
        obj_view_controller.screenShakeX = 1;
        obj_view_controller.screenShakeY = 1;
        obj_view_controller.alarm[0] = 10;
    }
}
