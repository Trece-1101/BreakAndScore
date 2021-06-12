class_name Block
extends RigidBody2D

export var is_left_extreme:bool = false
export var is_right_extreme:bool = false

func _ready() -> void:
	# a if cond else b
	#var offset:int = -64 if is_left_extreme else 64
	$Joint.position = Vector2(64, 0);
	#$PinJoint.global_position = $Joint.global_position
	
	$Joint/PinJoint.node_a = self.get_path()
	
	if is_right_extreme:
		$Joint/PinJoint.softness = 0.01

func assign_node_b(other_node: Object) -> void:
	$Joint/PinJoint.node_b = other_node.get_path()

func add_sprite_and_joint(other_node: Object) -> void:
	var new_joint := $Joint.duplicate()
	new_joint.global_position = Vector2(-64, 0)
	var new_pinjoint :PinJoint2D = new_joint.get_node("PinJoint")
	#var new_joint :PinJoint2D = $PinJoint.duplicate()
	#new_pinjoint.global_position = Vector2(-64, 0)
	new_pinjoint.softness = 0.01
	new_pinjoint.node_a = self.get_path()
	new_pinjoint.node_b = other_node.get_path()
	add_child(new_joint)
	#add_child(new_joint)
