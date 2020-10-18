extends Node2D


var title_screen_path := "res://project/src/TitleScreen.tscn"

onready var player := $Player
onready var player_cam := $Player/PlayerCam
onready var intro_popup := $IntroPopup
onready var pause_popup := $PausePopup
onready var book_spawn := $BookPath/BookSpawnLocation

export (PackedScene) var Book


func _ready():
	intro_popup.visible = true
	yield(get_tree().create_timer(5.0), "timeout")
	intro_popup.visible = false
	
	randomize()


func _process(_delta):
	if Input.is_action_just_pressed("pause_game"):
		get_tree().paused = true
		var screen_center = player_cam.get_camera_screen_center()
		pause_popup.set_position(Vector2(screen_center.x-218.5, screen_center.y - 96.5))
		pause_popup.show()


func _on_BookTimer_timeout():
	book_spawn.offset = randi()
	var book = Book.instance()
	add_child(book)
	
	book.position = book_spawn.position
	
	book.linear_velocity = Vector2(0, rand_range(book.min_speed(), book.max_speed()))


func _on_MainMenu():
	var _ignored = get_tree().change_scene(title_screen_path)
	get_tree().paused = false


func _on_Resume():
	pause_popup.hide()
	get_tree().paused = false
