extends AnimatedSprite2D


@onready var death_notice = $UI/Control/DeathNotice

func _on_animation_finished():
	get_tree().paused = true
	await get_tree().create_timer(1).timeout
	death_notice.visible = true
