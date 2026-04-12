extends TextureRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for i in len(get_children()):
		if i == $"../../../..".current_zrzut:
			get_children()[i].visible = true
		else:
			get_children()[i].visible = false
