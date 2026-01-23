extends Area2D
    
var window_closed : bool = false
func _ready() -> void:
    AudioManager.play_sfx("sfx_blizzard.wav")
    AudioManager.play_sfx("window_open.wav", 0.3)

func _input_event(_viewport, event, _shape_idx):
    if GameState.input_locked:
        return
    
    if window_closed:
        MessageManager.display_text_by_id("window_after")
        return
    
    if event is InputEventMouseButton \
    and event.pressed \
    and event.button_index == MOUSE_BUTTON_LEFT:
        GameState.set_flag("window_closed")
        AudioManager.play_sfx("closing_window.wav")
        await get_tree().create_timer(0.8).timeout
        AudioManager.stop_sfx("sfx_blizzard.wav")
        AudioManager.stop_sfx("window_open.wav")
        AudioManager.play_sfx("sfx_blizzard_shut.wav", 0.05)
        await get_tree().create_timer(0.5).timeout
        MessageManager.display_text_by_id("window_closed")
             
