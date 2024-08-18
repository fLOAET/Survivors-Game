extends AnimatedSprite2D

#Loading references for other scenes and scripts
@onready var death_notice = $UI/DeathNotice
@onready var btn_restart = $UI/DeathNotice/Buttons/MarginContainer/VBoxContainer/btn_restart

#Pauses the scene, shows the ui and gets a buttons focus
func _on_animation_finished():
	get_tree().paused = true
	await get_tree().create_timer(0.5).timeout
	death_notice.visible = true
	btn_restart.grab_focus()
