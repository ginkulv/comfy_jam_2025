extends Node

var directional_light: DirectionalLight2D
var base_energy : float = 0.93
var energy_per_lamp : float = -0.02

var lamps := {}
var lit_count : int = 0

func setup(light: DirectionalLight2D) -> void:
	directional_light = light
	update_light()

func register(lamp):
	lamps[lamp.lamp_id] = lamp

func on_lamp_lit():
	lit_count += 1
	update_light()
	check_all_lit()

func update_light():
	if directional_light == null:
		return
	
	directional_light.energy = base_energy + lit_count * energy_per_lamp

func check_all_lit():
	if lit_count == lamps.size():
		GameState.set_flag("all_lamps_lit")
		AudioManager.add_layer()
		AudioManager.add_layer()
