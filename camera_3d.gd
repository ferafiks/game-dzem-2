extends Camera3D

var offset_vec = Vector3(0,3,3)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	var correct_pos = get_parent().position + offset_vec
	#position = correct_pos
	position.x = lerp(position.x, correct_pos[0], 0.2)
	position.z = lerp(position.z, correct_pos[2], 0.2)
