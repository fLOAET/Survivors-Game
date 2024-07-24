extends CanvasLayer


func _on_btn_restart_pressed():
	get_tree().reload_current_scene()

func _on_btn_main_menunu_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
