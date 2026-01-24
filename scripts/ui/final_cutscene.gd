extends Node

@onready var layer = $TextureRect
@onready var anim = $AnimationPlayer

func play():
    layer.visible = true
    anim.play("win")

    

func quit_game():
    get_tree().quit()


func _on_music_puzzle_on_winning_the_game() -> void:
    play()
