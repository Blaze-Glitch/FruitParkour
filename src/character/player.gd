extends CharacterBody2D

@export var SPEED = 120
@export var JUMP_VELOCITY = -280.0
@export var DOUBLE_JUMP = -225

@export var gravity = 980

@export var jumped : bool = false
@export var d_jump : bool = false

@onready var character_sprite = $AnimatedSprite2D
@onready var special_effect = $FireVFX
@onready var jump_sound_effect = $Jump

@export var effect = 0 # 0 = none, 1 = apple, 2 = banana, 3 = orange

func special_effects():
	match effect:
		0:
			SPEED = 120
			JUMP_VELOCITY = -280
			DOUBLE_JUMP = -225
			
			special_effect.play("none")
			
		1:
			SPEED = 100
			JUMP_VELOCITY = -350
			DOUBLE_JUMP = -210
			
			special_effect.play("apple")
		2:
			SPEED = 110
			JUMP_VELOCITY = -240
			DOUBLE_JUMP = -280
			
			special_effect.play("banana")
			
		3:
			SPEED = 170
			JUMP_VELOCITY = -240
			DOUBLE_JUMP = -190
			
			special_effect.play("orange")

func animations(h_axis, v_axis):
	# Direction of Looking
	if h_axis >= 0:
		character_sprite.flip_h = false
	else: 
		character_sprite.flip_h = true
	
	#Animation Player Animations
	if is_on_floor():	
		if velocity != Vector2.ZERO:
			character_sprite.play("run")
		else:
			character_sprite.play("idle")
	
	if not is_on_floor():
		if v_axis < 0 and !jumped:
			character_sprite.play("jump")
		
		elif v_axis < 0	and d_jump:
			character_sprite.play("double jump")
		
		else:
			character_sprite.play("fall")
			
func _ready():
	special_effect.play("none")

func _physics_process(delta):
	
	special_effects()
		
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		jumped = true
		
	else: 
		jumped = false
		d_jump = false
	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump_sound_effect.playing = true
		
	elif Input.is_action_just_pressed("ui_accept") and jumped and !d_jump:
		velocity.y = DOUBLE_JUMP
		d_jump = true
		
	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	animations(direction, velocity.y)
	move_and_slide()

