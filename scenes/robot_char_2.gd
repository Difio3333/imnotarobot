extends CharacterBody2D

@export var JUMP_VELOCITY = -500.0
@onready var anim_player: AnimationPlayer = $Sprite2D/AnimationPlayer

func _ready():
	anim_player.play("walk")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if is_on_floor() and anim_player.current_animation == "jump":
		anim_player.play("walk")
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		anim_player.play("jump")
		velocity.y = JUMP_VELOCITY
	

	move_and_slide()



func _on_hit_box_area_entered(area: Area2D) -> void:
	print(area)
	if area.is_in_group("Drone"):
		Messenger.emit_signal("LEVEL_WIN")
	elif area.is_in_group("Clouds"):
		print("I collided with the clouds!!!!")
