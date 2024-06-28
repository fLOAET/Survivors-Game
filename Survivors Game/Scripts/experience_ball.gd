extends Area2D


var collected = false
@onready var player = get_tree().get_first_node_in_group("Player")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if collected:
		if player:
			global_position = global_position.move_toward(player.global_position, 300 * delta)
			
func collect():
	collected = true

func _on_body_entered(body):
	if body.is_in_group("Player"):
		PlayerStats.add_experience()
		queue_free()
