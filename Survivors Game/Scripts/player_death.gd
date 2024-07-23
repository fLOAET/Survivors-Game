extends AnimatedSprite2D


@onready var death_notice = $UI/Control/DeathNotice

func _on_animation_finished():
	await get_tree().create_timer(3).timeout
