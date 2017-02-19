if(weakened) {
    //death_basic();
} else {
    state = do_nothing;
    weakened = true;
    alarm[1] = room_speed*2;
    movement = movement.knockdown;
}
