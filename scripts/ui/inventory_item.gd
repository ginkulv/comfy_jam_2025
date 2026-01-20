extends Control
class_name InventoryItem

@export var item_id: Items.Id
@export var item_name: String
@export var texture: Texture2D

func set_item_data(item_id: Items.Id) -> void:
    var item_props = Items.item_props[item_id]
    $ItemSprite.texture = item_props["texture"]
    item_name = item_props["name"]
    self.item_id = item_id

func _get_drag_data(_at_position: Vector2) -> Variant:
    if GameState.current_state == GameState.PAUSE_MENU:
        return null
    var preview = self.duplicate()
    set_drag_preview(preview)
    hide()
    return self

func _notification(what: int) -> void:
    if what == NOTIFICATION_DRAG_END:
        show()

func _on_mouse_entered() -> void:
    print("sdlkSLKD")
    AudioManager.play_sfx("click" + ".mp3")
    var tween = get_tree().create_tween()
    tween.tween_property($ItemSprite, "scale", Vector2(1.3, 1.3), 0.1)


func _on_mouse_exited() -> void:
    var tween = get_tree().create_tween()
    tween.tween_property($ItemSprite, "scale", Vector2(1, 1), 0.1)
