extends Node

@export var gap : int = 150
@export var items_y : int = 25
@export var items_x : int = 100

var item_scene = preload("res://scenes/ui/inventory_item.tscn")
var inventory_size: int = 6
var item_cells: Array[CenterContainer]
var item_data: Dictionary[int, InventoryItem]

func _ready() -> void:
    InventoryManager.item_added.connect(_on_item_added)
    InventoryManager.item_removed.connect(_on_item_removed)

    for i in range(inventory_size):
        item_cells.append(get_node("Ui_Inventory/item_cell_" + str(i)))
        item_data[i] = null

func display_item(item_id: Items.Id) -> void:
    var item_instance = item_scene.instantiate()
    item_instance.set_item_data(item_id)

    for i in range(inventory_size):
        if item_data[i] != null:
            continue
        item_cells[i].add_child(item_instance)
        item_data[i] = item_instance
        return

    print("Инвентарь полон")

func _on_item_added(item: Items.Id) -> void:
    display_item(item)

func _on_item_removed(item_id: Items.Id) -> void:
    for i in range(inventory_size):
        if item_data[i] == null:
            continue 

        if item_data[i].item_id == item_id:
            item_data[i].queue_free()
            return

# для проверки
func _on_button_button_up() -> void:
    InventoryManager.add_item(Items.Id.MATCHES)
    AudioManager.add_layer()
    MessageManager.display_text_by_id("1")

func _on_button_2_button_up() -> void:
    var item_id = InventoryManager.items[-1]
    InventoryManager.remove_item(item_id)
