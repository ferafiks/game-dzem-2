extends Node3D
var to_deliver = -1
func _ready() -> void:
	for rzecz in get_children():
		rzecz.visible = false
		rzecz.gravity_scale = 0
		rzecz.position.y = 100

# Called when the node enters the scene tree for the first time.
func zrzut():
	to_deliver = 0
	for rzecz in get_children():
		rzecz.visible = true
		rzecz.gravity_scale = 1
		to_deliver += 1
		
	print(to_deliver)
