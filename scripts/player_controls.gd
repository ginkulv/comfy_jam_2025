extends CharacterBody2D


@export var move_speed : float = 10000

func _physics_process(delta):
    

    var direction = Input.get_axis("walk_letf", "walk_right")


    if direction:
        velocity.x = direction * move_speed * delta
    else:
        velocity.x = move_toward(velocity.x, 0, move_speed)

    move_and_slide()
  
