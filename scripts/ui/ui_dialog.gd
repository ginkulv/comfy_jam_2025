extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    MessageManager.message_shown.connect(_on_message_shown)

func _on_message_shown(message: String) -> void:
    text = message
