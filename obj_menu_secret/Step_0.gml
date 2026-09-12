/// @description Shader Test
if(obj_menu.submenu != SUBMENU_NONE)
	return;
	
if (keyboard_string != "") {
    code = keyboard_string;
    if (code == correct) {
        room_goto(room_shadertest);
        audio_stop_all();
        audio_play_sound(snd_destiny, 0, false);
    }
}

if (keyboard_check_pressed(vk_backspace)) {
    keyboard_string = "";
}