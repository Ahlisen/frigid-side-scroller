player_input();

if (inputHorizontal != 0 || inputVertical != 0) {
    if(inputSprint) {
        multiplier = runningSpeed;
        movement = movement.walk;
        //TEMP
        can_shoot = true;
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
    //BUG: cant get out if push down by physics
    if(phy_position_y+verticalSpeed < view_hview[0]-20 && phy_position_y+verticalSpeed > view_hview[0]*0.7)
        phy_position_y += verticalSpeed*PERSPECTIVE;
    phy_position_x += horizontalSpeed;
    
} else {
    image_speed = ANIMATION;
    movement = movement.idle;
}

if (inputAimHorizontal != 0 || inputAimVertical != 0) {
    var triggerValue = gamepad_button_value(0, gp_shoulderrb);
    aimX = x+256*inputAimHorizontal//*(triggerValue+0.4);
    aimY = y+256*inputAimVertical//*(triggerValue+0.4);
    var aimBorder = 36;
    aimX = clamp(aimX,view_xview[0]+aimBorder,view_xview[0]+view_wview[0]-aimBorder);
    aimY = clamp(aimY,view_yview[0]+aimBorder,view_yview[0]+view_hview[0]-aimBorder);
    view_visible[1] = true;
    
    if(triggerValue > 0.95) {
        if(can_shoot) {
            gamepad_set_vibration(player, triggerValue, triggerValue);
            alarm[1] = room_speed;
            obj_view_controller.screenShakeX = triggerValue*4;
            obj_view_controller.screenShakeY = triggerValue*4;
            obj_view_controller.alarm[0] = 10;
            //var aimDirection = point_direction(0,0,inputAimHorizontal,inputAimVertical);
            var bullet = instance_create(aimX,aimY, obj_bullet);
            with(obj_shootable) {
                if(instance_place(x,y,obj_bullet))
                    script_execute(death);
                else
                    script_execute(flee);
            }
            can_shoot = false;
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

