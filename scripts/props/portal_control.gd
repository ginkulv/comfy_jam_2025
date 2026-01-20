extends Control

@onready var portal_switcher = $".."
var pair_number : int = 1

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
    return data.item_id == Items.Id.BLUE_RUNE \
    or data.item_id == Items.Id.PURPLE_RUNE \
    or data.item_id == Items.Id.PINK_RUNE
    # return true

func _drop_data(_at_position: Vector2, data: Variant) -> void:
    InventoryManager.remove_item(data.item_id)
    portal_switcher.activate_pair(pair_number)
    pair_number += 1
