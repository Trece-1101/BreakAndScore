extends Sprite
signal break_made(value)

func _on_JointClickArea_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event.is_action_pressed("ui_break_joint"):
		emit_signal("break_made", 1)
		queue_free()
	
	if event.is_action_pressed("ui_damage_joint"):
		emit_signal("break_made", 0.5)
