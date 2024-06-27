extends Timer


# Called when the node enters the scene tree for the first time.
func _ready():
	WeaponShuriken.set_stun.connect(set_stun_time)# Replace with function body.

func set_stun_time():
	self.wait_time = WeaponShuriken.shuriken_stun
