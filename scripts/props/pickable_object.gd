extends Area2D

var mouse_over : bool = false
@export var item_id : Items.Id

func _ready():
    mouse_entered.connect(_on_mouse_entered)
    mouse_exited.connect(_on_mouse_exited)

func _on_mouse_entered():
    mouse_over = true

func _on_mouse_exited():
    mouse_over = false

func _input(event):
    if GameState.input_locked:
        return
    
    if mouse_over and event is InputEventMouseButton:
        if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
            on_left_click()
            
func on_left_click():
    InventoryManager.add_item(item_id)
    queue_free()
