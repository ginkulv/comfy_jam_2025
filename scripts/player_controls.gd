extends CharacterBody2D


@export var move_speed : float = 10000

func _physics_process(delta):
	
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * move_speed * delta
	else:
		velocity.x = move_toward(velocity.x, 0, move_speed)

	move_and_slide()
	get_selected_object()

#выбор предметов
func get_selected_object():
	var space = get_world_2d().direct_space_state
	var query = PhysicsPointQueryParameters2D.new()
	query.position = get_global_mouse_position()
	query.collide_with_areas = true
	var intersection = space.intersect_point(query, 1)
	
	if intersection.is_empty():
		return null
	
	print (intersection[0].collider)
	return intersection[0].collider
