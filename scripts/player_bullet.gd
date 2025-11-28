extends CharacterBody2D

var hasExploded = false

@onready var player_bullet: CharacterBody2D = $"."




func _process(delta: float) -> void:
	if hasExploded == false:
		position.y += -1 * 200 * delta
	
	# this returns some info about the object the ball collides with but I don't understand it fully yet
	var collision = move_and_collide(velocity * delta)
	
		# check to see if a collision occurred
	if collision:
		
		if collision.get_collider().has_method("enemyHit"):
			
			collision.get_collider().enemyHit()
			player_bullet.queue_free()
