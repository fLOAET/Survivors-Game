extends CanvasLayer


@onready var experience = $Control/Experience
@onready var health = $Control/Health


func _ready():
	PlayerStats.level_up.connect(update_exp)
	PlayerStats.take_damgage.connect(update_health)
	PlayerStats.add_exp.connect(update_exp)
	
func update_exp():
	experience.max_value = PlayerStats.next_level
	experience.value = PlayerStats.player_experience

func update_health():
	health.max_health = PlayerStats.player_max_health
	health.value = PlayerStats.player_health
