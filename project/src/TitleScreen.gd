extends Node2D


var level1_scene_path := "res://project/src/Level-1.tscn"
var bonus_level_path := "res://project/src/EndlessBooks.tscn"

onready var instructions := $InstructionsPopup


func _on_InstructionsButton_pressed():
	instructions.popup()


func _on_StartButton_pressed():
	var _ignored = get_tree().change_scene(level1_scene_path)


func _on_BonusLevelButton_pressed():
	var _ignored = get_tree().change_scene(bonus_level_path)
