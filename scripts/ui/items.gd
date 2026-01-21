extends Resource
class_name Items

enum Id {
    MATCHES,
    FIREWOOD,
    PINK_RUNE,
    BLUE_RUNE,
    PURPLE_RUNE,
    GLOWING_RUNE,
    KEY
}

static var item_props : Dictionary = {
    Id.MATCHES: 
        {
            "texture": load("res://assets/sprites/atlas/ui_item_spichki.tres"),
            "name": "Golden Apple"
        },
    Id.FIREWOOD: 
        {
            "texture": load("res://assets/sprites/atlas/ui_item_drova.tres"),
            "name": "Firewood"
        },
    Id.PINK_RUNE: 
        {
            "texture": load("res://assets/sprites/atlas/ui_item_rune_pink.tres"),
            "name": "Pink rune"
        },
    Id.BLUE_RUNE: 
        {
            "texture": load("res://assets/sprites/atlas/ui_item_rune_blue.tres"),
            "name": "Blue rune"
        },
    Id.PURPLE_RUNE: 
        {
            "texture": load("res://assets/sprites/atlas/ui_item_rune_purple.tres"),
            "name": "Purple rune"
        },
    Id.GLOWING_RUNE: 
        {
            "texture": load("res://assets/sprites/atlas/ui_item_rune_glowing.tres"),
            "name": "Glowing rune"
        },
        Id.KEY: 
        {
            "texture": load("res://assets/sprites/atlas/ui_item_key.tres"),
            "name": "Key"
        }
}
