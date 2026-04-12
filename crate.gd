extends RigidBody3D
@export var target_customer: StaticBody3D
var correct_zrzut
func _ready() -> void:
	correct_zrzut = get_parent()
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
	#await get_tree().create_timer(2.0).timeout
	#delivered()
func delivered():
	var rodzenstwo_load = preload("res://particle_boom.tscn") 
	var rodzenstwo = rodzenstwo_load.instantiate()
	correct_zrzut.to_deliver -= 1
	rodzenstwo.position = position
	rodzenstwo.visible = true
	rodzenstwo.emitting = true
	add_sibling(rodzenstwo)
	queue_free()
	
	
