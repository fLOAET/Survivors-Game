extends Node


var shuriken_level = 1
var shuriken_damage = 5
var shuriken_speed = 350
var shuriken_projectiles = 1
var shuriken_pierce = 1
var shuriken_cooldown = 1
var shuriken_stun = 10

signal set_cooldown

func level_up_shuriken():
	shuriken_level += 1
	match shuriken_level:
		1:
			pass
		2:
			shuriken_damage = 10
		3:
			shuriken_speed = 400
			shuriken_pierce = 2
		4:
			shuriken_projectiles = 2
			shuriken_stun = 20
		5:
			shuriken_damage = 15
			shuriken_speed = 500
			shuriken_cooldown = 0.5
	
	emit_signal("set_cooldown")
