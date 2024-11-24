extends Sprite2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	Messenger.emit_signal("ANIMATION_FINISHED",anim_name)
