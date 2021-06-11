extends Node2D


func _ready() -> void:
	for i in range(0, get_child_count()):
		var obj := get_child(i)
		if obj is Block:
			obj.assign_node_b(get_child(i + 1))
			if obj.is_left_extreme:
				obj.add_sprite_and_joint(get_child(i - 1))
			
