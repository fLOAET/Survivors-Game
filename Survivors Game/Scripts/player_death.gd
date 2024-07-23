extends AnimatedSprite2D


@onready var death_notice = $UI/Control/DeathNotice

func _on_animation_finished():
	await get_tree().create_timer(3).timeout
	
	death_notice.visible = true

func _on_death_notice_visibility_changed():
	if death_notice.visible == true:
		get_tree().paused = true
	else:
		get_tree().paused = false

