extends Node2D


var title_screen_path := "res://project/src/TitleScreen.tscn"

onready var player := $Player
onready var player_cam := $Player/PlayerCam
onready var win_hud := $WinHUD
onready var game_over_hud := $GameOverHUD
onready var intro_popup := $IntroPopup
onready var pause_popup := $PausePopup

onready var book_spawn := $BookPath/BookSpawnLocation

export (PackedScene) var Book
var book_body_ids := []


func _ready():
	intro_popup.visible = true
	yield(get_tree().create_timer(5.0), "timeout")
	intro_popup.visible = false
	
	randomize()


func kill_player():
	player.queue_free()
	set_correct_hud("dead")


func win_player():
	player.queue_free()
	set_correct_hud("win")


func set_correct_hud(player_condition):
	if player_condition == "win":
		win_hud.visible = true
	elif player_condition == "dead":
		game_over_hud.visible = true


func _process(_delta):
	if player:
		if player.position.y > player.player_cam().get_camera_screen_center().y+352:
			kill_player()
	
	if Input.is_action_just_pressed("pause_game"):
		get_tree().paused = true
		var screen_center = player_cam.get_camera_screen_center()
		pause_popup.set_position(Vector2(screen_center.x-218.5, screen_center.y - 96.5))
		pause_popup.show()


func _on_WinLine_body_shape_entered(body_id, _body, _body_shape, _area_shape):
	if body_id == player.get_instance_id():
		win_player()


func _on_RetryButton_pressed():
	var _ignored = get_tree().reload_current_scene()


func _on_BookTimer_timeout():
	book_spawn.offset = randi()
	var book = Book.instance()
	book_body_ids.append(book.get_instance_id())
	add_child(book)
	
	book.position = book_spawn.position
	
	book.linear_velocity = Vector2(0, rand_range(book.min_speed(), book.max_speed()))


func _on_Player_hit(body_id):
	if book_body_ids.has(body_id):
		kill_player()


func _on_MainMenu():
	var _ignored = get_tree().change_scene(title_screen_path)
	get_tree().paused = false


func _on_Resume():
	pause_popup.hide()
	get_tree().paused = false
