extends Control


@onready var hooded_guy = $HoodedGuy
@onready var hg_sprite = $HoodedGuy/hgSprite

var active_character

func _ready():
	active_character = hooded_guy

func _on_hooded_guy_visibility_changed():
	hg_sprite.play("Idle")

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
