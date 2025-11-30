extends CharacterBody2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var mothership: CharacterBody2D = $"."
@onready var cpu_particles_2d: CPUParticles2D = $CPUParticles2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var explosion_particles: GPUParticles2D = $ExplosionParticles
@onready var explosion_audio: AudioStreamPlayer2D = $ExplosionAudio

func _physics_process(delta: float) -> void:
	position.x += -1 * 32 * delta

func mothershipHit():
	explosion_audio.play()
	Global.mothershipHitCount += 1
	if Global.mothershipHitCount >= 3:
		Global.hasKilled3Motherships = true
	Global.score += 500
	explosion_particles.emitting = true
	collision_shape_2d.disabled = true
	#explosion_animation.play()
	cpu_particles_2d.emitting = false
	sprite_2d.visible = false
	await get_tree().create_timer(0.2).timeout
	sprite_2d.visible = true
	await get_tree().create_timer(0.2).timeout
	sprite_2d.visible = false
	await get_tree().create_timer(0.2).timeout
	sprite_2d.visible = true
	await get_tree().create_timer(0.2).timeout
	mothership.queue_free()
