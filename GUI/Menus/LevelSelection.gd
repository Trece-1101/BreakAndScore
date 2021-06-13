extends Node

var level_buttons := []

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	for button in $MainContainer/LevelContainer.get_children():
		level_buttons.append(button)
		button.connect("pressed", self, "load_level", [button.get_level_to_load()])
		
	check_buttons()

func check_buttons() -> void:
	for button in level_buttons:
		if button.get_level_assigned() <= GameData.get_current_unlock_level() + 1:
			button.disabled = false

func load_level(level: String) -> void:
	var path_to_level: String = "res://Levels/" + level + ".tscn"
	get_tree().change_scene(path_to_level)


func _on_BtnRetry_pressed() -> void:
	get_tree().change_scene("res://GUI/Menus/MainMenu.tscn")
