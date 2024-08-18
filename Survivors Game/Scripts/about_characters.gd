extends Control

#Loading references for other scenes and scripts
@onready var hooded_guy = $HoodedGuy
@onready var hg_sprite = $HoodedGuy/hgSprite

#Creating a variable
var active_character

#Setting the vaiable on ready
func _ready():
	active_character = hooded_guy

#Sets the animation to idle when clicked on
func _on_hooded_guy_visibility_changed():
	hg_sprite.play("Idle")

#Functions for buttons pressed
func _on_hooded_guy_pressed():
	active_character.visible = false
	active_character = hooded_guy
	active_character.visible = true

func _on_hg_idle_pressed():
	hg_sprite.play("Idle")

func _on_hg_run_pressed():
	hg_sprite.play("Run")

func _on_hg_death_pressed():
	hg_sprite.play("Death")
