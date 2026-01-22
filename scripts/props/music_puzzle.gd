extends Node2D

@export var correct_sequence: Array[int] = [1, 3, 2, 3, 4]

var input_sequence : Array[int] = []

func register_note(note_id: int) -> void:
    input_sequence.append(note_id)
    
    var index := input_sequence.size() -1
    if index >= correct_sequence.size():
        reset_sequence()
        return
    
    if input_sequence[index] != correct_sequence[index]:
        reset_sequence()
        return
    
    if input_sequence.size() == correct_sequence.size():
        print("Victory!")
        #запускаем финальную катсцену

func reset_sequence():
    input_sequence.clear()
