extends AnimatedSprite2D


@onready var death_notice = $UI/Control/DeathNotice
const Player = preload("res://Scripts/player.gd")


func _on_animation_finished():
	death_notice.visible = true
	await get_tree().create_timer(3).timeout
