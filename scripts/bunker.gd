extends StaticBody2D

var bunkerLife = 10

@onready var explosion_particles: GPUParticles2D = $ExplosionParticles
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var bunker: StaticBody2D = $"."
@onready var explosion_audio: AudioStreamPlayer2D = $ExplosionAudio

func bunkerHit():
	#print("bunker hit")
	explosion_audio.play()
	bunkerLife -= 1
	explosion_particles.emitting = true
	sprite_2d.region_enabled = true
	if bunkerLife == 9:
		sprite_2d.region_rect= Rect2(32, 0, 32, 32)
	elif bunkerLife == 8:
		sprite_2d.region_rect= Rect2(64, 0, 32, 32)
	elif bunkerLife == 7:
		sprite_2d.region_rect= Rect2(96, 0, 32, 32)
	elif bunkerLife == 6:
		sprite_2d.region_rect= Rect2(128, 0, 32, 32)
	elif bunkerLife == 5:
		sprite_2d.region_rect= Rect2(160, 0, 32, 32)
	elif bunkerLife == 4:
		sprite_2d.region_rect= Rect2(192, 0, 32, 32)
	elif bunkerLife == 3:
		sprite_2d.region_rect= Rect2(224, 0, 32, 32)
	elif bunkerLife == 2:
		sprite_2d.region_rect= Rect2(256, 0, 32, 32)
	elif bunkerLife == 1:
		sprite_2d.region_rect= Rect2(288, 0, 32, 32)
	else: 
		await get_tree().create_timer(0.2).timeout
		sprite_2d.visible = true
		await get_tree().create_timer(0.2).timeout
		sprite_2d.visible = false
		await get_tree().create_timer(0.2).timeout
		sprite_2d.visible = true
		await get_tree().create_timer(0.2).timeout
		bunker.queue_free()
		
