extends Node


var shuriken_level = 1
var shuriken_damage = 5
var shuriken_speed = 350
var shuriken_projectiles = 1
var shuriken_time = 1
var shuriken_knockback = 10

func level_up_shuriken():
	shuriken_level += 1
	match shuriken_level:
		1:
			pass
		2:
			shuriken_damage = 10
			shuriken_speed = 350
			shuriken_projectiles = 1
			shuriken_time = 1
			shuriken_knockback = 10
		3:
			shuriken_damage = 10
			shuriken_speed = 400
			shuriken_projectiles = 1
			shuriken_time = 1
			shuriken_knockback = 10
		4:
			shuriken_damage = 10
			shuriken_speed = 400
			shuriken_projectiles = 2
			shuriken_time = 1
			shuriken_knockback = 20
		5:
			shuriken_damage = 15
			shuriken_speed = 500
			shuriken_projectiles = 2
			shuriken_time = 0.5
			shuriken_knockback = 20
