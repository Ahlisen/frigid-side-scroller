player_input();

if (inputHorizontal != 0 || inputVertical != 0) {
    if(inputSprint) {
        multiplier = runningSpeed;
        movement = movement.walk;
    } else {
        multiplier = walkingSpeed;
        movement = movement.walk;
    }
    inputDirection = point_direction(0,0,inputHorizontal,inputVertical);
    inputStrength = min(1,abs(inputHorizontal)+abs(inputVertical));
    velocity = inputStrength * multiplier;
    image_speed = inputStrength * ANIMATION * multiplier * 2;
    
    //Just for fun
    obj_draw_controller.blueVal = 1 + velocity;
    
    horizontalSpeed = lengthdir_x(velocity,inputDirection);
    verticalSpeed = lengthdir_y(velocity,inputDirection);
    if(phy_position_y+verticalSpeed < view_hview[0]-20 && phy_position_y+verticalSpeed > view_hview[0]*0.7)
        phy_position_y += verticalSpeed*PERSPECTIVE;
    phy_position_x += horizontalSpeed;
    
} else {
    image_speed = ANIMATION;
    movement = movement.idle;
}
