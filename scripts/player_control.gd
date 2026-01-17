extends CharacterBody2D


@export var move_speed : float = 20000

@export var left_boundary := -890.0
@export var right_boundary := 2900.0

@onready var sprite :Sprite2D = $Sprite2D
func _physics_process(delta):
    

    var direction = Input.get_axis("walk_letf", "walk_right")


    if direction:
        velocity.x = direction * move_speed * delta
    else:
        velocity.x = move_toward(velocity.x, 0, move_speed)
    
    if direction > 0:
        sprite.flip_h = true
    elif direction < 0:
        sprite.flip_h = false

    move_and_slide()
    
    global_position.x = clamp(global_position.x, left_boundary, right_boundary)
  
