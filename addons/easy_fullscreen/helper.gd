class_name FullscreenHelper extends Node


## This class only serves as a helper class.
## It contains some utils and / or quality of life features.
## This is mainly used by GET - Godot Easy Translations, but feel free to use it if you want / need.


## The prefix of the project settings related to the addon.
const SETTINGS_NAME := "fullscreen"


## Returns a human readable string of the current lock mode.
static func lock_mode_to_str(mode: Fullscreen.LockModes):
	match mode:
		Fullscreen.LockModes.UNLOCKED: return "Unlocked"
		Fullscreen.LockModes.CURRENT: return "Current"
		Fullscreen.LockModes.FULLSCREEN: return "Fullscreen"
		Fullscreen.LockModes.WINDOWED: return "Windowed"


## Sets a given GEFS [param setting] to the given [param value].
static func set_setting(setting: String, value: Variant) -> void:
	var path := get_setting_path(setting)
	if not ProjectSettings.has_setting(path):
		push_error("Couldn't find custom setting \"%s\"." % setting)
	
	ProjectSettings.set_setting(path, value)


## Returns the current [param value] of a GEFS project [param setting].
static func get_setting(setting: String, default: Variant = null) -> Variant:
	var path := get_setting_path(setting)
	return ProjectSettings.get_setting(path, default)


## Returns the Project Setting path for the given GEFS [param setting].
static func get_setting_path(setting: String) -> String:
	return "godot_easy/" + SETTINGS_NAME + "/" + setting
