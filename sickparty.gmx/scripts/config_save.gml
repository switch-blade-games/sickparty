/// config_save(filepath);

if (argument_count > 0)
    var _filepath = argument[0];
else
    var _filepath = global.CFGfile;

var _time = get_timer();

log("Attempting to save configuration...","["+string(_filepath)+"]");

var _file = file_text_open_write(_filepath);
file_text_write_real(_file,global.CFGversion);
file_text_writeln(_file);

for(var i=0; i<config.size; i++;)
    {
    file_text_write_string(_file,global.CFGtag[i]);
    file_text_writeln(_file);
    file_text_write_real(_file,global.CFG[i]);
    file_text_writeln(_file);
    }

file_text_close(_file);

log("Configuration saved! ["+string(get_timer()-_time)+"ms]");
