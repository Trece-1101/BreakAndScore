extends CanvasLayer

var level

func _ready() -> void:
	level = owner
	$LevelName.text = level.name

func update_gui() -> void:
	update_breaks()

func update_breaks() -> void:
	$Panel/Label.text = "Breaks: " + level.get_break_number() as String


func _on_BtnRetry_pressed() -> void:
	get_tree().reload_current_scene()
