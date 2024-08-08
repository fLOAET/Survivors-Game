extends Node2D

#Called when the node enters the scene tree for the first time
func _ready():
	#Calls the restart function within the singletons
	PlayerStats.restart()
	WeaponShuriken.restart()
	BossStats.restart()
	#Ensures the game tree is not paused, resuming processes if it was
	get_tree().paused = false
