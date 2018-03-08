for(var i = 0; i<bodyparts; i++) {
    with(fists[i]) {
        dead = true
        state = bird_fall;
        timeline_running = false;
        instance_destroy();
    }
}
instance_destroy();
//state = bird_fall;
