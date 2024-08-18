extends Area2D

#Loading references for other scenes and scripts and setting variables
var collected = false
@onready var player = get_tree().get_first_node_in_group("Player")

#Called every frame. 'delta' is the elapsed time since the previous frame.
#Moves ball towards player when they are close enough 
func _process(delta):
	if collected:
		if player:
			global_position = global_position.move_toward(player.global_position, 300 * delta)

#Called twhen the ball is collected
func collect():
	collected = true

#Addes experience to the player
func _on_body_entered(body):
	if body.is_in_group("Player"):
		PlayerStats.add_red_experience()
		queue_free()
