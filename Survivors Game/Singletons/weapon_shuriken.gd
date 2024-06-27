extends Node


var shuriken_level = 1
var shuriken_damage = 5
var shuriken_speed = 350
var shuriken_projectiles = 1
var shuriken_pierce = 1
var shuriken_cooldown = 1
var shuriken_stun = 0.5

signal set_cooldown
signal set_stun

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
			shuriken_stun = 1
		5:
			shuriken_damage = 15
			shuriken_speed = 500
			shuriken_cooldown = 0.5
		6:
			shuriken_pierce = 3
		7:
			shuriken_damage = 20 
		8:
			shuriken_cooldown = 0.25

	emit_signal("set_cooldown")
	emit_signal("set_stun")
