extends CharacterBody2D

var direction = 0
var speed = 300
var screenSize = 960
@onready var bulletObject = preload("res://scenes/player_bullet.tscn")
@onready var game: Node2D = $".."
@onready var explosion_particles: GPUParticles2D = $ExplosionParticles
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var left_engine_particles: GPUParticles2D = $LeftEngineParticles
@onready var right_engine_particles: GPUParticles2D = $RightEngineParticles



	


func _process(delta: float) -> void:
	#pretty self explanatory, we move up or down based on input
	if Input.is_action_pressed("move_left"):
		direction = -1
	elif Input.is_action_pressed("move_right"):
		direction = 1
	else:
		direction = 0
		
	position.x += direction * delta * speed
	position.x = clamp(position.x, 0, screenSize)
	
	
	if Input.is_action_just_pressed("fire"):
		
		makeBullet()
		

func makeBullet():
	var newBullet = bulletObject.instantiate()
	game.add_child(newBullet)
	newBullet.position = position
	return newBullet
	
func playerHit():
	explosion_particles.emitting = true
	Global.life -= 1
	print(Global.life)
	if Global.life > 0:
		left_engine_particles.emitting = false
		right_engine_particles.emitting = false
		sprite_2d.visible = false
		await get_tree().create_timer(0.2).timeout
		sprite_2d.visible = true
		await get_tree().create_timer(0.2).timeout
		sprite_2d.visible = false
		await get_tree().create_timer(0.2).timeout
		sprite_2d.visible = true
		await get_tree().create_timer(0.2).timeout
		left_engine_particles.emitting = true
		right_engine_particles.emitting = true
	elif Global.life == 0:
		left_engine_particles.emitting = false
		right_engine_particles.emitting = false
		sprite_2d.visible = false
		await get_tree().create_timer(0.2).timeout
		sprite_2d.visible = true
		await get_tree().create_timer(0.2).timeout
		sprite_2d.visible = false
		await get_tree().create_timer(0.2).timeout
		sprite_2d.visible = true
		await get_tree().create_timer(0.2).timeout
		Global.gameOver()
	
	
