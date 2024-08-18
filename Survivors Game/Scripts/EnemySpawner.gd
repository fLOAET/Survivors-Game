extends Node2D

#Loading references for other scenes and scripts and setting variables
@onready var world = get_node("/root/World")
@onready var camera = $".."
@onready var spawn_points = $SpawnPoints.get_children()

@onready var skeleton_spawn_timer = $SkeletonSpawnTimer
const ENEMY_SKELETON = preload("res://Scenes/enemy_skeleton.tscn")

@onready var boss_timer = $BossTimer
const BOSS = preload("res://Scenes/boss.tscn")

#Spawing a skeleton on read after a 0.01 seconds
func _ready():
	await get_tree().create_timer(0.01).timeout
	spawn_skeleton()

#Spawns the skeleton
func spawn_skeleton():
	var enemy = ENEMY_SKELETON.instantiate()
	var spawn_point = spawn_points.pick_random()
	enemy.global_position = spawn_point.global_position
	world.add_child(enemy)

#Spawns skeleton on timer timeout and lowers the wait time
func _on_skeleton_spawn_timer_timeout():
	spawn_skeleton()
	if skeleton_spawn_timer.wait_time > 0.6:
		skeleton_spawn_timer.wait_time -= 0.1

#Spawns the boss
func _on_boss_timer_timeout():
	var enemy = BOSS.instantiate()
	var spawn_point = spawn_points.pick_random()
	enemy.global_position = spawn_point.global_position
	world.add_child(enemy)
