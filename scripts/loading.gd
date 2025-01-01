extends Node2D

@onready var robot: Sprite2D = $Robot
@onready var reviewing_data_label: Label = $ReviewingDataLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	robot.animation_player.play("robot_sus")
	reviewing_data_label.anim_player.play("dotdotdot")
