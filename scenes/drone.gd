extends Area2D

@export var drone_speed: int = 10
@onready var animation_player: AnimationPlayer = $Sprite2D/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play("fly")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= drone_speed
