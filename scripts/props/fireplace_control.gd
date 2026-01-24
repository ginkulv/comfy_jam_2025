extends Control

@onready var anim = $"../AnimatedSprite2D"

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
    return data.item_id == Items.Id.FIREWOOD 
    # return true

func _drop_data(_at_position: Vector2, data: Variant) -> void:
    InventoryManager.remove_item(data.item_id)
    AudioManager.play_sfx("sfx_fireplace.mp3", 0.8)
    GameState.set_flag("room_unfrozen")
    GameState.emit_signal("OnFireplace")
    AudioManager.add_layer()
    MessageManager.display_text_by_id("fireplace_lit")
    anim.visible = true

func _gui_input(event):
    if event is InputEventMouseButton \
    and event.pressed \
    and event.button_index == MOUSE_BUTTON_LEFT:
        MessageManager.display_text_by_id("fireplace_not_lit")
