extends Node2D

@onready var captcha_text_in: Node2D = $Control/CaptchaTextIn2
@export var check_text: Array[String] = ["Hello"]
@onready var button_normal_00_idle: Sprite2D = $ButtonNormal00Idle
@onready var button_normal_00_pressed: Sprite2D = $ButtonNormal00Pressed
@onready var verify: Label = $Verify


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_button_down() -> void:
	button_normal_00_idle.visible = false
	button_normal_00_pressed.visible = true
	verify.position.y += 1

func _on_button_button_up() -> void:
	button_normal_00_pressed.visible = false
	button_normal_00_idle.visible = true
	verify.position.y -= 1
	
	if captcha_text_in.textline.text in check_text:
		Messenger.emit_signal("LEVEL_WIN")
	else:		
		Messenger.emit_signal("LEVEL_LOSE")
	
