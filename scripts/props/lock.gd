extends Control

@onready var lock = $".."
func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
    return data.item_id == Items.Id.KEY 
    # return true

func _drop_data(_at_position: Vector2, data: Variant) -> void:
    InventoryManager.remove_item(data.item_id)
    GameState.set_flag("ladder_standing")
    AudioManager.play_sfx("sfx_pickitem.wav")
    AudioManager.add_layer()
    lock.queue_free()

func _gui_input(event):
    if event is InputEventMouseButton \
    and event.pressed \
    and event.button_index == MOUSE_BUTTON_LEFT:
        AudioManager.play_sfx("sfx_door_close.wav")
    
