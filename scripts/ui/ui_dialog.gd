extends Label

const duration_modifier: float = 1.0 / 30.0

func _ready() -> void:
    MessageManager.message_shown.connect(_on_message_shown)

func _on_message_shown(message: String) -> void:
    visible_ratio = 0
    text = message
    var tween = get_tree().create_tween()
    tween.tween_property(self, "visible_ratio", 1, message.length() * duration_modifier
)
