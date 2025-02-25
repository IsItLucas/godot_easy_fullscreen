extends Node


## Emitted when fullscreen changes in any way.
## Use [param enabled] to detect fullscreen.
signal fullscreen_toggled(enabled: bool)


## Emitted when the fullscreen lock changes in anyway.
## Use [param mode] to determine how the fullscreen is being locked.
signal fullscreen_locked(mode: LockModes)


## A list of all ways fullscreen can be locked.
enum LockModes {
	## Unlocked. The player can freely get in and out of fullscreen mode.
	UNLOCKED,
	
	## Locks fullscreen to the current mode.
	## If fullscreen is enabled, it will keep enabled.
	## If fullscreen is disabled, it will keep disabled.
	CURRENT,
	
	## Forces the project to run on fullscreen.
	FULLSCREEN,
	
	## Forces the project to run on windowed mode.
	WINDOWED,
}


## This constant stores all actions that can toggle fullscreen.
## Add as many actions as you want here.
const ACTIONS: Array[StringName] = [
	&"fullscreen"
]

## This constant determines whether debug messages are enabled
## or not.
const DEBUG_LOG: bool = true


## The current way the fullscreen is being locked.
## Use [method lock] to change and apply it instantly.
var lock_mode := LockModes.UNLOCKED


## Called every time the player presses a key.
func _unhandled_key_input(event: InputEvent) -> void:
	# Create a variable to determine if this input is going to be ignored.
	var ignore: bool = true
	
	# Check if the event matches at least one of the listed ACTIONS.
	for action: StringName in ACTIONS:
		if event.is_action_pressed(action):
			ignore = false
	
	# Ignore all events that are not listed in ACTIONS.
	if ignore:
		return
	
	# Toggle fullscreen.
	toggle(not is_fullscreen())


## This method toggles the fullscreen mode.
func toggle(enabled: bool) -> void:
	# Change mode.
	if enabled:
		# Toggle fullscreen on.
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
		
		if DEBUG_LOG:
			print("Fullscreen toggled on.")
	else:
		# Toggle fullscreen off.
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		
		if DEBUG_LOG:
			print("Fullscreen toggled off.")
	
	# Emit a signal.
	fullscreen_toggled.emit(enabled)


## This method changes the fullscreen lock mode and apply the changes instantly.
func lock(mode: LockModes) -> void:
	# Update variables.
	lock_mode = mode
	
	match lock_mode:
		# Enable fullscreen.
		LockModes.FULLSCREEN:
			toggle(true)
		
		# Disable fullscreen.
		LockModes.WINDOWED:
			toggle(false)
	
	# Debug log.
	if DEBUG_LOG:
		print("Locking fullscreen to %s." % FullscreenHelper.lock_mode_to_str(lock_mode))


## Returns a human readable string of the current lock mode.
static func lock_mode_to_str(mode: Fullscreen.LockModes):
	match mode:
		Fullscreen.LockModes.UNLOCKED: return "Unlocked"
		Fullscreen.LockModes.CURRENT: return "Current"
		Fullscreen.LockModes.FULLSCREEN: return "Fullscreen"
		Fullscreen.LockModes.WINDOWED: return "Windowed"


## Returns whether the main window is on fullscreen or not.
func is_fullscreen() -> bool:
	return DisplayServer.window_get_mode() == DisplayServer.WindowMode.WINDOW_MODE_EXCLUSIVE_FULLSCREEN
