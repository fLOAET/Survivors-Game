extends Node

#Setting base variables
var health = 100
var damage = 25
var speed = 20

#Updates the boss stats
func update_stats():
	health = health * 2
	damage = damage + 25
	speed = speed + 10

#Resets boss stats on restart
func restart():
	health = 100
	damage = 25
	speed = 20
