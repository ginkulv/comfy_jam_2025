extends Node

@export var gap : int = 150
@export var items_y : int = 25
@export var items_x : int = 100

var item_scene = preload("res://scenes/ui/inventory_item.tscn")

func _ready() -> void:
    InventoryManager.item_added.connect(_on_item_added)
    InventoryManager.item_removed.connect(_on_item_removed)

    # TODO: пока заглушка, просто добавляю какие-то предметы в инвентарь
    for i in range(3):
        InventoryManager.add_item(Items.Id.APPLE)
    for i in range(3):
        InventoryManager.add_item(Items.Id.GOLDEN_APPLE)


func display_item(item_id: Items.Id, offset: int) -> void:
    var item_instance = item_scene.instantiate()
    item_instance.set_item_data(item_id)
    item_instance.position = Vector2(items_x + gap * offset, items_y)
    $BackgroundRect.add_child(item_instance)

func _on_item_added(item: Items.Id) -> void:
    display_item(item, InventoryManager.items.size())

func _on_item_removed() -> void:
    for child in $BackgroundRect.get_children():
        child.queue_free()

    for i in range(InventoryManager.items.size()):
        display_item(InventoryManager.items[i], i)




# для проверки
func _on_button_button_up() -> void:
    InventoryManager.add_item(Items.Id.APPLE)

func _on_button_2_button_up() -> void:
    var item_id = InventoryManager.items[-1]
    InventoryManager.remove_item(item_id)
