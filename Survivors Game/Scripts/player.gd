extends CharacterBody2D

#Creates variables for player movement, direction, and death
var speed = PlayerStats.player_speed
const ACCELERATION = 300.0
const FRICTION = 300.0
var direction = Vector2.ZERO
var last_direction = 0
var dead = false

#Loading references for other scenes and scripts
const SHURIKEN = preload("res://Scenes/shuriken.tscn")
const PLAYER_DEATH = preload("res://Scenes/player_death.tscn")
@onready var sprite = $Sprite
@onready var world = get_node('/root/World')
@onready var shuriken_cooldown = $ShurikenCooldown
@onready var shuriken_projectile_timer = $ShurikenProjectileTimer
@onready var pause = $UI/Pause
@onready var resume = $UI/Pause/PauseMenu/Resume

#Called when the node enters the scene tree for the first time
func _ready():
	#Connects signals from singletons to functions in this script
	PlayerStats.player_death.connect(player_dead)
	PlayerStats.add_speed.connect(update_player_speed)

#Called every frame, 'delta' is the elapsed time since the previous frame
func _physics_process(delta):
	#Get the input direction and handle the movement/deceleration
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	if dead == false:
		velocity = velocity.move_toward(direction * speed, ACCELERATION)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION)
	
	#Flips the sprite based on the direction the player is facing
	if velocity.x < 0:
		sprite.flip_h = true
	elif velocity.x > 0:
		sprite.flip_h = false
	
	#Changes the sprite animation for when the player is moving
	if velocity.x != 0 || velocity.y != 0:
		sprite.play("Run")
	else:
		sprite.play("Idle")
	
	#Keeps the last direction the player was facing rather than setting it to zero
	if velocity.x != 0 || velocity.y != 0:
		last_direction = direction.angle()
	
	#Opens the puase when in esc pressed, pauses the game tree, and gets the first buttons focus for keyboard control
	if Input.is_action_pressed("Pause"):
		get_tree().paused = true
		pause.visible = true
		resume.grab_focus()
	
	#Moves the character body while handeling collisions in a way that lets the character slide along surfaces
	move_and_slide()

#Updates the player speed based on a value from the PlayerStats singleton
func update_player_speed():
	speed = PlayerStats.player_speed

#Runs the contained code when the connected timer goes off
func _on_shuriken_cooldown_timeout():
	#Creates variables for spawning shurikens
	var projectiles = WeaponShuriken.shuriken_projectiles
	var spawned_projectiles = 0
	
	#Loops code while stantement is true
	while spawned_projectiles < projectiles:
		#Spawns a shuriken on the player and sets the direction to the players last moved direction
		spawned_projectiles = spawned_projectiles + 1
		var shuriken = SHURIKEN.instantiate()
		shuriken.global_position = global_position
		shuriken.rotate(last_direction)
		world.add_child(shuriken)
		
		#Creates a timer and waits for it to timeout before looping
		await get_tree().create_timer(0.05).timeout

#Runs the contained code when the connected area is enetered
func _on_pickup_zone_area_entered(area):
	#Checks if the area enetred is in the group Pickup, if it is, execute code
	if area.is_in_group("Pickup"):
		#Checks if the there is a fucntion named collect, then calls that function
		if area.has_method("collect"):
			area.collect()

#Makes the player invisible and spawns the player death scene
func player_dead():
	visible = false
	if dead == false:
		dead = true
		var new_death = PLAYER_DEATH.instantiate()
		new_death.global_position = global_position
		add_sibling(new_death)
