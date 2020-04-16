/// log_gmedit(txt,...,[col]);

if (!global.OUTPUT)
    return(false);

show_debug_message('<span style="color:'+string(argument[argument_count-1])+'">'+string(argument[0])+'</span>');
for(var i=1; i<argument_count-1; i++;)
    show_debug_message('<span style="color:'+string(argument[argument_count-1])+'">'+string("  "+string(argument[i]))+'</span>');
