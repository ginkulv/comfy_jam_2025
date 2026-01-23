extends Node2D

@onready var settings_scene = preload("res://scenes/ui/settings_menu.tscn")
@onready var room_light := $"../DirectionalLight2D"

func _ready():
    LightingManager.setup(room_light)
    GameState.change_state(GameState.PLAYING)
    AudioManager.play_sfx("window_open.wav", 0.3)

func _on_exit_button_button_up():
    get_tree().quit()

func _on_settings_button_button_up():
    var settings = settings_scene.instantiate()
    add_child(settings)

func _on_play_button_button_up() -> void:
    MessageManager.display_text_by_id("1")
    queue_free()
