extends Control

@onready var anim = $"../fireplace"

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	return data.item_id == Items.Id.FIREWOOD 
	# return true

func _drop_data(_at_position: Vector2, data: Variant) -> void:
<<<<<<< HEAD
	InventoryManager.remove_item(data.item_id)
	AudioManager.play_sfx("sfx_fireplace.wav")
	GameState.set_flag("room_unfrozen")
	AudioManager.add_layer()
	MessageManager.display_text_by_id("fireplace_lit")
	anim.visible = true
=======
    InventoryManager.remove_item(data.item_id)
    AudioManager.play_sfx("sfx_fireplace.mp3", 0.8)
    GameState.set_flag("room_unfrozen")
    GameState.emit_signal("OnFireplace")
    AudioManager.add_layer()
    MessageManager.display_text_by_id("fireplace_lit")
    anim.visible = true
>>>>>>> 2e993ce3cbdfa79e1b5080031aa4db3505143ca3

func _gui_input(event):
	if event is InputEventMouseButton \
	and event.pressed \
	and event.button_index == MOUSE_BUTTON_LEFT:
		MessageManager.display_text_by_id("fireplace_not_lit")
