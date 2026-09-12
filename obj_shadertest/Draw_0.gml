draw_set_font(fnt_big);
var ch = char;
var is_exe = false;

if (variable_instance_exists(id, "exe") && exe) {
    is_exe = true;
}

if (is_exe) {
    ch = char + PALETTE_EXE;
} else if (demon) {
    ch += PALETTE_DEMON;
}

var anim_list;

if (is_exe) {
    anim_list = global.player_exesanims[? char];

    if (anim_list == undefined || array_length(anim_list) == 0) {
        anim_list = [];
        switch (char) {
            case EXE_ORIGINAL: array_push(anim_list, spr_exe_idle);     break;
            case EXE_CHAOS:    array_push(anim_list, spr_chaos_idle);   break;
            case EXE_EXETIOR:  array_push(anim_list, spr_exetior_idle); break;
            case EXE_EXELLER:  array_push(anim_list, spr_exeller_idle); break;
            default:           array_push(anim_list, spr_merfurmu);     break;
        }
    }

    var _offset = 0;
    if (alt_anim) {
        switch (char) {
            case EXE_ORIGINAL: _offset = 20; break;
            case EXE_CHAOS:    _offset = 25; break;
        }
    }

    var _idx = anim_index + _offset;
    if (_idx >= array_length(anim_list)) {
        _idx = anim_index;
    }
    if (_idx < 0) _idx = 0;

    sprite_index = anim_list[_idx];
} else {
    if (demon) {
        anim_list = global.player_eanims[? char];
    } else {
        anim_list = global.player_anims[? char];
    }
    
    if (anim_list != undefined && anim_index < array_length(anim_list)) {
        sprite_index = anim_list[anim_index];
    } else {
        switch (char) {
            case CHARACTER_TAILS:  sprite_index = demon ? spr_etails_idle : spr_tails_idle; break;
            case CHARACTER_KNUX:   sprite_index = demon ? spr_eknux_idle : spr_knux_idle;   break;
            case CHARACTER_EGGMAN: sprite_index = demon ? spr_eegg_idle : spr_egg_idle;     break;
            case CHARACTER_AMY:    sprite_index = demon ? spr_eamy_idle : spr_amy_idle;     break;
            case CHARACTER_CREAM:  sprite_index = demon ? spr_ecream_idle : spr_cream_idle; break;
            case CHARACTER_SALLY:  sprite_index = demon ? spr_esally_idle : spr_sally_idle; break;
            default:               sprite_index = spr_merfurmu; break;
        }
    }
}

var tableIndex;
if (is_exe) {
    tableIndex = char + PALETTE_EXE;
} else {
    tableIndex = char;
    if (demon) tableIndex += PALETTE_DEMON;
}

var _ind = ind;

if (_ind == -1) {
    draw_self();
} else if (_ind == 2) {
    var base_from = global.paletteShifts[? tableIndex];

    if (base_from == undefined) {
        var pals = global.palettes[? tableIndex];
        if (pals != undefined && array_length(pals) > 0) {
            base_from = pals[0].from;
        }
    }

    if (base_from == undefined) {
        draw_self();
    } else {
        var to = base_from;
        var phase = (current_time / 16) mod 256;

        if (is_exe) {
            switch (char) {
                case EXE_EXETIOR:
                case EXE_EXELLER:
                    to = scr_pallete_shift(to, 0, 0, -phase * 3);
                    break;
                default:
                    to = scr_pallete_shift(to, phase, 0, 0);
            }
        } else {
            to = scr_pallete_shift(to, phase, 0, 0);
        }

        scr_palette_swap(base_from, to);
        draw_self();
        shader_reset();
    }
} else {
    var pal_array = global.palettes[? tableIndex];
    if (pal_array == undefined || _ind >= array_length(pal_array)) {
        draw_self();
    } else {
        var from = pal_array[_ind].from;
        var to = pal_array[_ind].to;
        scr_palette_swap(from, to);
        draw_self();
        shader_reset();
    }
}

if (show_origin && sprite_index != -1) {
    var origin_x = sprite_get_xoffset(sprite_index);
    var origin_y = sprite_get_yoffset(sprite_index);

    if (show_origin_cross) {
        var origin_size = 6;
        var circle_size = 2;
        if (is_exe) { origin_size = 4; circle_size = 1; }

        var ox = x;
        var oy = y;

        draw_set_colour(c_lime);
        draw_line(ox - origin_size, oy, ox + origin_size, oy);
        draw_line(ox, oy - origin_size, ox, oy + origin_size);
        draw_circle(ox, oy, circle_size, false);
    }

    draw_set_colour(c_white);
    draw_text(x - 52, y + 25, "Origin: (x " + string(origin_x) + ", y  " + string(origin_y) + ")");
}

var skinName = ["default", "classic", "eccentric", "custom"];

if (is_exe) {
    switch (char) {
        case EXE_ORIGINAL: skinName[2] = "coldblood";  break;
        case EXE_CHAOS:
            skinName[1] = "prismarine";
            skinName[2] = "vermillion";
            break;
        case EXE_EXETIOR: skinName[2] = "menace";     break;
        case EXE_EXELLER: skinName[2] = "oldschool";  break;
    }
}

if (_ind == -1) {
    text = "default";
} else if (_ind == 0) {
    text = skinName[1];
} else if (_ind == 1) {
    text = skinName[2];
} else {
    text = "custom";
}

var alt_label = "";
if (alt_anim && is_exe) {
    switch (char) {
        case EXE_ORIGINAL: alt_label = " \n\\(invis)"; break;
        case EXE_CHAOS:    alt_label = " \n/(slime)"; break;
    }
}

var demon_label = "";
if (demon && !is_exe) {
    demon_label = " \n|(demon)";
}

scr_text_spr(x - 32, y - 100, "sprite: " + string(anim_index) + alt_label + demon_label);
scr_text_spr(x - 48, y - 80,  "palette: " + text);