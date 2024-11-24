extends CharacterBody2D


const SPEED = 300.0
@export var jump_velocity:float = 403.0
@onready var anim_player: AnimationPlayer = $Sprite2D/AnimationPlayer

func _ready() -> void:
	anim_player.play("walk")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if is_on_floor() and anim_player.current_animation == "jump":
		anim_player.play("walk")
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = -jump_velocity
		anim_player.play("jump")
	
	move_and_slide()


func _on_hit_box_area_entered(area: Area2D) -> void:
	print("Something hit me")
