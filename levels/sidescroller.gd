extends Node2D

var drone = preload("res://scenes/drone.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	print("I spawned a drone?")
	var new_drone = drone.instantiate()
	new_drone.position.y = 100
	new_drone.position.x = get_viewport_rect().size.x + 50
	get_tree().get_root().add_child(new_drone)
