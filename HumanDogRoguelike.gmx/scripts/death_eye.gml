if(vulnerable) {
    owner.target = argument0.owner;
    owner.xPercentOnScreen = random(0.8)+0.1
    owner.hp--;
    with(owner) {
        for(var i = 0; i < bodyparts; i++) {
            fists[i].state = fist_orbit;
            fists[i].arg0 = noone;
            fists[i].timeline_running = false;
            fists[i].attacked = false;
        }
    }
    if(owner.hp <= 0) {
        with(owner) {
            script_execute(death_boss);
        }
    }
    instance_destroy();
}
