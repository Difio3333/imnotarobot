extends Node2D

@onready var robot: Sprite2D = $Robot
@onready var check: Sprite2D = $CheckButton/Check
@onready var button_check_00_pressed: Sprite2D = $CheckButton/ButtonCheck00Pressed
@onready var button_check_00_idle: Sprite2D = $CheckButton/ButtonCheck00Idle



func _ready() -> void:
	Messenger.connect("ANIMATION_FINISHED",handle_animations)

func _on_button_button_down() -> void:
	#robot.animation_player.play("robot_sus")
	
	button_check_00_idle.visible = false
	button_check_00_pressed.visible = true


func handle_animations(anim_name):
	if anim_name == "robot_sus":
		Messenger.emit_signal("LEVEL_WIN")


func _on_button_button_up() -> void:
	button_check_00_pressed.visible = false
	button_check_00_idle.visible = true
	check.visible = true	
	check.animation_player.play("check_fill")
