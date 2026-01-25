extends Node

@export var melt_time := 0.75
@export var wave_delay := 0.20

var snow_list : Array = []
var current_index : int = 0

func _ready():
	snow_list = get_tree().get_nodes_in_group("snow")
	snow_list.sort_custom(func(a, b):
		return a.snow_id < b.snow_id
	)
	GameState.OnFireplace.connect(start_melting)

func start_melting():
	for i in snow_list.size():
		melt_with_delay(snow_list[i], i)


func melt_with_delay(snow, index: int):
	var tween := create_tween()
	tween.tween_interval(index * wave_delay)
	
	tween.tween_property(snow, "modulate", Color(1, 1, 1, 0), melt_time)
	tween.tween_callback(func():
		snow.queue_free()
	)
