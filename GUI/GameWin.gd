extends CanvasLayer


func _ready() -> void:
	$Control.visible = false

func set_visible(value: bool) -> void:
	if value:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$Control.visible = value

func set_time(time: float) -> void:
	$Control/ColorRect/Time2.text = stepify(time, 0.01) as String + " seconds"

func set_breaks(breaks: float) -> void:
	$Control/ColorRect/Breaks2.text = breaks as String

func _on_BtnRetry_pressed() -> void:
	get_tree().paused = false
# warning-ignore:return_value_discarded
	get_tree().reload_current_scene()


func _on_BtnQuit_pressed() -> void:
	get_tree().quit()


func _on_BtnLevelSelection_pressed() -> void:
	GameData.new_unlock_level()
	get_tree().paused = false
	get_tree().change_scene("res://GUI/Menus/LevelSelection.tscn")


func load_level() -> void:
	var level = (GameData.get_current_unlock_level() + 1) as String
	var path_to_level: String = "res://Levels/Level" + level + ".tscn"
	get_tree().change_scene(path_to_level)

func _on_BtnNext_pressed() -> void:
	GameData.new_unlock_level()
	load_level()
