extends KinematicBody2D


const RUN_SPEED := 150
const JUMP_SPEED := -625
const GRAVITY := 25

var velocity := Vector2()

onready var player_sprite = $AnimatedSprite


func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	velocity.y += GRAVITY
	
	if Input.is_action_pressed("move_right"):
		velocity.x = RUN_SPEED
	elif Input.is_action_pressed("move_left"):
		velocity.x = -RUN_SPEED
	else:
		velocity.x = 0
	
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_SPEED
	
	determine_animation()
	velocity = move_and_slide(velocity, Vector2.UP)


func determine_animation():
	if is_on_floor():
		player_sprite.animation = "run" if abs(velocity.x) > 0 else "idle"
	else:
		player_sprite.animation = "idle" if velocity.y > 0 else "jump"
	
	player_sprite.flip_h = true if velocity.x < 0 else false
	
	if velocity != Vector2.ZERO:
		player_sprite.play()
