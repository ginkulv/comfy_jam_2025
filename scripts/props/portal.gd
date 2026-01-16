extends Area2D

@export var destination : Marker2D
@export var camera: Camera2D
@export var pan_delay : float = 0.15
@export var player_offset : Vector2
@export var camera_offset : Vector2
@export var camera_top_boundary := -500.0
@export var camera_bottom_boundary := 2000.0

func _on_body_entered(body):
    if not body.is_in_group("player"):
        return
    
    teleport(body)

func teleport(player : Node2D):
    player.set_physics_process(false)
    
    player.global_position = destination.global_position + player_offset
    
    camera.start_pan(
        player.global_position,
        camera_top_boundary,
        camera_bottom_boundary
    )
    
    await get_tree().create_timer(pan_delay).timeout
    
    player.set_physics_process(true)
