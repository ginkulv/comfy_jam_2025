extends Resource
class_name InventoryItem

@export var name: String
@export var texture: Texture2D

func _init(item_name: String, item_texture: Texture2D) -> void:
    name = item_name
    texture = item_texture
