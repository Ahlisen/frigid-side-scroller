var tarOldY = argument0;

if(y < tarOldY)
    y += 4;
else {
    if(!attacked) {
        var sfx = instance_create(x,y,obj_sfx);
        sfx.depth = depth-1;
        attacked = true;
        obj_view_controller.screenShakeX = 1;
        obj_view_controller.screenShakeY = 1;
        obj_view_controller.alarm[0] = 10;
    }
}
