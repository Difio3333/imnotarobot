extends Sprite2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var timer: Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.wait_time = randi_range(3,5)
	timer.start()


func _on_timer_timeout() -> void:
	Messenger.emit_signal("LOADING_FINISHED")
