extends Area2D

var is_lit : bool = false
@export var lamp_id: int

func _ready():
    LightingManager.register(self)
    

func light_up():
    if is_lit:
        return
    is_lit = true
    LightingManager.on_lamp_lit()
    $on.visible = is_lit
    $off.visible = false
    AudioManager.play_sfx("sfx_"+name+"_on.wav")
    if not AudioManager.is_music_playing():
        AudioManager.start_music()
    
