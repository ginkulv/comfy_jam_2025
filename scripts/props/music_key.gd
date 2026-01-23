extends Area2D

@export var note_id : int
@export var puzzle: Node2D
@export var required_flag : String = "room_unfrozen"
@export var flag_for_message : String = "note_played"



func _input_event(_viewport, event, _shape_idx):
    if can_play() == false:
        return
    
    if event is InputEventMouseButton \
    and event.pressed \
    and event.button_index == MOUSE_BUTTON_LEFT:
        puzzle.register_note(note_id)
        var note_name = str(note_id)
        AudioManager.play_sfx("sfx_xylophone_" + note_name + ".wav", 1.4)
        if not note_played():
            GameState.set_flag("note_played")
            MessageManager.display_text_by_id("xylophone_start")
       
        print(note_name)
        
   
func can_play() -> bool:
    return GameState.has_flag(required_flag)
 
func note_played() -> bool:
    return GameState.has_flag(flag_for_message)
