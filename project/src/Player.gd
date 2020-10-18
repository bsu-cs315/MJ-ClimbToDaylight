extends KinematicBody2D


signal hit(body_id)

const RUN_SPEED := 150
const JUMP_SPEED := -625
const GRAVITY := 25

var velocity := Vector2()

onready var player_sprite := $AnimatedSprite
onready var player_cam := $PlayerCam setget , player_cam
onready var screen_size := get_viewport_rect().size

onready var player_area_shape := $PlayerArea/PlayerAreaShape


func _ready():
	player_cam.offset = Vector2(640, -240)


func _physics_process(_delta):
	velocity.y += GRAVITY
	
	if Input.is_action_pressed("move_right"):
		velocity.x = RUN_SPEED
		player_sprite.flip_h = false
	elif Input.is_action_pressed("move_left"):
		velocity.x = -RUN_SPEED
		player_sprite.flip_h = true
	else:
		velocity.x = 0
	
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_SPEED
	
	determine_animation()
	position.x = wrapf(position.x, 0, screen_size.x)
	velocity = move_and_slide(velocity, Vector2.UP)


func determine_animation():
	if is_on_floor():
		player_sprite.animation = "run" if abs(velocity.x) > 0 else "idle"
	else:
		player_sprite.animation = "idle" if velocity.y > 0 else "jump"
	
	if velocity != Vector2.ZERO:
		player_sprite.play()


func player_cam():
	return player_cam


func _on_PlayerArea_body_shape_entered(body_id, _body, _body_shape, _area_shape):
	emit_signal("hit", body_id)
