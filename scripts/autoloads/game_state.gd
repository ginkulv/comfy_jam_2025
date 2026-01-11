extends Node

enum {
    MAIN_MENU,
    PLAYING,
    CUTSCENE,
}

signal state_changed(from_state: int, to_state: int)

var current_state: int = MAIN_MENU

func change_state(new_state: int) -> void:
    state_changed.emit(current_state, new_state)
    current_state = new_state
