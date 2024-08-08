extends Node


var health = 10
var damage = 25
var speed = 20
var exp_drop = 50

func update_stats():
	health = health * 2
	damage = damage * 2
	speed = speed + 10
	exp_drop = exp_drop * 2



func restart():
	health = 10
	damage = 25
	speed = 40
	exp_drop = 50
