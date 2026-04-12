extends CanvasLayer


# Called when the node enters the scene tree for the first time.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_margin_container_toggled(toggled_on: bool) -> void:
	#print('KWUEWHJKDSFVHJKADSFBHJKASGFHJKASFRGHJK')
	get_parent().get_node("Mapa").visible = toggled_on
