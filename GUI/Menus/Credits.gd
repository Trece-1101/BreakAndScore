extends Node



func _on_Return_pressed() -> void:
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://GUI/Menus/MainMenu.tscn")
