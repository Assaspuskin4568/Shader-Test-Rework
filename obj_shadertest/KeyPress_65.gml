/// @description Key A - HUD Android Position
if (show_hud) {
    hud_android = !hud_android;
    hud_layer_visible = !hud_layer_visible;

    var _lay = layer_get_id("Android");
    if (_lay != -1) {
        layer_set_visible(_lay, hud_layer_visible);
    }
}