extends Node2D

@onready var world = get_node("/root/World")
@onready var camera = $".."
@onready var spawn_points = $SpawnPoints.get_children()

@onready var skeleton_spawn_timer = $SkeletonSpawnTimer
const ENEMY_SKELETON = preload("res://Scenes/enemy_skeleton.tscn")

@onready var boss_timer = $BossTimer
const BOSS = preload("res://Scenes/boss.tscn")

func _ready():
	await get_tree().create_timer(0.01).timeout
	print("spawn")
	spawn_skeleton()

func spawn_skeleton():
	var enemy = ENEMY_SKELETON.instantiate()
	var spawn_point = spawn_points.pick_random()
	enemy.global_position = spawn_point.global_position
	world.add_child(enemy)

func _on_skeleton_spawn_timer_timeout():
	print(skeleton_spawn_timer.wait_time)
	spawn_skeleton()
	if skeleton_spawn_timer.wait_time > 0.6:
		skeleton_spawn_timer.wait_time -= 0.1

func _on_boss_timer_timeout():
	var enemy = BOSS.instantiate()
	var spawn_point = spawn_points.pick_random()
	enemy.global_position = spawn_point.global_position
	world.add_child(enemy)
