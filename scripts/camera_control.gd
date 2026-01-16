extends Camera2D

@export var player : CharacterBody2D
@export var camera_speed : float = 600.0
@export var deadzone_right_ratio : float = 0.10
@export var deadzone_left_ratio : float = 0.35
@export var left_boundary : float = -969.0
@export var right_boundary : float = 3000.0
@export var default_top_boundary := -500.0
@export var default_bottom_boundary := 2000.0

var pan_target := Vector2.ZERO
var is_panning : bool = false

var pan_top_boundary: float
var pan_bottom_boundary : float

func _ready():
    pan_top_boundary = default_top_boundary
    pan_bottom_boundary = default_bottom_boundary


func _process(delta):
    if is_panning:
        _pan_to_target(delta)
    else:
        _deadzone_follow(delta)

func _deadzone_follow(delta):
    if not player:
        return
    
    var viewport_width = get_viewport_rect().size.x
    var half_width = viewport_width * 0.5
    
    #Края экрана в мировых координатах
    var left_edge = global_position.x - half_width
    var right_edge = global_position.x + half_width
    
    #Deadzone limits
    var deadzone_left = left_edge + viewport_width * deadzone_left_ratio
    var deadzone_right = right_edge - viewport_width * deadzone_right_ratio
    
    var target_x = global_position.x
    
    if player.global_position.x < deadzone_left:
        target_x -= (deadzone_left - player.global_position.x)
    
    elif player.global_position.x > deadzone_right:
        target_x += (player.global_position.x - deadzone_right)
    
    target_x = clamp(target_x, left_boundary + half_width, right_boundary - half_width)
    
    global_position.x = move_toward(global_position.x, target_x, camera_speed * delta)

func start_pan(
    target_position: Vector2,
    top_bound: float = NAN,
    bottom_bound: float = NAN
    ):
    is_panning = true
    pan_target = target_position
    
    pan_top_boundary = (
        top_bound if not is_nan(top_bound) else default_top_boundary
    )
    pan_bottom_boundary = (
        bottom_bound if not is_nan(bottom_bound) else default_bottom_boundary
    )

func _pan_to_target(delta):
    var viewport_size = get_viewport_rect().size
    var half = viewport_size * 0.5
    
    pan_target.x = clamp(
        pan_target.x,
        left_boundary + half.x,
        right_boundary - half.x
    )
    pan_target.y = clamp(
        pan_target.y,
        pan_top_boundary + half.y,
        pan_bottom_boundary - half.y
    )
    
    global_position = global_position.move_toward(
        pan_target,
        camera_speed * delta
    )
    
    if global_position.is_equal_approx(pan_target):
        is_panning = false
