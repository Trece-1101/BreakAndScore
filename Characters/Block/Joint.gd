class_name JointUnion
extends Sprite
signal break_made(value)

onready var is_brekeable := false setget set_is_brekeable, get_is_brekeable

func set_is_brekeable(value: bool) -> void:
	is_brekeable = value

func get_is_brekeable() -> bool:
	return is_brekeable

func _on_JointClickArea_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if not is_brekeable:
		return
	
#	is_brekeable = false
	
	if event.is_action_pressed("ui_break_joint"):
		emit_signal("break_made", 1)
		destroy_me()
	
	if event.is_action_pressed("ui_damage_joint"):
		var block_a:Block = get_node_or_null($PinJoint.node_a)
		var block_b:Block = get_node_or_null($PinJoint.node_a)
		block_a.set_is_marked(true)
		block_b.set_is_marked(true)
		block_a.connect("destroy_joint", self, "destroy_me")
		block_b.connect("destroy_joint", self, "destroy_me")
		emit_signal("break_made", 0.5)

func destroy_me() -> void:
	queue_free()
