//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

varying vec2 FragCoord;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
    
    FragCoord = in_Position.xy;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float palette;
uniform sampler2D paletteTexture;
uniform vec4 pal_uvs;

varying vec2 FragCoord;
uniform vec2 resolution;
/*
vec4 circle(vec2 uv, vec2 pos, float rad, vec3 col) {
	float d = length(pos - uv) - rad;
	float t = clamp(d, 0.0, 1.0);
	return vec4(col, 1.0 - t);
}
//circle(uvs,center,radius,vec3(0.0,1.0,1.0));
*/
void main()
{
    vec2 uv = v_vTexcoord.xy;
    vec4 col = texture2D(gm_BaseTexture, vec2(uv.x, uv.y));
    float range = pal_uvs.z - pal_uvs.x;
    float pal_r = (pal_uvs.w - pal_uvs.y)/6.0;
    
    //binary color switch
    //vec4 col_new = texture2D(paletteTexture, vec2(pal_uvs.x+col.r*range, pal_uvs.y+palette*pal_r));
    
    //granular color switch
    vec4 col_new = texture2D(paletteTexture, vec2(pal_uvs.x+col.r*range, pal_uvs.y+pal_r*palette));
    vec4 col_newer = texture2D(paletteTexture, vec2(pal_uvs.x+col.r*range, pal_uvs.y+pal_r*(palette+1.0)));
    float modu = mod(palette,1.0);
    //col_new.rgb = mix(col_new.rgb,col_newer.rgb,modu);
    
    //gl_FragColor = col_new;//v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );

    float radius = 1.0 * resolution.y;
    vec2 center = resolution.xy;
    
    vec2 p = (FragCoord.xy - center) / radius;
    float r = sqrt(dot(p, p));
    gl_FragColor = mix(col_new,col_newer,r);

}

//https://www.opengl.org/discussion_boards/showthread.php/174460-Draw-circle-in-shader
//https://www.shadertoy.com/view/XsjGDt
//vec2 center = v_vTexcoord - vec2(0.5,0.5);
//float radius = 50.0;
    //float radiuss = min(FragCoord.x, FragCoord.y) * radius;
    //float dist = length(gl_FragCoord.xy - center);
