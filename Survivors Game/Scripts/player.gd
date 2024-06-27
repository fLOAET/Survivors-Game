extends CharacterBody2D


const SPEED = 80.0
const ACCELERATION = 300.0
const FRICTION = 300.0
var dead = false
var last_direction = 0
var direction = Vector2.ZERO
@onready var sprite = $Sprite
const SHURIKEN = preload("res://Scenes/shuriken.tscn")
@onready var world = get_node('/root/World')
const PLAYER_DEATH = preload("res://Scenes/player_death.tscn")
@onready var shuriken_cooldown = $ShurikenCooldown
@onready var shuriken_projectile_timer = $ShurikenProjectileTimer

func _ready():
	PlayerStats.player_death.connect(player_dead)

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	if dead == false:
		velocity = velocity.move_toward(direction * SPEED, ACCELERATION)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION)
	
	if velocity.x < 0:
		sprite.flip_h = true
	elif velocity.x > 0:
		sprite.flip_h = false
		
	if velocity.x != 0 || velocity.y != 0:
		sprite.play("Run")
	else:
		sprite.play("Idle")

	move_and_slide()

	if velocity.x != 0 || velocity.y != 0:
		last_direction = direction.angle()

func _on_shuriken_cooldown_timeout():
	var projectiles = 2
	var spawned_projectiles = 0
	while spawned_projectiles < projectiles:
		spawned_projectiles = spawned_projectiles + 1
		var shuriken = SHURIKEN.instantiate()
		shuriken.global_position = global_position
		shuriken.rotate(last_direction)
		world.add_child(shuriken)
		await get_tree().create_timer(0.05).timeout

func _on_shuriken_projectile_timer_timeout():
	var shuriken = SHURIKEN.instantiate()
	shuriken.global_position = global_position
	shuriken.rotate(last_direction)
	world.add_child(shuriken)
	shuriken_projectile_timer.stop()

func _on_pickup_zone_area_entered(area):
	if area.is_in_group("Pickup"):
		if area.has_method("collect"):
			area.collect()

func player_dead():
	visible = false
	if dead == false:
		dead = true
		var new_death = PLAYER_DEATH.instantiate()
		new_death.global_position = global_position
		add_sibling(new_death)
