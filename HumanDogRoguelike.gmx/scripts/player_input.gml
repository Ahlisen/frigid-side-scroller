if(!gamepad_is_connected(player)){
    inputHorizontal = keyboard_check(ord('D')) - keyboard_check(ord('A'));
    inputVertical = keyboard_check(ord('S')) - keyboard_check(ord('W'));
    inputSprint = keyboard_check_pressed(vk_numpad0);
} else {
    gamepad_set_axis_deadzone(player, .25);
    inputHorizontal = gamepad_axis_value(player, gp_axislh);
    inputVertical = gamepad_axis_value(player, gp_axislv);
    inputAimHorizontal = gamepad_axis_value(player, gp_axisrh);
    inputAimVertical = gamepad_axis_value(player, gp_axisrv);
    inputSprint = gamepad_button_check(player,gp_face1);
    //key_roll = gamepad_button_check_pressed(player,gp_face4); //check inv
    //key_punch = gamepad_button_check_pressed(player,gp_shoulderr);
    //key_punch_re = gamepad_button_check_released(player,gp_shoulderr);
    //key_groundpound = gamepad_button_check_pressed(player,gp_face1);
    //key_groundpound_re = gamepad_button_check_released(player,gp_face1);
    //key_throw = gamepad_button_check_pressed(player,gp_shoulderrb);
    //key_pickup = gamepad_button_check_pressed(player,gp_shoulderl);
}
