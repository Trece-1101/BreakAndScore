extends Node2D
signal win

export var is_moveable = false

onready var animation_player = $AnimationPlayer

func _ready() -> void:
	if is_moveable:
		animation_player.play("MoveLeftRight")

func _on_GoalArea_body_entered(_body: Node) -> void:
	print("GANASTE")
	emit_signal("win")
