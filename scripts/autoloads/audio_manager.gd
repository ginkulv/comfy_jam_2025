extends Node

var bus_names = ["SFX", "Music" ]
var music_player: AudioStreamPlayer
var sfx_player: AudioStreamPlayer
var bus_index : int

@export var music_volume_ln : float = 80
@export var sfx_volume_ln : float = 80

func _ready() -> void:
    process_mode = Node.PROCESS_MODE_ALWAYS

    bus_index = AudioServer.get_bus_index("SFX")
    if bus_index == -1:
        AudioServer.add_bus()
        AudioServer.set_bus_name(AudioServer.bus_count - 1, "SFX")
    AudioServer.set_bus_volume_linear(bus_index, sfx_volume_ln / 100)

    bus_index = AudioServer.get_bus_index("Music")
    if bus_index == -1:
        AudioServer.add_bus()
        AudioServer.set_bus_name(AudioServer.bus_count - 1, "Music")
    AudioServer.set_bus_volume_linear(bus_index, music_volume_ln / 100)

    music_player = AudioStreamPlayer.new()
    music_player.bus = "Music"
    add_child(music_player)

    sfx_player = AudioStreamPlayer.new()
    sfx_player.bus = "SFX"
    add_child(sfx_player)

func play_sfx(sfx_name_with_extension: String) -> void:
    sfx_player.stream = load("res://assets/sfx/" + sfx_name_with_extension)
    sfx_player.play()

func play_music(music_name_with_extension: String) -> void:
    var stream = load("res://assets/music/" + music_name_with_extension)
    stream.loop = true
    music_player.stream = stream
    music_player.play()

func change_sfx_volume(volume: float) -> void:
    sfx_volume_ln = volume
    bus_index = AudioServer.get_bus_index("SFX")
    AudioServer.set_bus_volume_linear(bus_index, volume / 100)


func change_music_volume(volume: float) -> void:
    music_volume_ln = volume
    bus_index = AudioServer.get_bus_index("Music")
    AudioServer.set_bus_volume_linear(bus_index, volume / 100)
