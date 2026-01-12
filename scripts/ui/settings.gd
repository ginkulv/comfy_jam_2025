extends Node

func _ready():
    pass

func _process(delta):
    pass

func _on_back_button_button_up():
    get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")
