/// log(txt,...);

if (!global.OUTPUT)
    return(false);

show_debug_message(argument[0]);
for(var i=1; i<argument_count; i++;)
    show_debug_message("  "+string(argument[i]));
