extends Node

export var break_number:int = 2 setget ,get_break_number
onready var gui := $UI
onready var ball :Ball = $Ball
onready var level_timer: Timer = $LevelTimer
onready var is_started := false
onready var time_elapsed:float = 0.0 setget ,get_time_elapsed

const overlay_game_win: PackedScene = preload("res://GUI/GameWin.tscn")

func get_break_number() -> int:
	return break_number

func get_time_elapsed() -> float:
	return time_elapsed

func _ready() -> void:
	get_tree().paused = false
	if GameMusic.get_music_playing() != "level":
		GameMusic.play_music("level")
	$Basket.connect("win", self, "win_game")
	var new_game_win := overlay_game_win.instance()
	new_game_win.name = "GameWin"
	add_child(new_game_win)
	gui.update_gui()
	var joints := get_joints()
	for joint in joints:
		joint.connect("break_made", self, "discount_break_number")

func _process(_delta: float) -> void:
	if level_timer.time_left == 0:
		return
	
	time_elapsed = (1000 - level_timer.time_left)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_start") and not is_started:
		is_started = true
		ball.change_to_normal_gravity()
		level_timer.start()
		var joints := get_joints()
		for joint in joints:
			joint.set_is_brekeable(true)

func discount_break_number(value:int) -> void:
	if (break_number - value == 0):
		break_number = 0
		gui.update_gui()
	if (break_number - value) > 0:
		break_number -= value
		gui.update_gui()
	else:
		var joints := get_joints()
		for joint in joints:
			if joint != null:
				joint.set_is_brekeable(false)


func get_joints() -> Array:
	return get_tree().get_nodes_in_group("joint")
#	var joints := get_tree().get_nodes_in_group("joint")
#	var joints := []
#	joints.append(get_tree().get_nodes_in_group("joint"))
#	for child in get_node("Bridge").get_children():
#		if child is Block:
#			joints.append(child.get_nodes_in_group("joint"))
#			if child.is_left_extreme:
#				joints.append(child.get_node_or_null("@Joint@2"))
	
#	return joints

func win_game() -> void:
	GameMusic.play_win()
	get_tree().paused = true
	get_node_or_null("GameWin").set_time(time_elapsed)
	get_node_or_null("GameWin").set_breaks(break_number)
	get_node_or_null("GameWin").set_visible(true)


func _on_BtnRetry_pressed() -> void:
	GameMusic.play_button()
	get_tree().reload_current_scene()
