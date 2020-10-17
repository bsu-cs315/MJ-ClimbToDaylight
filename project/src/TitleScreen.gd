extends Node2D


var level1_scene_path := "res://project/src/Level-1.tscn"

onready var instructions := $InstructionsPopup


func _on_InstructionsButton_pressed():
	instructions.popup()


func _on_StartButton_pressed():
	var _ignored = get_tree().change_scene(level1_scene_path)
