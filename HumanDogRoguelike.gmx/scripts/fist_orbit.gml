var tarX = owner.x + cos(offset+current_time*0.001)*owner.radius;
var tarY = owner.y + sin(offset+current_time*0.001)*16;
x += (tarX - x)*0.05;
y += (tarY - y)*0.1;
