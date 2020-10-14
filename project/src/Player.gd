extends KinematicBody2D


const RUN_SPEED := 60
const JUMP_SPEED := -250
const GRAVITY := 10

var velocity := Vector2()


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
	
	velocity = move_and_slide(velocity, Vector2.UP)
