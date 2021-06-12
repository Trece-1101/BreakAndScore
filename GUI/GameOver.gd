extends CanvasLayer


func _ready() -> void:
	$Control.visible = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel") and OS.is_debug_build():
		$Control.visible = not $Control.visible
