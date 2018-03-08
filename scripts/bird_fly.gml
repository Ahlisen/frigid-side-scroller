///bird_fly
var dirX = lengthdir_x(speed, direction);
x += dirX
y += lengthdir_y(speed, direction)*PERSPECTIVE;
//image_angle = point_direction(dirX, velocity,x,z);

if z > view_hview[0]*3
    instance_destroy();
    
if z-velocity > 0 {
    z -= velocity;
    velocity += GRAVITY;
} else {
    z = 0;
    velocity = 0;
}
    
if(alarm[1] == -1 && !weakened) {
    if(velocity > -2) {
        velocity -= 4+velocity/2;
    }
    alarm[1] = random(6)+room_speed*0.1;
}
