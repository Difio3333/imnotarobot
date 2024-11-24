extends Node2D

@onready var captcha_text_in: TextEdit = $Control/CaptchaTextIn2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	if captcha_text_in.text == "32sdfj47HR":
		Messenger.emit_signal("LEVEL_WIN")
	else:
		Messenger.emit_signal("LEVEL_LOSE")
