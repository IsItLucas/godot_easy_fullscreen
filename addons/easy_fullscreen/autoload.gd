extends Node


var is_fullscreen := false


func _input(event: InputEvent) -> void:
	var is_enabled: bool =  ProjectSettings.get_setting("easy_fullscreen/enabled", false)
	if not is_enabled:
		return
	
	var action: String = ProjectSettings.get_setting("easy_fullscreen/action", "fullscreen")
	if not InputMap.has_action(action):
		return
	
	if event.is_action_pressed(action):
		toggle_fullscreen()


func toggle_fullscreen() -> void:
	is_fullscreen = not is_fullscreen
	if is_fullscreen:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
