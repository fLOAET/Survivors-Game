extends CanvasLayer

#Loading references for other scenes and scripts
@onready var experience = $Control/Experience
@onready var health = $Control/Health
@onready var level_up_notice = $Control/LevelUpNotice
@onready var btn_shuriken_level = $Control/LevelUpNotice/MarginContainer/VBoxContainer/btn_shuriken_level
@onready var pause = $Pause
@onready var btn_health_level = $Control/LevelUpNotice/MarginContainer/VBoxContainer/btn_health_level
@onready var btn_speed_level = $Control/LevelUpNotice/MarginContainer/VBoxContainer/btn_speed_level

#Connects signals on ready
func _ready():
	PlayerStats.level_up.connect(level_up)
	PlayerStats.take_damage.connect(update_health)
	PlayerStats.add_exp.connect(update_exp)
	WeaponShuriken.shuriken_maxed.connect(shuriken_maxed)
	PlayerStats.speed_maxed.connect(speed_maxed)

#Functions for buttons pressed, signals recieved and getting focus of a button when visibilty changed
func level_up():
	update_exp()
	level_up_notice.visible = true

func update_exp():
	experience.max_value = PlayerStats.next_level
	experience.value = PlayerStats.player_experience

func update_health():
	health.max_value = PlayerStats.player_max_health
	health.value = PlayerStats.player_health

func _on_level_up_notice_visibility_changed():
	if level_up_notice.visible == true:
		get_tree().paused = true
		btn_health_level.grab_focus()
	else:
		get_tree().paused = false

func _on_btn_health_level_pressed():
	PlayerStats.add_max_health()
	level_up_notice.visible = false

func _on_btn_speed_level_pressed():
	PlayerStats.add_player_speed()
	level_up_notice.visible = false

func _on_btn_shuriken_level_pressed():
	WeaponShuriken.level_up_shuriken()
	level_up_notice.visible = false
	
func _on_btn_exp_level_pressed():
	PlayerStats.add_experience_value()
	level_up_notice.visible = false

func _on_btn_luck_level_pressed():
	PlayerStats.add_luck()
	level_up_notice.visible = false

func speed_maxed():
	btn_speed_level.visible = false

func shuriken_maxed():
	btn_shuriken_level.visible = false

func _on_resume_pressed():
	get_tree().paused = false
	pause.visible = false

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
