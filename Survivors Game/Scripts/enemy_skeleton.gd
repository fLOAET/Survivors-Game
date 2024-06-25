extends CharacterBody2D


const SPEED = 40.0
@export var health = 10
@onready var sprite = $Sprite
@onready var player = $"../Player"
const SKELETON_DEATH = preload("res://Scenes/skeleton_death.tscn")
const EXPERIENCE_BALL = preload("res://Scenes/experience_ball.tscn")

func _physics_process(delta):
	var direction_to_player = global_position.direction_to(player.global_position)
	velocity = direction_to_player * SPEED
	
	if velocity.x > 0:
		sprite.flip_h = false
	else:
		sprite.flip_h = true
	
	move_and_slide()

func take_damage(dmg):
	health -= dmg
	if health <= 0:
		queue_free()
		var new_death = SKELETON_DEATH.instantiate()
		new_death.global_position = global_position
		add_sibling(new_death)
		
		var new_exp = EXPERIENCE_BALL.instantiate()
		new_exp.global_position = global_position
		add_sibling(new_exp)
