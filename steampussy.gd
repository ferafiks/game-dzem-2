extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const GRAB_LIMIT = 4
var crate_slowness : float
func _physics_process(delta: float) -> void:
	crate_slowness = 1 - (float($Hand.get_child_count())/GRAB_LIMIT)
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("left", "right", "up", "down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED * crate_slowness
		velocity.z = direction.z * SPEED * crate_slowness
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	move_and_slide()
	
	
	#moevement
	if Input.is_action_just_pressed("take"):
		for thing in $Area3D.get_overlapping_bodies():
			#print(thing)
			if thing.is_in_group("grabbale") and thing.get_parent() is Marker3D == false:
				if $Hand.get_child_count() < GRAB_LIMIT:
					var latest_marker
					if $Hand.find_children('*','Marker3D',true):
						latest_marker = $Hand.find_children('*','Marker3D',true)[-1].position
					else:
						latest_marker = Vector3.ZERO
					print(latest_marker)
					thing.reparent($Hand)
					thing.take(latest_marker)
					break
	if Input.is_action_just_pressed("drop"):
		if !$Hand.get_children().is_empty():
			$Hand.get_children()[-1].drop()
			$Hand.get_children()[-1].name = 'Crate' + str($Hand.get_children()[-1].get_instance_id())
			$Hand.get_children()[-1].reparent($'..')
			
	
