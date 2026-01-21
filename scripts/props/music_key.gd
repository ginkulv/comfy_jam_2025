extends Area2D

@export var note_id : int
@export var puzzle: Node2D


func _input_event(viewport, event, shape_idx):
    if event is InputEventMouseButton \
    and event.pressed \
    and event.button_index == MOUSE_BUTTON_LEFT:
        puzzle.register_note(note_id)
        AudioManager.play_sfx("click" + ".mp3")
        print("music")
   
