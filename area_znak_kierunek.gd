extends Area3D

var angle_of_player
var angle_of_road
var checked_road

func _on_body_entered(body: Node3D) -> void:
	
	if body.name == 'steampussy':
		checked_road = body

func _on_body_exited(body: Node3D) -> void:
	if body == checked_road:
		checked_road = null


func road_check(body):
	angle_of_player = Vector2(body.velocity.x, body.velocity.z).angle()
	angle_of_road = Vector2($Marker3D.position.x, $Marker3D.position.z).angle()
	if angle_of_player - angle_of_road > deg_to_rad(30):
		print(angle_of_player,' ', angle_of_road)

func _physics_process(_delta: float) -> void:
	if checked_road:
		road_check(checked_road) 
