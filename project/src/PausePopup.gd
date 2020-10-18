extends Popup


signal resume
signal main_menu


func _on_ResumeButton_pressed():
	emit_signal("resume")


func _on_MainMenuButton_pressed():
	emit_signal("main_menu")
