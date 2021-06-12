extends Sprite

func _on_JointClickArea_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event.is_action_pressed("ui_break_joint"):
		queue_free()
