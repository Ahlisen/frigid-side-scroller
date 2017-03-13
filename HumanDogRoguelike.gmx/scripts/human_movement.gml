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
    //if(phy_position_y+verticalSpeed < view_hview[0]-20 && phy_position_y+verticalSpeed > view_hview[0]*0.7)
    phy_position_y += verticalSpeed*PERSPECTIVE;
    phy_position_x += horizontalSpeed;
} else {
    image_speed = ANIMATION;
    movement = movement.idle;
}


if ((inputAimHorizontal != 0 || inputAimVertical != 0)) {
    var triggerValue = gamepad_button_value(0, gp_shoulderrb);
    //var aimDirection = point_direction(0,0,inputAimHorizontal,inputAimVertical);
    //var aimStrength = min(1,abs(inputAimHorizontal)+abs(inputAimVertical));
    
    aimX = x+inputAimHorizontal*256;//lengthdir_x(16+256*aimStrength,aimDirection)//*(triggerValue+0.4);
    aimY = y+inputAimVertical*256;//lengthdir_y(16+256*aimStrength,aimDirection)//*(triggerValue+0.4);
    var aimBorder = 36;
    aimX = clamp(aimX,view_xview[0]+aimBorder,view_xview[0]+view_wview[0]-aimBorder);
    aimY = clamp(aimY,view_yview[0]+aimBorder,view_yview[0]+view_hview[0]-aimBorder);
    view_visible[1] = true;
    
    if(triggerValue > 0.95) {
        if(can_shoot) {
            gamepad_set_vibration(player, triggerValue, 0.5);
            alarm[0] = room_speed/2; //remove vibration
            obj_view_controller.screenShakeX = 1;
            obj_view_controller.screenShakeY = 1;
            obj_view_controller.alarm[0] = 6;
            //var aimDirection = point_direction(0,0,inputAimHorizontal,inputAimVertical);
            var bullet = instance_create(aimX,aimY, obj_bullet);
            bullet.owner = id;
            with(obj_shootable) {
                if(!dead){
                    if(instance_place(x,y,obj_bullet))
                        script_execute(onHit,bullet);
                    else
                        script_execute(react,other.id); //Send source of noise
                }
            }
            can_shoot = false;
            with(obj_wrap) {
                image_index = 1;
            }
            /*
            var dir = point_direction(x,y,aimX,aimY);
            var dist = distance_to_point(aimX,aimY);
            for(var i = 0; i <= dist; i+=1) {
                var _y = y+lengthdir_y(i,dir);//y/aimY*(x-i) +y;
                var _x = x+lengthdir_x(i,dir);
                part_particles_create(obj_particle_controller.partSystem,_x,_y,obj_particle_controller.smokeParticle,1);
            }*/
        }
    }
    movement = movement.aim;
} else {
    view_visible[1] = false;
}

