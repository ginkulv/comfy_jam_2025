extends Node

@onready var settings_scene = preload("res://scenes/ui/settings.tscn")

func _on_resume_button_button_up() -> void:
    GameState.change_state(GameState.PLAYING)
    queue_free()


func _on_settings_button_button_up() -> void:
    var settings = settings_scene.instantiate()
    add_child(settings)

func _on_go_to_menu_button_button_up() -> void:
    get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")
    GameState.change_state(GameState.MAIN_MENU)
    queue_free()
