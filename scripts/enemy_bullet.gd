extends CharacterBody2D

var hasExploded = false

@onready var enemy_bullet: CharacterBody2D = $"."
@onready var secret_explosion_particles: GPUParticles2D = $SecretExplosionParticles
@onready var secretEnding = preload("res://scenes/secret_ending.tscn")
@onready var camera_2d: Camera2D = $Camera2D
@onready var nuke_audio: AudioStreamPlayer2D = $NukeAudio

func _process(delta: float) -> void:

	position.y += 1 * 200 * delta
	# this returns some info about the object the ball collides with but I don't understand it fully yet
	var collision = move_and_collide(velocity * delta)
	
		# check to see if a collision occurred
	if collision:
		#print("enemy bullet has hit something")
		if collision.get_collider().has_method("playerHit"):
			collision.get_collider().playerHit()
			enemy_bullet.queue_free()
		
		if collision.get_collider().has_method("bunkerHit"):
			collision.get_collider().bunkerHit()
			enemy_bullet.queue_free()

			

func secretExplosion():
	nuke_audio.play()
	Global.secretExplosionHasHappened = true
	print("Now I am become Death, the destroyer of worlds.")
	secret_explosion_particles.emitting = true
	Global.score += 100000
	Global.hasBlackSkin = true
	await get_tree().create_timer(3).timeout
	get_tree().change_scene_to_file("res://scenes/secret_ending.tscn")
