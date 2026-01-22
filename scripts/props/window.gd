extends Control

@onready var window = $".."

func _gui_input(event):
    if GameState.input_locked == true:
        return
        
    if event is InputEventMouseButton \
    and event.pressed \
    and event.button_index == MOUSE_BUTTON_LEFT:
        #закрываем окно, приглушаем метель etc.
        GameState.set_flag("window_closed")
        print("window closed")
        
