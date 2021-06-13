extends StaticBody2D

func _on_BallDetector_body_entered(_body: Node) -> void:
	get_tree().reload_current_scene()
