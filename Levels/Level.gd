extends Node

export var break_number:float = 2.0 setget ,get_break_number
onready var gui := $UI

func get_break_number() -> float:
	return break_number

func _ready() -> void:
	gui.update_gui()
	for child in get_node("Bridge").get_children():
		if child is Block:
			child.get_node("Joint").connect("break_made", self, "discount_break_number")

func discount_break_number(value:float) -> void:
	if (break_number - value) >= 0:
		break_number -= value
		gui.update_gui()
