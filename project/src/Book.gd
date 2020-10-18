extends RigidBody2D


var min_speed := 150 setget , min_speed
var max_speed := 250 setget , max_speed

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func min_speed():
	return min_speed


func max_speed():
	return max_speed
