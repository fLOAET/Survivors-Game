extends Node


var player_level = 1
var player_max_health = 100
var player_health = 100
var player_speed = 80
var max_speed = 300
var red_experience_value = 5
var green_experience_value = 25
var blue_experience_value = 100
var experience_multiplier = 1
var experience_value
var player_experience = 0
var player_luck = 6
var next_level = 10

signal level_up
signal add_exp
signal add_speed
signal speed_maxed
signal take_damage
signal player_death

func level_up_player():
	player_level += 1
	next_level = next_level * 1.25
	player_experience = 0
	emit_signal("level_up")

func add_red_experience():
	experience_value = red_experience_value * experience_multiplier
	player_experience += experience_value
	emit_signal("add_exp")
	if player_experience >= next_level:
		level_up_player()

func add_green_experience():
	experience_value = green_experience_value * experience_multiplier
	player_experience += experience_value
	emit_signal("add_exp")
	if player_experience >= next_level:
		level_up_player()

func add_blue_experience():
	experience_value = blue_experience_value * experience_multiplier
	player_experience += experience_value
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

func add_player_speed():
	player_speed = player_speed + 20
	emit_signal("add_speed")
	print(player_speed)
	if player_speed == max_speed:
		emit_signal("speed_maxed")

func add_experience_value():
	experience_multiplier = experience_multiplier * 1.5

func add_luck():
	player_luck = player_luck - 1

func restart():
	player_level = 1
	player_max_health = 100
	player_health = 100
	player_speed = 80
	red_experience_value = 5
	green_experience_value = 25
	blue_experience_value = 100
	experience_multiplier = 1
	player_experience = 0
	player_luck = 6
	next_level = 10
