/// @description Key I - Toggle Alt Sprites
if ((variable_instance_exists(id, "exe") && exe) &&
    (char == EXE_ORIGINAL || char == EXE_CHAOS)) {
    alt_anim = !alt_anim;

    var _list = global.player_exesanims[? char];
    if (_list != undefined) {
        var _half = array_length(_list) div 2;
        if (anim_index >= _half) anim_index = 0;
    }
}