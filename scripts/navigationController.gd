class_name NavigationController
extends Node3D

@export var minimapPlayer: Control
@export var minimapPlayerOffset: Vector2

@export var player: Node3D
@export var mapSize: Vector2

func _process(_delta: float) -> void:
	var parentSize = (player.get_parent() as Control).size
	var relPos = Vector2(player.global_position.x, player.global_position.z) / mapSize

	minimapPlayer.position = Vector2(parentSize.x * relPos.x, parentSize.y * relPos.y) + minimapPlayerOffset
