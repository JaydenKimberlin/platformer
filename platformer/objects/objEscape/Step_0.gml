if keyboard_check(vk_escape) game_end();
if keyboard_check(vk_f1) room_restart();
if keyboard_check(vk_f2) game_restart();
if keyboard_check_pressed(vk_f11) {
	if window_get_fullscreen() window_set_fullscreen(false) else window_set_fullscreen(true)
}