extends CharacterBody2D


const SPEED = 300.0
const ACCELERATION = 300.0
const FRICTION = 300.0
var direction = Vector2.ZERO
@onready var sprite = $Sprite
const SHURIKEN = preload("res://Scenes/shuriken.tscn")
@onready var world = get_node('/root/World')

func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	if direction:
		velocity = velocity.move_toward(direction * SPEED, ACCELERATION)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION)
	
	if velocity.x < 0:
		sprite.flip_h = true
	elif velocity.x > 0:
		sprite.flip_h = false

	move_and_slide()


func _on_shuriken_timer_timeout():
	var shuriken = SHURIKEN.instantiate()
	shuriken.global_position = global_position
	shuriken.rotate(direction.angle())
	world.add_child(shuriken)
