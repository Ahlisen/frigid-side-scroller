movement = movement.walk;
image_speed = ANIMATION;

if(target != noone){
    var angle = id+current_time*0.001;
    var targetPositionX = target.x + cos(angle)*48;
    var targetPositionY = target.y + sin(angle)*48*PERSPECTIVE;

    var velocity = 0.5;
    var newDir = point_direction(x,y,targetPositionX,targetPositionY);
    
    horizontalSpeed = lengthdir_x(velocity,newDir);
    verticalSpeed = lengthdir_y(velocity,newDir);
    
    phy_position_y += verticalSpeed*PERSPECTIVE;
    phy_position_x += horizontalSpeed;
    
    face = get_face(newDir);
}
