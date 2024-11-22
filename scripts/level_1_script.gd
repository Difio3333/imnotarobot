extends Node2D



func _on_button_button_down() -> void:
	Messenger.emit_signal("LEVEL_WIN")
