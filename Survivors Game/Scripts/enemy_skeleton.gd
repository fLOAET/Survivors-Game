extends CharacterBody2D


const SPEED = 40.0

@onready var sprite = $Sprite
@onready var player = $"../Player"

func _physics_process(delta):
	var direction_to_player = global_position.direction_to(player.global_position)
	velocity = direction_to_player * SPEED
	
	if velocity.x > 0:
		sprite.flip_h = false
	else:
		sprite.flip_h = true
	
	
	move_and_slide()
