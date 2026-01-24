extends Node

@onready var anim = $AnimationPlayer
@onready var sprite = $Sprite2D

func _ready():
    GameState.OnOpeningTrapDoor.connect(play_animation)

func play_animation():
    sprite.visible = true
    anim.play("ladder_out")
