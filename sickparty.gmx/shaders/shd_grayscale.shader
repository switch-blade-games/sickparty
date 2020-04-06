attribute vec3 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
    {
    vec4 object_space_pos = vec4(in_Position.x,in_Position.y,in_Position.z,1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION]*object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
    }
//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
    {
    vec4 col = texture2D(gm_BaseTexture,v_vTexcoord);
    float val = sqrt(0.241*col.r*col.r + 0.691*col.g*col.g + 0.068*col.b*col.b);
    
    gl_FragColor = vec4(val,val,val,col.a);
    }
