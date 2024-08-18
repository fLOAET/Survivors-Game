extends CharacterBody2D

#Loading references for other scenes and scripts and setting variables
var health = BossStats.health
var damage = BossStats.damage
var speed = BossStats.speed
var is_stunned = false
var is_dead = false
@onready var player = $"../Player"
@onready var damage_timer = $HurtBox/DamageTimer
@onready var sprite = $Sprite
@onready var stun_timer = $StunTimer
const EXPERIENCE_BALL = preload("res://Scenes/experience_ball.tscn")

#Updating boss stats on ready
func _ready():
	BossStats.update_stats()


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
	#Moving the boss toward the player
	var direction_to_player = global_position.direction_to(player.global_position)
	velocity = direction_to_player * speed
	
	#slipping the sprite based on the direction it is moving
	if velocity.x > 0:
		sprite.flip_h = false
	else:
		sprite.flip_h = true
	
	check_collisions()
	move_and_slide()

#Makes the boss take damage
func take_damage(dmg):
	health -= dmg
	self.set_physics_process(false)
	if health <= 0:
		write_boss_death()
		sprite.play("Death")
		is_dead = true
	else:
		sprite.play("Idle")
		stun_timer.start()

#Called after the stun ends
func _on_stun_timer_timeout():
	sprite.play("Walking")
	self.set_physics_process(true)

#Called after the death animtion finishes
func _on_sprite_animation_finished():
	queue_free()
	var new_exp = EXPERIENCE_BALL.instantiate()
	new_exp.global_position = global_position
	add_sibling(new_exp)

#Writing to a text file (broken)
func write_boss_death():
	var string = "boss dead"
	var file = FileAccess.open("user://bosses_killed.txt", FileAccess.WRITE)
	file.seek_end()
	file.store_string(string)
	print("test")
