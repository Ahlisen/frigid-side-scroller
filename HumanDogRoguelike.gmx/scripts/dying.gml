movement = movement.knockdown;
image_speed = ANIMATION;

if(animation_hit_frame(image_number-1)) {
    state = do_nothing;
    dead = true;
    image_speed = 0;
    image_index = image_number-1;
}
