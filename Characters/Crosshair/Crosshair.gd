extends Sprite

func _physics_process(_delta: float) -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	global_position = get_global_mouse_position()

func on_target(is_on_target: bool) -> void:
	if is_on_target:
		modulate = Color.red
		return
	modulate = Color.white


func _on_Area2D_area_entered(area: Area2D) -> void:
	print(area.name)
	on_target(true)


func _on_Area2D_area_exited(area: Area2D) -> void:
	on_target(false)
