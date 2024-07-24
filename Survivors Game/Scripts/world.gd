extends Node2D


func _ready():
	PlayerStats.restart()
	WeaponShuriken.restart()
	get_tree().paused = false
