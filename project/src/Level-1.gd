extends Node2D


var title_screen_path := "res://project/src/TitleScreen.tscn"
var level2_path := "res://project/src/Level-2.tscn"

onready var player := $Player
onready var win_hud := $WinHUD
onready var game_over_hud := $GameOverHUD
onready var intro_popup := $IntroPopup


func _ready():
	intro_popup.visible = true
	yield(get_tree().create_timer(5.0), "timeout")
	intro_popup.visible = false


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


func _on_WinLine_body_shape_entered(body_id, _body, _body_shape, _area_shape):
	if body_id == player.get_instance_id():
		win_player()


func _on_RetryButton_pressed():
	var _ignored = get_tree().reload_current_scene()


func _on_MainMenuButton_pressed():
	get_tree().change_scene(title_screen_path)


func _on_NextLevelButton_pressed():
	get_tree().change_scene(level2_path)
