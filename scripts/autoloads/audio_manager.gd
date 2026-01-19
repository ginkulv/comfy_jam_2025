extends Node

const max_sfx_players: int = 10
const fade_in_time_sec: float = 3.0

var music_player: AudioStreamPlayer
var sync_stream: AudioStreamSynchronized
var music_streams: Array[Resource] = [
    preload("res://assets/music/level_1.wav"),
    preload("res://assets/music/level_2.wav"),
    preload("res://assets/music/level_3.wav"),
]
var sfx_players: Array[AudioStreamPlayer]

var bus_index: int
var sync_stream_index: int = 0

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
    sync_stream.stream_count = music_streams.size()
    for i in range(music_streams.size()):
        sync_stream.set_sync_stream(i, music_streams[i])
        sync_stream.set_sync_stream_volume(i, linear_to_db(0))
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
    sync_stream.set_sync_stream_volume(0, 0)
    music_player.play()

func add_layer() -> void:
    sync_stream_index += 1 
    if sync_stream_index >= music_streams.size():
        print("Больше нечего добавлять")
        return

    var tween = get_tree().create_tween()
    tween.tween_method(
        _change_volume_of_synced_stream, 
        -80.0, 
        0.0, 
        fade_in_time_sec
    ).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)

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

func _change_volume_of_synced_stream(volume: float) -> void:
    sync_stream.set_sync_stream_volume(sync_stream_index, volume)
