extends CanvasLayer


func _ready() -> void:
	$Control.visible = false

func set_visible(value: bool) -> void:
	if value:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$Control.visible = value

#func _input(event: InputEvent) -> void:
#	if event.is_action_pressed("ui_cancel") and OS.is_debug_build():
#		$Control.visible = not $Control.visible
#
#	if $Control.visible:
#		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
#	else:
#		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func _on_BtnRetry_pressed() -> void:
	get_tree().paused = false
# warning-ignore:return_value_discarded
	get_tree().reload_current_scene()


func _on_BtnQuit_pressed() -> void:
	get_tree().quit()


func _on_BtnLevelSelection_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene("res://GUI/Menus/LevelSelection.tscn")


func load_level() -> void:
	var level = (GameData.get_current_unlock_level() + 1) as String
	var path_to_level: String = "res://Levels/Level" + level + ".tscn"
	print(path_to_level)
	get_tree().change_scene(path_to_level)

func _on_BtnNext_pressed() -> void:
	load_level()
