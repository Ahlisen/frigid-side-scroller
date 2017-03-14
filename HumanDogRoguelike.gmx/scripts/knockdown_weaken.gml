if(weakened) {
    //death_basic();
} else {
    state = do_nothing;
    //weakened = true;
    alarm[1] = room_speed*2;
    movement = movement.knockdown;
    obj_display_manager.paletteVal = 6;
    obj_display_manager.alarm[2]=1;
}
part_particles_create(obj_particle_controller.partSystem,x,y,obj_particle_controller.bloodParticle,150);
