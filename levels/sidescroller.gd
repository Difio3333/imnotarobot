extends Node2D

var drone = preload("res://scenes/drone.tscn")
var clouds = preload("res://scenes/clouds.tscn")
var ground = preload("res://scenes/ground.tscn")

@onready var first_ground: Area2D = $Ground
@onready var first_clouds: Area2D = $Clouds

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_ground()
	spawn_clouds()

func _on_timer_timeout() -> void:
	
	var new_drone = drone.instantiate()
	new_drone.position.y = randi_range(100,250)
	new_drone.position.x = get_viewport_rect().size.x + 50
	get_tree().get_root().add_child(new_drone)


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Ground"):
		spawn_ground()

func spawn_ground():
	var new_ground = ground.instantiate()
	new_ground.position.y = first_ground.position.y
	new_ground.position.x = get_viewport_rect().size.x + 300
	get_tree().get_root().add_child.call_deferred(new_ground)
	GVariables.global_speed += 0.5
	
func spawn_clouds():
	var new_clouds = clouds.instantiate()
	new_clouds.position.y = first_clouds.position.y
	new_clouds.position.x = get_viewport_rect().size.x + 320
	get_tree().get_root().add_child.call_deferred(new_clouds)

func _on_cloud_spawner_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("Clouds"):
		spawn_clouds()
