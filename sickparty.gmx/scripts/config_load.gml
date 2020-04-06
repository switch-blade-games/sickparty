/// config_load(filepath);

if (argument_count > 0)
    var _filepath = argument[0];
else
    var _filepath = global.CFGfile;

if (!file_exists(_filepath))
    return(false);

var _time = get_timer();

log("Attempting to load configuration...","["+string(_filepath)+"]");

var _file = file_text_open_read(_filepath);
var _version = file_text_read_real(_file);
file_text_readln(_file);

if (_version != global.CFGversion)
    {
    log("ERROR: Corrupt/Invalid configuration file!");
    return(false);
    }

var _eof = file_text_eof(_file);
while(!_eof)
    {
    var _key = file_text_read_string(_file);
    file_text_readln(_file);
    var _val = file_text_read_real(_file);
    file_text_readln(_file);
    
    if (ds_map_exists(global.CFGmap,_key))
        {
        var _index = global.CFGmap[?_key];
        global.CFG[_index] = _val;
        }
    
    _eof = file_text_eof(_file);
    }

log("Configuration loaded! ["+string(get_timer()-_time)+"ms]");
return(true);
