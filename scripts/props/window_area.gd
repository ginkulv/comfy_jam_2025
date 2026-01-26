extends Area2D
    
var window_closed : bool = false
func _ready() -> void:
    AudioManager.play_sfx("sfx_blizzard.wav")
    AudioManager.play_sfx("window_open.wav", 0.6)
    get_node("Node2D/open").visible = true 
    if OS.has_feature("web"):
        $Node2D/open/WindowGlass0.visible = false
    get_node("Node2D/close").visible = false

func _input_event(_viewport, event, _shape_idx):
    if GameState.input_locked:
        return
    
    if window_closed:
        #MessageManager.display_text_by_id("window_after")
        return
    
    if event is InputEventMouseButton \
    and event.pressed \
    and event.button_index == MOUSE_BUTTON_LEFT:
        get_node("Node2D/open").visible = false 
        get_node("Node2D/close").visible = true 
        if OS.has_feature("web"):
            $Node2D/close/WindowGlass1.visible = false
        GameState.set_flag("window_closed")
        AudioManager.play_sfx("closing_window.wav")
        await get_tree().create_timer(0.8).timeout
        AudioManager.stop_sfx("sfx_blizzard.wav")
        AudioManager.stop_sfx("window_open.wav")
        AudioManager.play_sfx("sfx_blizzard_shut.wav", 0.1)
        window_closed = true
        $snow2.emitting = false
        
        MessageManager.display_text_by_id("window_closed")
             
