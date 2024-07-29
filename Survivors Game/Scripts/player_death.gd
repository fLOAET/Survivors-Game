extends AnimatedSprite2D


@onready var death_notice = $UI/DeathNotice
@onready var btn_restart = $UI/DeathNotice/Buttons/MarginContainer/VBoxContainer/btn_restart

func _on_animation_finished():
	get_tree().paused = true
	await get_tree().create_timer(0.5).timeout
	death_notice.visible = true
	btn_restart.grab_focus()
