extends AnimatedSprite2D


@onready var death_notice = $UI/Control/DeathNotice
const Player = preload("res://Scripts/player.gd")

func _on_animation_finished():
	get_tree().paused = true
	await get_tree().create_timer(3).timeout
	#death_notice.change
