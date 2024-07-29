extends CanvasLayer


@onready var main_menu = $".."
const WORLD = preload("res://Scenes/world.tscn")
@onready var play = $Control/VBoxContainer/Play
@onready var options = $Control/VBoxContainer/Options
@onready var about = $Control/VBoxContainer/About
@onready var quit = $Control/VBoxContainer/Quit

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = false
	play.grab_focus()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_btn_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/world.tscn")

func _on_btn_options_pressed():
	pass # Replace with function body.

func _on_about_pressed():
	get_tree().change_scene_to_file("res://Scenes/about.tscn")
	
func _on_btn_quit_pressed():
	get_tree().quit()
