extends CharacterBody2D

var direction = 0
var speed = 300
var screenSize = 960
@onready var bulletObject = preload("res://scenes/player_bullet.tscn")
@onready var game: Node2D = $".."
@onready var explosion_particles: GPUParticles2D = $ExplosionParticles



	


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
	
	
