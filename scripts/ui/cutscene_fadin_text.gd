extends RichTextLabel

signal fade_completed

@export var next_button: Button
@export var fade_duration: float = 3.0
@export var fade_start_offset: float = -20.0
@export var fade_length: int = 10
@export var fade_button_start: float = 3

var input_timeout : float = 5.5

func _ready() -> void:
    start_fade_effect()
    GameState.input_locked = true

func start_fade_effect():
    var tween = create_tween()
    var start_value = fade_start_offset
    var end_value = get_total_character_count() + fade_length
    
    if next_button:
        next_button.visible = false
        next_button.disabled = true
    
    tween.tween_method(_apply_fade, start_value, end_value, fade_duration)
    tween.finished.connect(_on_tween_finished)

func _apply_fade(value: float):
    var current_bbcode: String = "[fade start=" + str(int(value)) + " length=" + str(fade_length) + "]" + text + "[/fade]"
    parse_bbcode(current_bbcode)

func _on_tween_finished():
    parse_bbcode(text)  
    
    if next_button:
        next_button.visible = true
        next_button.disabled = false
        var button_tween = create_tween()
        next_button.modulate = Color.TRANSPARENT
        button_tween.tween_property(next_button, "modulate", Color.WHITE,fade_button_start)
    
    emit_signal("fade_completed")
    


func _on_button_button_down() -> void:
    $"../../AnimationPlayer".play("start_game")
    await get_tree().create_timer(input_timeout).timeout
    GameState.input_locked = false
    MessageManager.display_text_by_id("start")
    next_button.disabled = true
    
