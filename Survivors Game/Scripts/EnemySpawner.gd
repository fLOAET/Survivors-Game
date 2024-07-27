extends Node2D

@onready var spawn_points = $SpwanPoints.get_children()
@onready var spawn_timer = $SpawnTimer
@onready var timer_change = $TimerChange
@onready var world = get_node("/root/World")
@onready var camera = $".."
const ENEMY_SKELETON = preload("res://Scenes/enemy_skeleton.tscn")

func spawn_enemy():
	var enemy = ENEMY_SKELETON.instantiate()
	var spawn_point = spawn_points.pick_random()
	enemy.global_position = spawn_point.global_position
	world.add_child(enemy)

func _on_spawn_timer_timeout():
	spawn_enemy()
	if spawn_timer.wait_time > 1:
		timer_change.start()

func _on_timer_change_timeout():
	spawn_timer.wait_time -= 0.1
	timer_change.stop()
