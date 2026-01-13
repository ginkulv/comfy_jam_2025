extends Resource
class_name Items

enum Id {
    APPLE,
    GOLDEN_APPLE,
}

static var item_props : Dictionary = {
    # TODO: стопроц можно сделать лучше...
    Id.APPLE: 
        {
            "texture": load("res://assets/sprites/inventory_placeholder.png"),
            "name": "Apple"
        },
    Id.GOLDEN_APPLE: 
        {
            "texture": load("res://assets/sprites/golden_apple.png"),
            "name": "Golden Apple"
        }
        
}
