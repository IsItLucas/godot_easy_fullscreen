@tool
extends EditorPlugin


func _enter_tree() -> void:
	add_autoload_singleton("Fullscreen", "res://addons/easy_fullscreen/autoload.gd")
	
	ProjectSettings.set_setting("easy_fullscreen/enabled", true)
	ProjectSettings.set_setting("easy_fullscreen/action", "fullscreen")


func _exit_tree() -> void:
	remove_autoload_singleton("Fullscreen")
	
	ProjectSettings.set_setting("easy_fullscreen/enabled", null)
	ProjectSettings.set_setting("easy_fullscreen/action", null)
