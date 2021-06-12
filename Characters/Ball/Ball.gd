class_name Ball
extends RigidBody2D

export var moveable_value := 1.0
onready var is_moveable := true
onready var default_position := Vector2(640.0, 130.0)
onready var offset_allowed := Vector2(300.0, 100.0)

var limits := {"left": 0.0, "right": 0.0, "top": 0.0, "down": 0.0}

func _ready() -> void:
	mode = RigidBody2D.MODE_KINEMATIC
	global_position = default_position
	gravity_scale = 0.0
	limits.left = default_position.x - offset_allowed.x
	limits.right = default_position.x + offset_allowed.x
	limits.top = default_position.y - offset_allowed.y
	limits.down = default_position.y + offset_allowed.y


func _input(event: InputEvent) -> void:
	if not is_moveable:
		return
	
	if event.is_action("ui_left") and position.x > limits.left:
		position.x -= moveable_value
	elif event.is_action("ui_right") and position.x < limits.right:
		position.x += moveable_value
	
	if event.is_action("ui_down") and position.y < limits.down:
		position.y += moveable_value
	elif event.is_action("ui_up") and position.y > limits.top:
		position.y -= moveable_value


func change_to_normal_gravity() -> void:
	is_moveable = false
	mode = RigidBody2D.MODE_RIGID
	can_sleep = false
	gravity_scale = 8.0
