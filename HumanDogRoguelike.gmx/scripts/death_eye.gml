if(vulnerable) {
    owner.target = argument0.owner;
    owner.xPercentOnScreen = random(0.8)+0.1
    owner.hp--;
    if(owner.hp <= 0) {
        with(owner) {
            script_execute(death);
        }
    }
    instance_destroy();
}
