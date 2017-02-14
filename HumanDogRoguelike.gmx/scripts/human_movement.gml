player_input();

if (inputHorizontal != 0 || inputVertical != 0) {
    if(inputSprint) {
        multiplier = runningSpeed;
        movement = movement.walk;
        //TEMP
        can_shoot = true;
        /*
        var debris = instance_create(x,y,obj_bounce);
        debris.speed = random(3)+3;
        debris.direction = random(360);
        debris.velocity = random(3)+3;
        */
    } else {
        multiplier = walkingSpeed;
        movement = movement.walk;
    }
    inputDirection = point_direction(0,0,inputHorizontal,inputVertical);
    inputStrength = min(1,abs(inputHorizontal)+abs(inputVertical));
    velocity = inputStrength * multiplier;
    image_speed = inputStrength * ANIMATION * multiplier * 2;
    
    
    
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

//Just for fun
obj_draw_controller.paletteVal = gamepad_button_value(0, gp_shoulderrb);


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
            gamepad_set_vibration(player, triggerValue, triggerValue*0.5);
            alarm[1] = room_speed;
            obj_view_controller.screenShakeX = triggerValue*2;
            obj_view_controller.screenShakeY = triggerValue*2;
            obj_view_controller.alarm[0] = 10;
            //var aimDirection = point_direction(0,0,inputAimHorizontal,inputAimVertical);
            var bullet = instance_create(aimX,aimY, obj_bullet);
            bullet.owner = id;
            with(obj_shootable) {
                if(instance_place(x,y,obj_bullet))
                    script_execute(death,bullet);
                else
                    script_execute(react);
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

