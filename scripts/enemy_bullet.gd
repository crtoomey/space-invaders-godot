extends CharacterBody2D
@onready var enemy_bullet: CharacterBody2D = $"."

func _process(delta: float) -> void:
	position.y += 1 * 200 * delta
	# this returns some info about the object the ball collides with but I don't understand it fully yet
	var collision = move_and_collide(velocity * delta)
	
		# check to see if a collision occurred
	if collision:
	
		if collision.get_collider().has_method("playerHit"):
			collision.get_collider().playerHit()
			enemy_bullet.queue_free()
				
			
