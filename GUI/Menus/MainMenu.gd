extends Control

export var start_play := "res://GUI/Menus/LevelSelection.tscn"

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if GameMusic.get_music_playing() != "menu":
		GameMusic.play_music("menu")

func _on_Quit_pressed() -> void:
	get_tree().quit()


func _on_Credits_pressed() -> void:
# warning-ignore:return_value_discarded
	GameMusic.play_button()
	get_tree().change_scene("res://GUI/Menus/Credits.tscn")


func _on_Play_pressed() -> void:
# warning-ignore:return_value_discarded
	GameMusic.play_button()
	get_tree().change_scene(start_play)
