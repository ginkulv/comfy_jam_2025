extends Control

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
    return data.item_id == Items.Id.APPLE
    # return true

func _drop_data(_at_position: Vector2, data: Variant) -> void:
    InventoryManager.remove_item(data.item_id)
