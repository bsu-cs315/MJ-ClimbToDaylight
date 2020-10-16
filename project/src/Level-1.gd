extends Node2D


onready var player := $Player
onready var win_hud
onready var game_over_hud := $GameOverHUD


func kill_player():
	player.queue_free()
	set_correct_hud("dead")


func win_player():
	print("win")


func set_correct_hud(player_condition):
	if player_condition == "win":
		pass
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
