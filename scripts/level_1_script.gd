extends Node2D

@onready var robot: Sprite2D = $Robot


func _ready() -> void:
	Messenger.connect("ANIMATION_FINISHED",finish_level)

func _on_button_button_down() -> void:
	robot.animation_player.play("robot_sus")


func finish_level():
	Messenger.emit_signal("LEVEL_WIN")
