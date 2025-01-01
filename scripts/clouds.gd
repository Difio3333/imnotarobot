extends Area2D

var cloud_speed: int = 70
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Messenger.connect("LEVEL_WIN",queue_free)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= (cloud_speed + GVariables.global_speed) * delta
