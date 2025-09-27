extends CharacterBody2D

const SPEED = 200
const JUMP_FORCE = -400
const GRAVITY = 900

func _physics_process(delta):
	velocity.y += GRAVITY * delta

	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
	else:
		velocity.x = 0

	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		velocity.y = JUMP_FORCE

	move_and_slide()
