extends CanvasLayer

func _ready() -> void:
	if not GameData.get_is_tutorial_shown():
		set_visible(true)
		GameData.set_is_tutorial_shown(true)
	else:
		set_visible(false)

func set_visible(value:bool) -> void:
	$MainContainer.visible = value

func _on_BtnQuit_pressed() -> void:
	set_visible(false)
