extends Node2D
signal win

export var is_moveable = false
export var animation:String = "MoveLeftRight"

onready var animation_player = $AnimationPlayer

func _ready() -> void:
	if is_moveable:
		animation_player.play(animation)

func _on_GoalArea_body_entered(_body: Node) -> void:
	emit_signal("win")
