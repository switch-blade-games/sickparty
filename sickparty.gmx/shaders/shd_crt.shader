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

//######################_==_YOYO_SHADER_MARKER_==_######################@~uniform float strength;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
    {
    // squared distance from the center
    vec2 uv = v_vTexcoord;
    vec2 dc = abs(0.5-uv);
    dc *= dc;
    
    // warp the fragment coordinates
    uv.x -= 0.5; uv.x *= 1.0+(dc.y*(0.3*strength)); uv.x += 0.5;
    uv.y -= 0.5; uv.y *= 1.0+(dc.x*(0.4*strength)); uv.y += 0.5;
    
    // sample inside boundaries, otherwise set to black
    if (uv.y > 1.0 || uv.x < 0.0 || uv.x > 1.0 || uv.y < 0.0)
        discard;
    
    // color reduction
    float col = 16.0-(strength*12.0);
    // sample the texture
    vec3 frag = floor(texture2D(gm_BaseTexture,uv).rgb*col)/col;
    
    // determine if we are drawing in a scanline
    float scan = abs(sin(v_vTexcoord.y*240.0)*0.25*strength);
    // fragment output
    gl_FragColor = vec4(mix(frag,vec3(0.0),scan),1.0);
    }
