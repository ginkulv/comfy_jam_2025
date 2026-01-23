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
    MessageManager.display_text_by_id("ladder_found")
    var tween = create_tween()
    tween.tween_property(lock, "modulate:a", 0.0, 0.5)
    tween.tween_callback(lock.queue_free)

func _gui_input(event):
    if event is InputEventMouseButton \
    and event.pressed \
    and event.button_index == MOUSE_BUTTON_LEFT:
        AudioManager.play_sfx("sfx_door_close.wav")
        MessageManager.display_text_by_id("ladder_not_found")
    
