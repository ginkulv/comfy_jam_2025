extends Area2D

var is_lit : bool = false

func _ready():
    $".".input_event.connect(_on_area_input_event)

func _on_area_input_event(viewport, event, shape_idx):
    if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
        if not is_lit:
            light_up()
#зажечься
func light_up():
    is_lit = true
    modulate = Color.RED
