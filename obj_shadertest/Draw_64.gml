if (show_hud) {
    var _y_off = hud_android ? 200 : 0;
    var _hud_is_exe = (variable_instance_exists(id, "exe") && exe);

    if (_hud_is_exe) {
        switch (char) {
            case EXE_ORIGINAL:
                draw_sprite(spr_gui_exeattack,        0, 10,  240 - _y_off);
                draw_sprite(spr_gui_exefreejump,      0, 3,   218 - _y_off);
                draw_sprite(spr_gui_exeinvisability,  0, 4,   250 - _y_off);
                break;

            case EXE_CHAOS:
                draw_sprite(spr_gui_chaosattack,      0, 10,  240 - _y_off);
                draw_sprite(spr_gui_exefreejump,      0, 3,   218 - _y_off);
                draw_sprite(spr_gui_chaosslime,       0, 4,   250 - _y_off);
                break;

            case EXE_EXETIOR:
                draw_sprite(spr_gui_exetiorattack,    0, 10,  240 - _y_off);
                draw_sprite(spr_gui_exefreejump,      0, 3,   218 - _y_off);
                draw_sprite(spr_gui_exetiorring,      0, 4,   250 - _y_off);
                break;

            case EXE_EXELLER:
                draw_sprite(spr_gui_exeattack,        0, 10,  240 - _y_off);
                draw_sprite(spr_gui_exefreejump,      0, 3,   218 - _y_off);
                draw_sprite(spr_gui_exellerclone,     0, 4,   250 - _y_off);
                break;
        }
    } else {
        switch (char) {
            case CHARACTER_TAILS:
                draw_sprite(spr_gui_tailsfly,    0, 10,  240 - _y_off);
                draw_sprite(spr_gui_tailsattack, 0, 12,  250 - _y_off);
                break;

            case CHARACTER_KNUX:
                draw_sprite(spr_gui_knuxglide,   0, 10,  240 - _y_off);
                draw_sprite(spr_gui_knuxattack,  0, 10,  258 - _y_off);
                break;

            case CHARACTER_EGGMAN:
                draw_sprite(spr_gui_eggdjump,    0, 10,  222 - _y_off);
                draw_sprite(spr_gui_eggshield,   0, 10,  240 - _y_off);
                draw_sprite(spr_gui_eggtrack,    0, 10,  258 - _y_off);
                break;

            case CHARACTER_AMY:
                draw_sprite(spr_gui_amyhjump,    0, 10,  240 - _y_off);
                draw_sprite(spr_gui_amyattack,   0, 10,  258 - _y_off);
                break;

            case CHARACTER_CREAM:
                draw_sprite(spr_gui_creamfly,    0, 10,  222 - _y_off);
                draw_sprite(spr_gui_creamdash,   0, 10,  240 - _y_off);
                draw_sprite(spr_gui_creamrings,  0, 10,  257 - _y_off);
                break;

            case CHARACTER_SALLY:
                draw_sprite(spr_gui_sallyattack, 0, 10,  240 - _y_off);
                draw_sprite(spr_gui_sallyshield, 0, 10,  258 - _y_off);
                break;
        }

        draw_sprite(spr_gui_emotions, 0, 470, 222 - _y_off);
    }
}