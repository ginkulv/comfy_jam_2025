extends Node

@export var gap : int = 150

var item_sprites : Array[Sprite2D]

func _ready() -> void:
    InventoryManager.item_added.connect(_on_item_added)

    # TODO: пока заглушка, просто добавляю какие-то предметы в инвентарь
    var image = Image.load_from_file("res://assets/sprites/inventory_placeholder.png")
    var texture = ImageTexture.create_from_image(image)
    var item = InventoryItem.new("Placeholder", texture)
    for i in range(6):
        InventoryManager.add_item(item)

func _on_item_added(inventory_item: InventoryItem) -> void:
    var item_sprite = Sprite2D.new()
    item_sprite.texture = inventory_item.texture
    item_sprite.position = Vector2(550 + item_sprites.size() * gap, 990)
    item_sprites.append(item_sprite)
    add_child(item_sprite)
