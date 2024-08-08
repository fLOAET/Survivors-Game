extends CharacterBody2D


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

func _ready():
	BossStats.update_stats()

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
	velocity = direction_to_player * speed
	
	if velocity.x > 0:
		sprite.flip_h = false
	else:
		sprite.flip_h = true
	
	check_collisions()
	move_and_slide()

func take_damage(dmg):
	health -= dmg
	self.set_physics_process(false)
	if health <= 0:
		sprite.play("Death")
		is_dead = true
	else:
		sprite.play("Idle")
		stun_timer.start()

func _on_stun_timer_timeout():
	sprite.play("Walking")
	self.set_physics_process(true)


func _on_sprite_animation_finished():
	queue_free()
	var new_exp = EXPERIENCE_BALL.instantiate()
	new_exp.global_position = global_position
	add_sibling(new_exp)
