extends StaticBody3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_area_3d_body_entered(body: Node3D) -> void:
	print(body)
	if "Crate" in body.get_name():
		if body.target_customer == self:
			body.delivered()
