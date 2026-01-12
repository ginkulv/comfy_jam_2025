extends Node

var inventory_ui = preload("res://scenes/ui/inventory_ui.tscn")
var inventory_instance

var items: Array[Items.Name]

signal item_added(item_name: Items.Name)
signal item_removed()

func _ready() -> void:
    GameState.state_changed.connect(_on_game_state_changed)
    inventory_instance = inventory_ui.instantiate()
    get_tree().root.call_deferred("add_child", inventory_instance)
    inventory_instance.hide()

func add_item(item_name: Items.Name) -> void: 
    item_added.emit(item_name)
    items.append(item_name)

func remove_item(item_name: Items.Name) -> void: 
    items.erase(item_name)
    item_removed.emit()

func _on_game_state_changed(_from_state: int, to_state: int) -> void:
    match to_state:
        GameState.PLAYING:
            inventory_instance.show()
        GameState.MAIN_MENU, GameState.CUTSCENE:
            inventory_instance.hide()
