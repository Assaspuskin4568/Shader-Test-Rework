/// @description Key Z - Sprites Prev
var _is_exe = (variable_instance_exists(id, "exe") && exe);
var _max = 1;

if (_is_exe) {
    var _list = global.player_exesanims[? char];
    if (_list != undefined && array_length(_list) > 0) {
        _max = array_length(_list);

        if (char == EXE_ORIGINAL || char == EXE_CHAOS) {
            _max = _max div 2;
        }
    } else {
        switch (char) {
            case EXE_ORIGINAL: _max = 20; break;
            case EXE_CHAOS:    _max = 25; break;
            case EXE_EXETIOR:  _max = 22; break;
            case EXE_EXELLER:  _max = 21; break;
            default:           _max = 1;  break;
        }
    }
} else {
    var _list = global.player_anims[? char];
    if (demon) _list = global.player_eanims[? char];
    if (_list != undefined) _max = array_length(_list);
}

anim_index--;
if (anim_index < 0) anim_index = _max - 1;