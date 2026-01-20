extends Control

@onready var candle = $".."

func _gui_input(event):
    if event is InputEventMouseButton \
    and event.pressed \
    and event.button_index == MOUSE_BUTTON_LEFT:
        
        if not InventoryManager.has_item(Items.Id.MATCHES):
            return
        candle.light_up()
        
func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
    return data.item_id == Items.Id.MATCHES
    # return true

func _drop_data(_at_position: Vector2, data: Variant) -> void:
    if candle.is_lit == false:
          candle.light_up()
  
