extends Control
class_name InventoryItem

@export var item_name: String
@export var texture: Texture2D

func set_item_data(item_dict: Dictionary) -> void:
    $ItemSprite.texture = item_dict["texture"]
    item_name = item_dict["name"]

func _on_gui_input(event: InputEvent) -> void:
    if event is InputEventMouseButton and event.pressed:
        print("Selected item: ", item_name)
