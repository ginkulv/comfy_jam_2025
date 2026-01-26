extends Label

const duration_modifier: float = 1.0 / 30.0
var current_tween = null

func _ready() -> void:
    MessageManager.message_shown.connect(_on_message_shown)

func _on_message_shown(message: String) -> void:
    if current_tween and current_tween.is_running():
        current_tween.kill()
    AudioManager.stop_sfx("typewriter.wav")
    
    AudioManager.play_sfx("typewriter.wav", 0.6)
    visible_ratio = 0
    text = message
    current_tween = get_tree().create_tween()
    current_tween.tween_property(self, "visible_ratio", 1, message.length() * duration_modifier)
    await current_tween.finished
    AudioManager.stop_sfx("typewriter.wav")
