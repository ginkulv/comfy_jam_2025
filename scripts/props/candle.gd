extends Area2D

var is_lit : bool = false

#зажечься
func light_up():
    if is_lit or GameState.input_locked == true:
        return
    
    is_lit = true
    modulate = Color.RED
