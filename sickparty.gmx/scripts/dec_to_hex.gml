/// dec_to_hex(val);

var _dec = argument[0];
var _hex = "";
var _lookup = "0123456789ABCDEF";
while(_dec > 0)
    {
    var _byte = _dec & 255;
    _hi = string_char_at(_lookup,(_byte div 16)+1);
    _lo = string_char_at(_lookup,(_byte mod 16)+1);
    _hex = _hex+_hi+_lo;
    _dec = _dec >> 8;
    }
return(_hex);
