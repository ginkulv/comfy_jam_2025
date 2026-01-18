extends Area2D

@export var door_id: int
@export var is_allowed_to_open : bool = true
var is_open : bool = false

func _ready():
    $".".input_event.connect(_on_input_event)
    DoorManager.register(self)

func _on_input_event(viewport, event, shape_idx):
    if is_open:
        return
    
    if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
        try_open()

func try_open():
    if not is_allowed_to_open:
        # play locked sound / shake
        return
    
    open_door()

func open_door():
    is_open = true
    $Block/CollisionShape2D.disabled = true
    modulate = Color.RED
