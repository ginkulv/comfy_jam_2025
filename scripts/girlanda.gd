extends AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameState.OnFireplace.connect(start_animation)


func start_animation() -> void:
	play("enable_girlanda")
