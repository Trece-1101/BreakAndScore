extends StaticBody2D

func _on_BallDetector_body_entered(_body: Node) -> void:
	GameMusic.play_lose()
	get_tree().reload_current_scene()
