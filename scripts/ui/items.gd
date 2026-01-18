extends Resource
class_name Items

enum Id {
    MATCHES,
    FIREWOOD,
    RED_RUNE,
    BLUE_RUNE,
    GREEN_RUNE,
    LIGHTHOUSE_RUNE
}

static var item_props : Dictionary = {
    # TODO: стопроц можно сделать лучше...
    Id.FIREWOOD: 
        {
            "texture": load("res://assets/sprites/golden_apple.png"),
            "name": "Firewood"
        },
    Id.MATCHES: 
        {
            "texture": load("res://assets/sprites/golden_apple.png"),
            "name": "Golden Apple"
        },
        Id.RED_RUNE: 
        {
            "texture": load("res://assets/sprites/inventory_placeholder.png"),
            "name": "Red Rune"
        },
        Id.BLUE_RUNE: 
        {
            "texture": load("res://assets/sprites/inventory_placeholder.png"),
            "name": "Blue Rune"
        }
        
}
