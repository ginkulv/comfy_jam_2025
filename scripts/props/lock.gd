extends Control

@onready var lock = $".."
@onready var open_sprite = $"../open_sprite"
@onready var closed_sprite = $"../closed_sprite"
@onready var lock_sprite = $"../closed_sprite/lock_sprite"

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
    return data.item_id == Items.Id.KEY 
    # return true

func _drop_data(_at_position: Vector2, data: Variant) -> void:
    InventoryManager.remove_item(data.item_id)
    closed_sprite.visible = false
    open_sprite.visible = true
    GameState.set_flag("ladder_standing")
    AudioManager.play_sfx("sfx_pickitem.wav")
    AudioManager.add_layer()
    MessageManager.display_text_by_id("ladder_found")
    var tween = create_tween()
    tween.tween_property(lock_sprite, "modulate:a", 0.0, 0.5)
    tween.tween_callback(lock_sprite.queue_free)
    GameState.emit_signal("OnOpeningTrapDoor")
    await get_tree().create_timer(3).timeout
    close_the_trapdoor()

func _gui_input(event):
    if GameState.input_locked == true:
        return
        
    if event is InputEventMouseButton \
    and event.pressed \
    and event.button_index == MOUSE_BUTTON_LEFT:
        AudioManager.play_sfx("sfx_door_close.wav")
        MessageManager.display_text_by_id("ladder_not_found")
    
func close_the_trapdoor():
    open_sprite.visible = false
    closed_sprite.visible = true
        
