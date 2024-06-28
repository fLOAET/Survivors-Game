extends CanvasLayer

@onready var main_menu = $".."
const WORLD = preload("res://Scenes/world.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_btn_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/world.tscn")
