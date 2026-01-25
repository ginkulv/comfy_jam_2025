extends CharacterBody2D


@export var move_speed : float = 20000

@export var left_boundary := -890.0
@export var right_boundary := 2900.0

@onready var animated_sprite = $AnimatedSprite2D
#@onready var sprite :Sprite2D = $Sprite2D
@onready var left_light:Node2D = $left_light
@onready var right_light:Node2D = $right_light
@export var on_flip : bool = false

func _physics_process(delta):


	var direction = Input.get_axis("walk_letf", "walk_right")
	
	if GameState.input_locked:
		return


	if direction:
		velocity.x = direction * move_speed * delta
		animated_sprite.play("walk")
	else:
		velocity.x = move_toward(velocity.x, 0, move_speed)
		animated_sprite.play("idle")

	if direction > 0:
		on_flip = true
	elif direction < 0:
		on_flip = false

	
	animated_sprite.flip_h = on_flip
	right_light.visible = on_flip
	left_light.visible = !on_flip

	move_and_slide()
	

	global_position.x = clamp(global_position.x, left_boundary, right_boundary)
