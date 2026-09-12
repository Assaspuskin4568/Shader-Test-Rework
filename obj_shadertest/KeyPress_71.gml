/// @description Key G - Toggle HUD
show_hud = !show_hud;

if (!show_hud) {
    hud_android = false;
    hud_layer_visible = false;

    var _lay = layer_get_id("Android");
    if (_lay != -1) {
        layer_set_visible(_lay, false);
    }
}