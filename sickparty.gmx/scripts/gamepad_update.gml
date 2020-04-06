/// gamepad_update();

for(var i=0; i<global.gpmax; i++;)
    {
    if (gamepad_is_connected(i))
        {
        if (!global.gp[i,gpinfo.connected])
            {
            global.gp[i,gpinfo.connected] = true;
            global.gp[i,gpinfo.name] = gamepad_get_description(i);
            global.gp[i,gpinfo.vib_l] = 0;
            global.gp[i,gpinfo.vib_r] = 0;
            global.gp[i,gpinfo.last] = 0;
            global.gp[i,gpinfo.lastval] = 0;
            global.gpcount++;
            }
        
        // gamepad rumble
        gamepad_set_vibration(i,global.gp[i,gpinfo.vib_l],global.gp[i,gpinfo.vib_r]);
        global.gp[i,gpinfo.vib_l] *= 0.9;
        global.gp[i,gpinfo.vib_r] *= 0.9;
        
        // update last inputs
        for(var j=0; j<gpinput.size; j++;)
            global.gp_ilast[i,j] = global.gp_input[i,j];
        
        // update current inputs
        for(var j=global.gp_button_pos; j<=global.gp_button_end; j++;)
            global.gp_input[i,gpinput.face1+j] = gamepad_button_check(i,gp_face1+j);
        global.gp_input[i,gpinput.lsu] = gamepad_axis_value(i,gp_axislv) < -global.gp[i,gpinfo.dead];
        global.gp_input[i,gpinput.lsd] = gamepad_axis_value(i,gp_axislv) > +global.gp[i,gpinfo.dead];
        global.gp_input[i,gpinput.lsl] = gamepad_axis_value(i,gp_axislh) < -global.gp[i,gpinfo.dead];
        global.gp_input[i,gpinput.lsr] = gamepad_axis_value(i,gp_axislh) > +global.gp[i,gpinfo.dead];
        global.gp_input[i,gpinput.rsu] = gamepad_axis_value(i,gp_axisrv) < -global.gp[i,gpinfo.dead];
        global.gp_input[i,gpinput.rsd] = gamepad_axis_value(i,gp_axisrv) > +global.gp[i,gpinfo.dead];
        global.gp_input[i,gpinput.rsl] = gamepad_axis_value(i,gp_axisrh) < -global.gp[i,gpinfo.dead];
        global.gp_input[i,gpinput.rsr] = gamepad_axis_value(i,gp_axisrh) > +global.gp[i,gpinfo.dead];
        
        // reset last function
        global.gp[i,gpinfo.last] = -1;
        global.gp[i,gpinfo.lastval] = 0;
        
        // update last function
        for(var j=0; j<gpinput.size; j++;)
            {
            if (global.gp_input[i,j] and !global.gp_ilast[i,j])
                {
                global.gp[i,gpinfo.last] = j;
                if (j >= global.gp_button_pos) and (j <= global.gp_button_end)
                    global.gp[i,gpinfo.lastval] = gamepad_button_value(i,gp_face1+j);
                if (j >= global.gp_axis_pos) and (j <= global.gp_axis_end)
                    global.gp[i,gpinfo.lastval] = gamepad_axis_value(i,gp_face1+j);
                break;
                }
            }
        }
    else
        {
        if (global.gp[i,gpinfo.connected])
            {
            global.gp[i,gpinfo.connected] = false;
            global.gp[i,gpinfo.name] = "";
            global.gp[i,gpinfo.vib_l] = 0;
            global.gp[i,gpinfo.vib_r] = 0;
            global.gp[i,gpinfo.last] = 0;
            global.gp[i,gpinfo.lastval] = 0;
            
            for(var j=0; j<gpinput.size; j++;)
                {
                global.gp_input[i,j] = false;
                global.gp_ilast[i,j] = false;
                }
            
            global.gpcount--;
            }
        }
    }
