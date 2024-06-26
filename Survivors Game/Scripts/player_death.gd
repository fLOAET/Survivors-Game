extends AnimatedSprite2D


func _on_animation_finished():
	get_tree().paused = true
