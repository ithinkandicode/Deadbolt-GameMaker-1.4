//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.	
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}


//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;
varying vec4 v_vColour;
void main()
{
    vec4 col = texture2D(gm_BaseTexture, v_vTexcoord);
    vec3 lum = vec3(0.299, 0.587, 0.114);
    float gray = dot(col.xyz, lum);
    gl_FragColor = vec4((gray + col.r) * 0.5, (gray + col.g) * 0.5, (gray + col.b) * 0.5, col.a * v_vColour.a);
}

