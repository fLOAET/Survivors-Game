extends Node


var health = 100
var damage = 25
var speed = 20

func update_stats():
	health = health * 2
	damage = damage + 25
	speed = speed + 10

func restart():
	health = 10
	damage = 25
	speed = 40
