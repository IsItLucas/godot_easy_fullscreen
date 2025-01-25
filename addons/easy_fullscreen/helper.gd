class_name FullscreenHelper extends Node


## The project settings related to the addon prefix.
const SETTINGS_NAME := "fullscreen"


## Returns a human readable string of the current lock mode.
static func lock_mode_to_str(mode: Fullscreen.LockModes):
	match mode:
		Fullscreen.LockModes.UNLOCKED: return "Unlocked"
		Fullscreen.LockModes.CURRENT: return "Current"
		Fullscreen.LockModes.FULLSCREEN: return "Fullscreen"
		Fullscreen.LockModes.WINDOWED: return "Windowed"


## Sets a given GEFS setting to the given value.
static func set_setting(setting: String, value: Variant) -> void:
	var path := get_setting_path(setting)
	if not ProjectSettings.has_setting(path):
		printerr("Couldn't find custom setting \"%s\"." % setting)
	
	ProjectSettings.set_setting(path, value)


## Returns the current value of a GEFS project setting.
static func get_setting(setting: String, default: Variant = null) -> Variant:
	var path := get_setting_path(setting)
	return ProjectSettings.get_setting(path, default)


## Returns the Project Setting path for the given GEFS setting.
static func get_setting_path(setting: String) -> String:
	return "godot_easy/" + SETTINGS_NAME + "/" + setting
