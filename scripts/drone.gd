extends Area2D

var drone_speed: int = 200
@onready var animation_player: AnimationPlayer = $Sprite2D/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Messenger.connect("LEVEL_WIN",queue_free)
	animation_player.play("fly")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= (drone_speed + GVariables.global_speed) * delta
