class_name CustomerRegion
extends Node3D

@export var regions: Array[CollisionShape3D]
@export var customerSize: Vector2
@export var customerScene: PackedScene

var activeCustomers: Array[Customer]

func get_active_customers():
	return activeCustomers

func spawn_random_customer():
	var region = regions.pick_random()
	var minP = (region as Node3D).global_position - ((region as CollisionShape3D).shape as BoxShape3D).size / 2
	var maxP = (region as Node3D).global_position + ((region as CollisionShape3D).shape as BoxShape3D).size / 2
	var pos = Vector3(
		randf_range(minP.x + customerSize.x / 2, maxP.x - customerSize.x / 2),
		(region as Node3D).global_position.y,
		randf_range(minP.z + customerSize.y / 2, maxP.z - customerSize.y / 2)
	)

	var customer = customerScene.instantiate() as Customer
	add_child(customer)
	customer.global_position = pos
	activeCustomers.append(customer)
