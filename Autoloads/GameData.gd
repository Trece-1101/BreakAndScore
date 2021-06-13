extends Node

onready var current_unlock_level:int = 0 setget set_current_unlock_level, get_current_unlock_level

func set_current_unlock_level(value:int) -> void:
	current_unlock_level = value

func get_current_unlock_level() -> int:
	return current_unlock_level


func new_unlock_level() -> void:
	current_unlock_level += 1
