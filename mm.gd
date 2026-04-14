extends Control
var lvl = preload("res://levels/level1.tscn")
var credits = preload("res://credits.tscn")

func _on_quit() -> void:
	get_tree().quit()
	pass # Replace with function body.


func on_credits() -> void:
	get_tree().change_scene_to_packed(credits)


func _on_start() -> void:
	get_tree().change_scene_to_packed(lvl)
