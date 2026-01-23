extends Area2D

func _ready() -> void:
    AudioManager.play_sfx("sfx_blizzard.wav")

func _input_event(_viewport, event, shape_idx):
    if cannot_interact() or GameState.input_locked:
        return
    
    if event is InputEventMouseButton \
    and event.pressed \
    and event.button_index == MOUSE_BUTTON_LEFT:
        GameState.set_flag("window_closed")
        AudioManager.play_sfx("closing_window.wav")
        AudioManager.stop_sfx("sfx_blizzard.wav")
        AudioManager.play_sfx("sfx_blizzard_shut.wav")
             
            
func cannot_interact() -> bool:
    return GameState.has_flag("window_closed")
