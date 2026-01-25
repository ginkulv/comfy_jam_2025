extends PointLight2D

var is_lit : bool = false
@export var lamp_id: int

func _ready():
    LightingManager.register(self)
    enabled = false
    

func light_up():
    if is_lit:
        return
    is_lit = true
    LightingManager.on_lamp_lit()
    if not OS.has_feature("web"):
        $lamp/on.visible = is_lit
    # ?? 
    # $lamp/off.visible = false
    enabled = true
    AudioManager.play_sfx("sfx_matches.wav")
    if not AudioManager.is_music_playing():
        AudioManager.start_music()
    
