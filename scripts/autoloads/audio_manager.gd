extends Node

const max_sfx_players: int = 10
const music_stream_count: int = 3

var bus_names = ["SFX", "Music"]

var music_player: AudioStreamPlayer
var sync_stream: AudioStreamSynchronized
var sfx_players: Array[AudioStreamPlayer]

var bus_index: int
var cur_sync_stream_index: int = 0

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

    sync_stream = AudioStreamSynchronized.new()
    sync_stream.stream_count = music_stream_count
    sync_stream.set_sync_stream(0, load("res://assets/music/level_1.wav"))
    sync_stream.set_sync_stream(1, load("res://assets/music/level_2.wav"))
    sync_stream.set_sync_stream(2, load("res://assets/music/level_3.wav"))
    sync_stream.set_sync_stream_volume(1, linear_to_db(0))
    sync_stream.set_sync_stream_volume(2, linear_to_db(0))
    music_player.stream = sync_stream

    for i in range(max_sfx_players):
        var sfx_player = AudioStreamPlayer.new()
        sfx_player.bus = "SFX"
        sfx_players.append(sfx_player)
        add_child(sfx_player)

func play_sfx(sfx_name_with_extension: String, loop: bool = false) -> void:
    var stream = load("res://assets/sfx/" + sfx_name_with_extension)
    stream.loop = loop

    for player in sfx_players:
        if !player.playing:
            player.stream = stream
            player.play()
            break

func stop_sfx(sfx_name_with_extension: String) -> void:
    for player in sfx_players:
        if not player.stream:
            continue
        if player.stream.resource_path.get_file() == sfx_name_with_extension:
            player.stop()

func start_music() -> void:
    music_player.play()

func add_layer() -> void:
    cur_sync_stream_index += 1 
    if cur_sync_stream_index >= music_stream_count:
        print("Больше нечего добавлять")
        return
    var tween = get_tree().create_tween()
    # tween.tween_method(_change_volume_of_synced_stream, linear_to_db(0), 0, 5.0)
    sync_stream.set_sync_stream_volume(cur_sync_stream_index, 0)

func stop_music():
    music_player.stop()

func change_sfx_volume(volume: float) -> void:
    sfx_volume_ln = volume
    bus_index = AudioServer.get_bus_index("SFX")
    AudioServer.set_bus_volume_linear(bus_index, volume / 100)

func change_music_volume(volume: float) -> void:
    music_volume_ln = volume
    bus_index = AudioServer.get_bus_index("Music")
    AudioServer.set_bus_volume_linear(bus_index, volume / 100)
    print(music_volume_ln)

func _change_volume_of_synced_stream(volume: float) -> void:
    sync_stream.set_sync_stream_volume(cur_sync_stream_index, volume)
