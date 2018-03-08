source = argument0;
target = source;
image_index = 0;
movement = movement.walk;
image_speed = ANIMATION*2;
dir = point_direction(source.x,source.y,x,y);
fear = fearLimit;

state = animal_fleeing;
