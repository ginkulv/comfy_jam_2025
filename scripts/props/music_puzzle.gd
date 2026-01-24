extends Node2D

@export var correct_sequence: Array[int] = [1, 3, 2, 3, 4]

signal OnWinningTheGame

var input_sequence : Array[int] = []
var number_of_attempts : int = 0

func register_note(note_id: int) -> void:
    input_sequence.append(note_id)
    
    var index := input_sequence.size() -1
    if index >= correct_sequence.size():
        reset_sequence()
        check_number_of_attempts()
        return
    
    if input_sequence[index] != correct_sequence[index]:
        reset_sequence()
        check_number_of_attempts()
        return
    
    if input_sequence.size() == correct_sequence.size():
        emit_signal("OnWinningTheGame")
        print("Victory!")
        #запускаем финальную катсцену

func reset_sequence():
    input_sequence.clear()
    
func check_number_of_attempts():
    number_of_attempts += 1
    if number_of_attempts == 10:
        MessageManager.display_text_by_id("xylophone_10th")
    elif number_of_attempts == 20:
        MessageManager.display_text_by_id("xylophone_20th")
    elif number_of_attempts == 35:
        MessageManager.display_text_by_id("xylophone_35th")
    elif number_of_attempts == 50:
        MessageManager.display_text_by_id("xylophone_50th")
    else: return
