extends RigidBody3D


# Called when the node enters the scene tree for the first time.
func take(node_pos):
	rotation = Vector3.ZERO
	rotation.y = randf_range(0,359)
	print(node_pos, get_parent_node_3d().position)
	var correct_pos = node_pos
	print(correct_pos)
	position = correct_pos
	if position == correct_pos:
		print('TAKEN: ', self)
		process_mode = Node.PROCESS_MODE_DISABLED 
func drop():
	process_mode = Node.PROCESS_MODE_ALWAYS 
	print('DROPPED: ', self)
