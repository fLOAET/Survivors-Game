extends CanvasLayer

@onready var main_menu = $".."
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_btn_play_pressed():
	print("test")
	get_tree().change_scene_to_file("res://Scenes/world.tscn")

func _on_btn_options_pressed():
	pass # Replace with function body.

func _on_btn_credits_pressed():
	pass # Replace with function body.
	
func _on_btn_quit_pressed():
	get_tree().quit()
