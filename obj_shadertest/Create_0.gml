char = CHARACTER_TAILS;
ind = -1;
demon = false;

colours = [ #e0a000, #e08000, #a06040, #e0e0e0, #c0c0e0, #a0a0c0, #606080, #800000];
swaps = [ #e0a000, #e08000, #a06040, #e0e0e0, #c0c0e0, #a0a0c0, #606080, #800000];

show_origin = true;
show_origin_cross = true;

show_hud = false;
hud_android = false;
hud_layer_visible = false;

key_delay = 0;
anim_index = IDLE;   
alt_anim = false;
anim_index = 0;
image_speed = 0.5;

exe = false;
text = "default";

function get_max_animations(character) {
    var anim_list;
    
    if (character > CHARACTER_SALLY) {
        var exe_ind = character - CHARACTER_SALLY - 1;
        anim_list = global.player_exesanims[? exe_ind];
    } else if (demon) {
        anim_list = global.player_eanims[? character];
    } else {
        anim_list = global.player_anims[? character];
    }
    if (anim_list != undefined) {
        return array_length(anim_list);
    }
    return 1;
}