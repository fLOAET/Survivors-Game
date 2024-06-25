extends CharacterBody2D


const SPEED = 40.0
@onready var sprite = $Sprite
@onready var player = $"../Player"
const SKELETON_DEATH = preload("res://Scenes/skeleton_death.tscn")

func _physics_process(delta):
	var direction_to_player = global_position.direction_to(player.global_position)
	velocity = direction_to_player * SPEED
	
	if velocity.x > 0:
		sprite.flip_h = false
	else:
		sprite.flip_h = true
	
	move_and_slide()

func enemy_die():
	queue_free()
	var new_death = SKELETON_DEATH.instantiate()
	new_death.global_position = global_position
	add_sibling(new_death)
