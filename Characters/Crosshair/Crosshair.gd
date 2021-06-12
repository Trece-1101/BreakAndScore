extends Area2D

func _physics_process(_delta: float) -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	global_position = get_global_mouse_position()

func on_target(is_on_target: bool) -> void:
	if is_on_target:
		$Sprite.modulate = Color.red
		return
	$Sprite.modulate = Color.white


func _on_area_entered(_area: Area2D) -> void:
	on_target(true)


func _on_area_exited(_area: Area2D) -> void:
	on_target(false)
