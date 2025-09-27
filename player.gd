extends CharacterBody2D

const SPEED = 200
const JUMP_FORCE = -400
const GRAVITY = 900

func _physics_process(delta):
	velocity.y += GRAVITY * delta

	if Input.is_action_pressed("ui_right") or Input.is_action_pressed("move_right"):
		velocity.x = SPEED
	elif Input.is_action_pressed("ui_left") or Input.is_action_pressed("move_left"):
		velocity.x = -SPEED
	else:
		velocity.x = 0

	if is_on_floor() and (Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("jump")):
		velocity.y = JUMP_FORCE

	move_and_slide()
