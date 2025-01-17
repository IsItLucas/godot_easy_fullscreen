@tool
extends EditorPlugin


func _enter_tree() -> void:
	add_autoload_singleton("Fullscreen", "res://addons/easy_fullscreen/autoload.gd")
	
	ProjectSettings.set_setting("godot_easy/fullscreen/enabled", true)
	ProjectSettings.set_setting("godot_easy/fullscreen/action", "fullscreen")


func _exit_tree() -> void:
	remove_autoload_singleton("Fullscreen")
	
	ProjectSettings.set_setting("godot_easy/fullscreen/enabled", null)
	ProjectSettings.set_setting("godot_easy/fullscreen/action", null)
