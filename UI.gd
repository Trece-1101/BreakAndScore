extends CanvasLayer

var level

func _ready() -> void:
	level = owner

func update_gui() -> void:
	update_breaks()

func update_breaks() -> void:
	$Panel/Label.text = "Breaks: " + level.get_break_number() as String
