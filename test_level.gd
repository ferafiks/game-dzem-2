extends Node3D

func lose():
	var lose_screen = load("res://lose_pop_up.tscn")
	var lose_inst = lose_screen.instantiate()
	add_child(lose_inst)
	get_tree().paused = true
