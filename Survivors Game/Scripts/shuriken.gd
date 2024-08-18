extends Area2D

#Setting a variable
var enemies_hit = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#Rotates shuriken
func _process(delta):
	translate(Vector2.RIGHT.rotated(rotation) * WeaponShuriken.shuriken_speed * delta)

#Does damage to enemies on hit and handles piercing
func _on_body_entered(body):
	if body.is_in_group("Enemy") and body.has_method("take_damage"):
		body.take_damage(WeaponShuriken.shuriken_damage)
		enemies_hit = enemies_hit + 1
		if enemies_hit >= WeaponShuriken.shuriken_pierce:
			queue_free()
