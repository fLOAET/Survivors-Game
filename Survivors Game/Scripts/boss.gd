extends CharacterBody2D


const SPEED = 40
var damage = BossStats.damage
var health = BossStats.health
var is_stunned = false
@onready var player = $"../Player"
@onready var damage_timer = $HurtBox/DamageTimer
@onready var sprite = $Sprite
@onready var stun_timer = $StunTimer
const EXPERIENCE_BALL = preload("res://Scenes/experience_ball.tscn")

func _ready():
	pass

func check_collisions():
	if not damage_timer.is_stopped():
		return
	var collisions = $HurtBox.get_overlapping_bodies()
	if collisions:
		for collision in collisions:
			if collision.is_in_group("Player") and damage_timer.is_stopped():
				PlayerStats.damage_player(damage)
				damage_timer.start()

func _physics_process(delta):
	var direction_to_player = global_position.direction_to(player.global_position)
	velocity = direction_to_player * SPEED
	
	if velocity.x > 0:
		sprite.flip_h = false
	else:
		sprite.flip_h = true
	
	check_collisions()
	move_and_slide()

func take_damage(dmg):
	health -= dmg
	sprite.play("Stunned")
	self.set_physics_process(false)
	stun_timer.start()
	if health <= 0:
		queue_free()
		#var new_death = SKELETON_DEATH.instantiate()
		#new_death.global_position = global_position
		#add_sibling(new_death)
		
		var random_number = randf_range(1, 10)
		var min_number = PlayerStats.player_luck
		if random_number >= min_number:
			var new_exp = EXPERIENCE_BALL.instantiate()
			new_exp.global_position = global_position
			add_sibling(new_exp)

func _on_stun_timer_timeout():
	sprite.play("Walking")
	self.set_physics_process(true)
