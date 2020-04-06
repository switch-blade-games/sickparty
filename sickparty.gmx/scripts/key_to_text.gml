/// key_to_text(key);

switch(argument[0])
    {
    case vk_left:       return("Left Arrow"); break;
    case vk_right:      return("Right Arrow"); break;
    case vk_up:         return("Up Arrow"); break;
    case vk_down:       return("Down Arrow"); break;
    case vk_space:      return("Spacebar"); break;
    case vk_enter:      return("Enter"); break;
    case vk_control:    return("Ctrl"); break;
    case vk_shift:      return("Shift"); break;
    case vk_tab:        return("Tab"); break;
    case vk_backspace:  return("Backspace"); break;
    case vk_numpad0:    return("Num 0"); break;
    case vk_numpad1:    return("Num 1"); break;
    case vk_numpad2:    return("Num 2"); break;
    case vk_numpad3:    return("Num 3"); break;
    case vk_numpad4:    return("Num 4"); break;
    case vk_numpad5:    return("Num 5"); break;
    case vk_numpad6:    return("Num 6"); break;
    case vk_numpad7:    return("Num 7"); break;
    case vk_numpad8:    return("Num 8"); break;
    case vk_numpad9:    return("Num 9"); break;
    case vk_add:        return("+"); break;
    case vk_subtract:   return("-"); break;
    case vk_multiply:   return("*"); break;
    case vk_divide:     return("/"); break;
    case -1: return("..."); break;
    case -2: return("EMPTY"); break;
    default:
        return(string(chr(argument[0])));
        break;
    }
