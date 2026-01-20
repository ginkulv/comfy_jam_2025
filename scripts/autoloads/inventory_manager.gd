extends Node

var inventory_ui = preload("res://scenes/ui/inventory_ui.tscn")
var inventory_instance

var items: Array[Items.Id]

signal item_added(item_id: Items.Id)
signal item_removed(item_id: Items.Id)

func _ready() -> void:
    GameState.state_changed.connect(_on_game_state_changed)

    inventory_instance = inventory_ui.instantiate()
    get_tree().root.call_deferred("add_child", inventory_instance)
    inventory_instance.hide()

func add_item(item_id: Items.Id) -> void: 
    item_added.emit(item_id)
    items.append(item_id)

func remove_item(item_id: Items.Id) -> void: 
    items.erase(item_id)
    item_removed.emit(item_id)

func has_item(item_id: Items.Id) -> bool:
    return items.has(item_id)

func _on_game_state_changed(_from_state: int, to_state: int) -> void:
    match to_state:
        GameState.PLAYING:
            inventory_instance.show()
        GameState.MAIN_MENU, GameState.CUTSCENE:
            inventory_instance.hide()
