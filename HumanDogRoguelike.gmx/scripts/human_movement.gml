player_input();

if (inputHorizontal != 0 || inputVertical != 0) {
    if(inputSprint) {
        multiplier = runningSpeed;
        movement = movement.idle;
    } else {
        multiplier = walkingSpeed;
        movement = movement.walk;
    }
    inputDirection = point_direction(0,0,inputHorizontal,inputVertical);
    inputStrength = min(1,abs(inputHorizontal)+abs(inputVertical));
    velocity = inputStrength * multiplier;
    image_speed = inputStrength * ANIMATION;
    
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

if (inputAimHorizontal != 0 || inputAimVertical != 0) {
    var triggerValue = gamepad_button_value(0, gp_shoulderrb);
    aimX = x+128*inputAimHorizontal;
    aimY = y+128*inputAimVertical;
    aimY = min(aimY,y-16);
    view_visible[1] = true;
    
    if(triggerValue > 0.9) {
        if(can_shoot) {
            gamepad_set_vibration(player, triggerValue, triggerValue);
            obj_view_controller.screenShakeX = triggerValue*4;
            obj_view_controller.screenShakeY = triggerValue*4;
            obj_view_controller.alarm[0] = 10;
            /*var aimDirection = point_direction(0,0,inputAimHorizontal,inputAimVertical);
            var bullet = instance_create(x,y-sprite_yoffset, obj_bullet);
            bullet.direction = aimDirection;
            //bullet.image_angle = bullet.direction;
            bullet.speed = 8;*/
            //can_shoot = false;
            with(obj_wrap) {
                image_index = 1;
            }
        }
    } else {
        gamepad_set_vibration(player, 0, 0);
    }
    movement = movement.aim;
} else {
    view_visible[1] = false;
}

