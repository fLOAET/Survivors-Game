extends AnimatedSprite2D

#Removes the scene from tree
func _on_animation_finished():
	queue_free()
