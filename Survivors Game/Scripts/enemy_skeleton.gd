extends CharacterBody2D

#Loading references for other scenes and scripts and setting variables
var SPEED = 40.0
var is_stunned = false
@export var health = 20
@export var damage = 5
@onready var sprite = $Sprite
@onready var player = $"../Player"
const SKELETON_DEATH = preload("res://Scenes/skeleton_death.tscn")
const EXPERIENCE_BALL = preload("res://Scenes/experience_ball.tscn")
@onready var damage_timer = $"HurtBox/DamageTimer"
@onready var stun_timer = $StunTimer

#Checking if the boss is colliding with the player and doing dmamage based on a hit timer
func check_collisions():
	if not damage_timer.is_stopped():
		return
	var collisions = $HurtBox.get_overlapping_bodies()
	if collisions:
		for collision in collisions:
			if collision.is_in_group("Player") and damage_timer.is_stopped():
				PlayerStats.damage_player(damage)
				damage_timer.start()

#Called every frame, 'delta' is the elapsed time since the previous frame
func _physics_process(delta):
	#Move towards the player
	var direction_to_player = global_position.direction_to(player.global_position)
	velocity = direction_to_player * SPEED
	
	#Flip sprite based on direction
	if velocity.x > 0:
		sprite.flip_h = false
	else:
		sprite.flip_h = true
	
	check_collisions()
	move_and_slide()

#Take damage, kill if health = 0, and spawn an experience ball
func take_damage(dmg):
	health -= dmg
	sprite.play("Stunned")
	self.set_physics_process(false)
	stun_timer.start()
	if health <= 0:
		queue_free()
		var new_death = SKELETON_DEATH.instantiate()
		new_death.global_position = global_position
		add_sibling(new_death)
		
		var new_exp = EXPERIENCE_BALL.instantiate()
		new_exp.global_position = global_position
		add_sibling(new_exp)

#Called when the stun timer times out
func _on_stun_timer_timeout():
	sprite.play("Walking")
	self.set_physics_process(true)
