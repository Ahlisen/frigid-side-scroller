if(z - velocity > 0) {
    z -= velocity;
    velocity += GRAVITY;
} else {
    if(!attacked) {
        image_index = 1;
        velocity = 0;
        z = 0;
        var sfx = instance_create(x,y,obj_sfx);
        depth = -y-2;
        sfx.depth = depth-2;
        attacked = true;
        obj_view_controller.screenShakeX = 1;
        obj_view_controller.screenShakeY = 1;
        obj_view_controller.alarm[0] = 10;
        repeat(4) {
            var debris = instance_create(x,y,obj_bounce);
            debris.speed = random(3)+3;
            debris.direction = random(360);
            debris.velocity = random(5)+1;
            part_particles_create(obj_particle_controller.partSystem,x+random(8)-4,y+random(8)-4,obj_particle_controller.fogParticle,1);
        }
        with(obj_shootable) {
            if(!dead){
                if(instance_place(x,y,other))
                    script_execute(onHit,other);
                else
                    script_execute(react);
            }
        }
    }
}
