extends AnimatedSprite2D


func _on_animation_finished():
	get_tree().paused = true
	await get_tree().create_timer(3).timeout
	
	
	
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
