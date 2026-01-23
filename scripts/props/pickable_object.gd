extends Area2D

var mouse_over : bool = false
@export var item_id : Items.Id
@export var required_flag := ""
@export var message_1 : String
@export var message_2 : String

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
            if not can_pick():
                MessageManager.display_text_by_id(message_1)
                return
            
            on_left_click()
            
func on_left_click():
    InventoryManager.add_item(item_id)
    AudioManager.play_sfx("sfx_pickitem.wav")
    MessageManager.display_text_by_id(message_2)
    queue_free()

func can_pick() -> bool:
    if required_flag == "":
        return true
    return GameState.has_flag(required_flag)
