/// key_last();

var _keys = 0;
var _key;
_key[_keys++] = vk_space;
_key[_keys++] = vk_control;
_key[_keys++] = vk_shift;
_key[_keys++] = vk_up;
_key[_keys++] = vk_down;
_key[_keys++] = vk_left;
_key[_keys++] = vk_right;
_key[_keys++] = vk_add;
_key[_keys++] = vk_subtract;
_key[_keys++] = vk_multiply;
_key[_keys++] = vk_divide;
for(var i=vk_numpad0; i<=vk_numpad9; i++;)
    _key[_keys++] = i;
for(var i=ord("A"); i<=ord("Z"); i++;)
    _key[_keys++] = i;
for(var i=ord("0"); i<=ord("9"); i++;)
    _key[_keys++] = i;

for(var i=0; i<_keys; i++;)
    {
    if (keyboard_check_pressed(_key[i]))
        return(_key[i]);
    }
return(-1);
