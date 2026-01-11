extends Node2D

func _ready():
	pass

func _process(delta):
	pass

func _on_exit_button_button_up():
	get_tree().quit()

func _on_settings_button_button_up():
	get_tree().change_scene_to_file("res://scenes/ui/settings.tscn")
