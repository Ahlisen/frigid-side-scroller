if(debug){
    key_hor = keyboard_check(ord('D')) - keyboard_check(ord('A'));
    key_vert = keyboard_check(ord('S')) - keyboard_check(ord('W'));
    key_groundpound = keyboard_check_pressed(vk_numpad0);
    key_groundpound_re = keyboard_check_released(vk_numpad0);
    key_punch = keyboard_check_pressed(vk_numpad1);
    key_punch_re = keyboard_check_released(vk_numpad1);
    //key_roll = keyboard_check_pressed(vk_numpad5);
    //key_throw = keyboard_check_pressed(ord('R'));
    key_pickup = keyboard_check_pressed(vk_numpad2);
} else {
    gamepad_set_axis_deadzone(player, .25);
    key_hor = gamepad_axis_value(player, gp_axislh);
    key_vert = gamepad_axis_value(player, gp_axislv);
    //key_roll = gamepad_button_check_pressed(player,gp_face4); //check inv
    //key_punch = gamepad_button_check_pressed(player,gp_shoulderr);
    //key_punch_re = gamepad_button_check_released(player,gp_shoulderr);
    //key_groundpound = gamepad_button_check_pressed(player,gp_face1);
    //key_groundpound_re = gamepad_button_check_released(player,gp_face1);
    //key_throw = gamepad_button_check_pressed(player,gp_shoulderrb);
    //key_pickup = gamepad_button_check_pressed(player,gp_shoulderl);
}
