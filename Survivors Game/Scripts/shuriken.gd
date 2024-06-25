extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(Vector2.RIGHT.rotated(rotation) * WeaponShuriken.shuriken_speed * delta)
	
	
func _on_body_entered(body):
	if body.is_in_group("Enemy") and body.has_method("take_damage"):
		body.take_damage(WeaponShuriken.shuriken_damage)
		queue_free()
