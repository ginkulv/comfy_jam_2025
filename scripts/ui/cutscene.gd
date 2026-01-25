extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    play_cutscene()


func play_game() -> void:
    GameState.change_state(GameState.PLAYING)
    
func play_cutscene() -> void:
    GameState.change_state(GameState.CUTSCENE)

func stop_music_on_ending() -> void: 
    AudioManager.fade_out_music()
    AudioManager.fade_in_sfx("sfx_blizzard.wav")

func _on_music_puzzle_on_winning_the_game() -> void:
    play_cutscene()
