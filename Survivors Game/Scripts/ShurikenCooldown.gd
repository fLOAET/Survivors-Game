extends Timer


# Called when the node enters the scene tree for the first time.
func _ready():
	WeaponShuriken.set_cooldown.connect(set_wait_timer)
	
func set_wait_timer():
	self.wait_time = WeaponShuriken.shuriken_cooldown
