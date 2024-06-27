extends Node


var player_level = 1
var player_experience = 0
var player_health = 100
var player_max_health = 100
var next_level = 20

signal level_up
signal add_exp
signal take_damage
signal player_death

func level_up_player():
	player_level += 1
	next_level = next_level * 1.25
	player_experience = 0
	emit_signal("level_up")

func add_experience(val):
	player_experience += val
	emit_signal("add_exp")
	if player_experience >= next_level:
		level_up_player()
		
func damage_player(amount):
	player_health -= amount
	emit_signal("take_damage")
	if player_health <= 0:
		emit_signal("player_death")
	
func add_max_health():
	player_max_health += 20
	player_health = player_max_health
	emit_signal("take_damage")
