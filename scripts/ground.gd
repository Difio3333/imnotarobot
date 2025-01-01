extends Area2D

var ground_speed: int = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Messenger.connect("LEVEL_WIN",queue_free)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity = (ground_speed + GVariables.global_speed) * delta
	position.x -= velocity
