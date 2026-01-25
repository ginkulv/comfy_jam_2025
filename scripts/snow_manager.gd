extends Node

@export var melt_time := 0.45
@export var wave_delay := 0.05

var snow_list : Array = []
var current_index : int = 0

func _ready():
    snow_list = get_tree().get_nodes_in_group("snow")
    snow_list.sort_custom(func(a, b):
        return a.snow_id < b.snow_id
    )
    GameState.OnFireplace.connect(start_melting)

func start_melting():
    current_index = 0
    melt_next()

func melt_next():
    if current_index >= snow_list.size():
        return

    var snow = snow_list[current_index]
    current_index += 1

func melt_with_delay(snow, index: int):
	var tween := create_tween()
	tween.tween_interval(index * wave_delay)
	
	tween.tween_property(snow, "modulate", Color(1, 1, 1, 0), melt_time)
	tween.tween_callback(func():
		snow.queue_free()
	)
