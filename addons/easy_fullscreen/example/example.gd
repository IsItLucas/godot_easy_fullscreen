extends CanvasLayer


## This script showcases all functionalities of the GEFS - Godot Easy Fullscreen.
## Feel free to play around with the example script and scene to get to understand
## the addon ;)
##
## _ IsItLucas?


func _ready() -> void:
	# Stabilish connections.
	Fullscreen.fullscreen_toggled.connect(_on_fullscreen_toggled)
	Fullscreen.fullscreen_locked.connect(_on_fullscreen_locked)


## Called when the "Toggle Fullscreen" button is pressed.
func _on_fullscreen_button_pressed() -> void:
	# Toggles the fullscreen.
	# If the window is fullscreen, then it goes to windowed mode.
	# If the window is windoed, then it goes to fullscreen mode.
	Fullscreen.toggle(not Fullscreen.is_fullscreen())


## Called when one of the "Lock Mode" button's items are pressed.
func _on_lock_button_item_selected(index: int) -> void:
	# Changes the fullscreen lock mode.
	# Can be used to force the window to a certain mode.
	Fullscreen.lock(index)


## Called when the fullscreen mode changes.
func _on_fullscreen_toggled(enabled: bool) -> void:
	print(enabled)


## Called when the fullscreen lock mode changes.
func _on_fullscreen_locked(mode: Fullscreen.LockModes) -> void:
	# Converts the lock mode (int) to a human readable string.
	var mode_str: String = Fullscreen.lock_mode_to_str(mode)
	print(mode_str)
