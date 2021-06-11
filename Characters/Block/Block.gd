class_name Block
extends RigidBody2D

export var is_left_extreme:bool = false
export var is_right_extreme:bool = false

func _ready() -> void:
	# a if cond else b
	#var offset:int = -64 if is_left_extreme else 64
	$Joint.global_position = Vector2(global_position.x + 64, global_position.y);
	$PinJoint.global_position = $Joint.global_position
	
	$PinJoint.node_a = self.get_path()
	
	if is_left_extreme or is_right_extreme:
		$PinJoint.softness = 0.01

func assign_node_b(other_node: Object) -> void:
	$PinJoint.node_b = other_node.get_path()

func add_sprite_and_joint(other_node: Object) -> void:
	var new_sprite := $Joint.duplicate()
	new_sprite.global_position = Vector2(-64, 0)
	var new_joint :PinJoint2D = $PinJoint.duplicate()
	new_joint.global_position = Vector2(-64, 0)
	new_joint.softness = 0.01
	new_joint.node_a = self.get_path()
	new_joint.node_b = other_node.get_path()
	add_child(new_sprite)
	add_child(new_joint)
