extends Area2D

func _input_event(_viewport, event, shape_idx):
    if event is InputEventMouseButton \
    and event.pressed \
    and event.button_index == MOUSE_BUTTON_LEFT:
        GameState.set_flag("window_closed")
        AudioManager.play_sfx("closing_window.wav")
             
            
