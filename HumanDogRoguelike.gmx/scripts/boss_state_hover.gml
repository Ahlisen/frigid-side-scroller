image_angle += 0.5;
depth = -y;
var change = sin(current_time*0.001);
//radius = change*16+80;
//orbitSpeed = change*0.001;
realX += ((view_xview[0]+view_wview[0]*xPercentOnScreen) - x)*0.02;
realZ += ((view_hview[0]/2) - z)*0.02;

z = realZ + change*8;
x = realX;
