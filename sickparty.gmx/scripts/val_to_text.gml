/// val_to_text(type,val);

switch(argument[0])
    {
    case 0: // boolean
        if (argument[1] < 0.5)
            return("OFF");
        else
            return("ON");
        break;
    
    case 1: // percent
        if (argument[1] <= 0)
            return("OFF");
        else
            return(string(round(argument[1]*100))+"%");
        break;
    
    case 2: // off-low-med-hi-max
        if (argument[1] <= 0.00)
            return("OFF");
        if (argument[1] <= 0.25)
            return("MIN");
        if (argument[1] <= 0.50)
            return("MED");
        if (argument[1] <= 0.75)
            return("HIGH");
        if (argument[1] > 0.75)
            return("MAX");
        break;
    
    case 3: // vsync levels
        if (argument[1] < 2)
            return("OFF");
        else if (argument[1] == 2)
            return("2XAA");
        else if (argument[1] == 4)
            return("4XAA");
        else if (argument[1] == 8)
            return("8XAA");
        break;
    
    case 4: // os type
        if (argument[1] == os_windows)
            return("WINDOWS");
        else if (argument[1] == os_macosx)
            return("OSX");
        else if (argument[1] == os_linux)
            return("LINUX");
        else if (argument[1] == os_unknown)
            return("UNKNOWN");
        break;
    }
