extends Node3D

@export var boundsNode1: Node3D
@export var boundsNode2: Node3D
@export var pointsRoot: Node3D

var bounds: Vector2
var points: Array[Vector2]

func _ready() -> void:

	bounds = Vector2(
		abs(boundsNode1.global_position.x - boundsNode2.global_position.x),
		abs(boundsNode1.global_position.z - boundsNode2.global_position.z)
	)

	for i in range(pointsRoot.get_child_count()):
		var child = pointsRoot.get_child(i)

		if child is not Node3D: continue

		var childPos = (child as Node3D).global_position;
		var ownPos = global_position;

		var closeness = [
			abs(childPos.x - (ownPos.x + bounds.x / 2)),
			abs(childPos.z - (ownPos.z + bounds.y / 2)),
			abs(childPos.z - (ownPos.z - bounds.y / 2)),
			abs(childPos.x - (ownPos.x - bounds.x / 2)),
		]

		var bestSide = 0
		for x in range(4):
			if closeness[x] < closeness[bestSide]:
				bestSide = x

		points[bestSide] = childPos.x - ownPos.x if bestSide % 2 == 1 else childPos.z - ownPos.z
