extends Node2D


var title_screen_path := "res://project/src/TitleScreen.tscn"

onready var player := $Player
onready var intro_popup := $IntroPopup
onready var book_spawn := $BookPath/BookSpawnLocation

export (PackedScene) var Book


func _ready():
	intro_popup.visible = true
	yield(get_tree().create_timer(5.0), "timeout")
	intro_popup.visible = false
	
	randomize()


func _on_MainMenuButton_pressed():
	var _ignored = get_tree().change_scene(title_screen_path)


func _on_BookTimer_timeout():
	book_spawn.offset = randi()
	var book = Book.instance()
	add_child(book)
	
	book.position = book_spawn.position
	
	book.linear_velocity = Vector2(0, rand_range(book.min_speed(), book.max_speed()))
