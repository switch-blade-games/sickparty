/// hex_to_dec(val);

var _hex = string_upper(argument[0]);
var _dec = 0;
var _lookup = "0123456789ABCDEF";
for(var i=1; i<=string_length(_hex); i++;)
    _dec = _dec << 4 | (string_pos(string_char_at(_hex,i),_lookup)-1);
return(_dec);
