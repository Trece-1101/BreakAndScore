extends CanvasLayer

var level

func _ready() -> void:
	level = owner
	$LevelName.text = level.name


func _process(_delta: float) -> void:
	update_time()

func update_gui() -> void:
	update_breaks()
	update_time()

func update_breaks() -> void:
	$PanelBreaks/Label.text = "Breaks available\n" + level.get_break_number() as String

func update_time() -> void:
	var te = stepify(level.get_time_elapsed(), 0.01)
	$PanelTime/LabelTime.text = "Time Elapsed\n" +  te as String

func _on_BtnRetry_pressed() -> void:
	get_tree().reload_current_scene()


func _on_BtnMenu_pressed() -> void:
	get_tree().change_scene("res://GUI/Menus/MainMenu.tscn")


func _on_BtnSelection_pressed() -> void:
	get_tree().change_scene("res://GUI/Menus/LevelSelection.tscn")
