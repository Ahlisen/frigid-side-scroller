///get_face(direction)
var dir = argument[0];

var face = floor(dir/90);

if (face = 4) face = 3;

if (face == 1 || face == 2) image_xscale = -1; else image_xscale = 1;

if(face == 1) face = 0;
if(face == 3) face = 2;

return face
