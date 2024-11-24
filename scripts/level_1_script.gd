extends Node2D

@onready var robot: Sprite2D = $Robot
@onready var check: Sprite2D = $CheckButton/Check
@onready var button_check_00_pressed: Sprite2D = $CheckButton/ButtonCheck00Pressed
@onready var button_check_00_idle: Sprite2D = $CheckButton/ButtonCheck00Idle
@onready var check_button: Node = $CheckButton
@onready var reviewing_data_label: Label = $ReviewingDataLabel



func _ready() -> void:
	Messenger.connect("ANIMATION_FINISHED",handle_animations)

func _on_button_button_down() -> void:

	button_check_00_idle.visible = false
	button_check_00_pressed.visible = true


func handle_animations(anim_name):
	if anim_name == "robot_sus":
		Messenger.emit_signal("LEVEL_WIN")
	elif anim_name == "check_fill":
		check_button.queue_free()
		robot.visible = true
		reviewing_data_label.visible = true
		robot.animation_player.play("robot_sus")
		
func _on_button_button_up() -> void:
	button_check_00_pressed.visible = false
	button_check_00_idle.visible = true
	check.visible = true	
	check.animation_player.play("check_fill")
	
