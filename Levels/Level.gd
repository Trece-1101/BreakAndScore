extends Node

export var break_number:float = 2.0 setget ,get_break_number
onready var gui := $UI
onready var ball :Ball = $Ball
onready var is_started := false

const overlay_game_over: PackedScene = preload("res://GUI/GameOver.tscn")

var joints_childs := []

func get_break_number() -> float:
	return break_number

func _ready() -> void:
	var new_game_over := overlay_game_over.instance()
	add_child(new_game_over)
	gui.update_gui()
	var joints := get_joints()
	for joint in joints:
		joint.connect("break_made", self, "discount_break_number")

func _input(event: InputEvent) -> void:	
	if event.is_action_pressed("ui_start") and not is_started:
		is_started = true
		ball.change_to_normal_gravity()
		var joints := get_joints()
		for joint in joints:
			joint.set_is_brekeable(true)

func discount_break_number(value:float) -> void:
	if (break_number - value) >= 0:
		break_number -= value
		gui.update_gui()
	else:
		var joints := get_joints()
		for joint in joints:
			if joint != null:
				joint.set_is_brekeable(false)

func get_joints() -> Array:
	var joints := []
	for child in get_node("Bridge").get_children():
		if child is Block:
			joints.append(child.get_node_or_null("Joint"))
			if child.is_left_extreme:
				joints.append(child.get_node_or_null("@Joint@2"))
	
	return joints
