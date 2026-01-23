extends Node

@onready var anim = $AnimationPlayer

func play():
    anim.play("cutscene")

    

func quit_game():
    get_tree().quit()


func _on_music_puzzle_on_winning_the_game() -> void:
    play()
