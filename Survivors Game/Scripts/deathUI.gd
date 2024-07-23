extends CanvasLayer


const WORLD = preload("res://Scenes/world.tscn")

func _on_btn_restart_pressed():
	get_tree().reload_current_scene()

func _on_btn_main_menu_pressed():
	pass
	#get_tree().change_scene_to_file("res://Scenes/main_menu.tscn)

func _on_death_notice_visibility_changed():
	pass
