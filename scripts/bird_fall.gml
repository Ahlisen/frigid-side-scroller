image_angle += velocity;
    
if z-velocity > 0 {
    z -= velocity;
    velocity += GRAVITY;
} else {
    z = 0;
    velocity = 0;
    dead = true;
    state = do_nothing;
    image_speed = 0;
}
