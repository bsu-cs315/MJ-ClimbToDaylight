extends Node2D


onready var player = $Player
onready var spawn_pos = $SpawnPos


func _ready():
	pass


func _process(_delta):
	if player:
		if player.position.y > player.player_cam().get_camera_screen_center().y+352:
			player.queue_free()
			print("dead")
