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


//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    vec4 col = texture2D( gm_BaseTexture, v_vTexcoord );
    float brightness = 0.34 * col.r + 0.5 * col.g + 0.16 * col.b;
if (brightness > 0.4) { //lightest
        col.rgb = vec3(226.0/255.0, 113.0/255.0, 29.0/255.0);
    }
    else if (brightness > 0.3) { //medium
        col.rgb = vec3(184.0/255.0, 90.0/255.0, 29.0/255.0);
    }
    else if (brightness > 0.2) { //darkest
        col.rgb = vec3(160.0/255.0, 40.0/255.0, 27.0/255.0);
    }
    else {
        col.a = 0.0;
    }
    gl_FragColor = v_vColour * col;
}

//0.33 R + 0.5 G + 0.16 B
    /*else if (brightness < 0.9) {
        col.rgb = vec3(51.0/255.0, 71.0/255.0, 75.0/255.0);
        //col.a = 0.4;
    }*/
        /*else if (brightness < 1.0) {
        col.rgb = vec3(51.0/255.0, 71.0/255.0, 75.0/255.0);
        //col.a = 0.4;
    }*/

