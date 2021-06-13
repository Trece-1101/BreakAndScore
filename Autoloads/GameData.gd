extends Node

onready var current_unlock_level:int = 0 setget set_current_unlock_level, get_current_unlock_level
onready var is_tutorial_shown:bool = false setget set_is_tutorial_shown, get_is_tutorial_shown

func set_current_unlock_level(value:int) -> void:
	current_unlock_level = value

func get_current_unlock_level() -> int:
	return current_unlock_level

func set_is_tutorial_shown(value:bool) -> void:
	is_tutorial_shown = value

func get_is_tutorial_shown() -> bool:
	return is_tutorial_shown

func new_unlock_level() -> void:
	current_unlock_level += 1
