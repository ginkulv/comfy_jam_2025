extends Area2D
    

func _input_event(_viewport, event, _shape_idx):
    if cannot_interact() or GameState.input_locked:
        return
    
    if event is InputEventMouseButton \
    and event.pressed \
    and event.button_index == MOUSE_BUTTON_LEFT:
        GameState.set_flag("window_closed")
        AudioManager.play_sfx("closing_window.wav")
        AudioManager.stop_sfx("window_open.wav")
        
             
            
func cannot_interact() -> bool:
    return GameState.has_flag("window_closed")
