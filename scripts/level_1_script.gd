extends Node2D

@onready var robot: Sprite2D = $Robot


func _ready() -> void:
	Messenger.connect("ANIMATION_FINISHED",handle_animations)

func _on_button_button_down() -> void:
	robot.animation_player.play("robot_sus")

func handle_animations(anim_name):
	if anim_name == "robot_sus":
		Messenger.emit_signal("LEVEL_WIN")
