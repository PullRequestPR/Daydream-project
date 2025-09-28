extends CharacterBody2D

@onready var sfx_jump: AudioStreamPlayer = $sfx_jump
@onready var anim_sprite = $Sprite2D

const SPEED = 300
const JUMP_FORCE = -400
const GRAVITY = 900
const MAX_JUMPS = 1


var jump_count = 1

func _physics_process(delta):
	velocity.y += GRAVITY * delta

	if Input.is_action_pressed("ui_right") or Input.is_action_pressed("move_right"):
		velocity.x = SPEED
		#anim_sprite.play("walking")
	elif Input.is_action_pressed("ui_left") or Input.is_action_pressed("move_left"):
		velocity.x = -SPEED
		#
		#anim_sprite.play("walking reverse")
	else:
		velocity.x = 0
		anim_sprite.play("idle")
	if (Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("jump")) and jump_count < MAX_JUMPS:
		velocity.y = JUMP_FORCE
		jump_count += 1
		$sfx_jump.play()
	
	if velocity.x == 0:
		anim_sprite.play("idle")
	elif velocity.x <= 1:
		anim_sprite.play("walking")
		anim_sprite.flip_h = true
	else:
		anim_sprite.play("walking")
		anim_sprite.flip_h = false

	if is_on_floor():
		jump_count = 0

	move_and_slide()
