extends Control

@onready var candle = $".."

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
    return data.item_id == Items.Id.MATCHES
    # return true

func _drop_data(_at_position: Vector2, data: Variant) -> void:
    candle.light_up()
