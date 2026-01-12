extends Node

var inventory_ui = preload("res://scenes/ui/inventory_ui.tscn")
var inventory_instance

var inventory_items: Array[InventoryItem]

signal item_added(inventory_item: InventoryItem)

func _ready() -> void:
    GameState.state_changed.connect(_on_game_state_changed)
    inventory_instance = inventory_ui.instantiate()
    get_tree().root.call_deferred("add_child", inventory_instance)
    inventory_instance.hide()

func add_item(inventory_item: InventoryItem) -> void: 
    inventory_items.append(inventory_item)
    item_added.emit(inventory_item)

func _on_game_state_changed(from_state: int, to_state: int) -> void:
    match to_state:
        GameState.PLAYING:
            inventory_instance.show()
        GameState.MAIN_MENU, GameState.CUTSCENE:
            inventory_instance.hide()
