extends CharacterBody2D

var direction = 0
var speed = 300
var screenSize = 960
var hasShotRecently = false
@onready var bulletObject = preload("res://scenes/player_bullet.tscn")
@onready var game: Node2D = $".."
@onready var explosion_particles: GPUParticles2D = $ExplosionParticles
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var left_engine_particles: GPUParticles2D = $LeftEngineParticles
@onready var right_engine_particles: GPUParticles2D = $RightEngineParticles
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var explosion_audio: AudioStreamPlayer2D = $ExplosionAudio
@onready var shoot_audio: AudioStreamPlayer2D = $ShootAudio


func _ready() -> void:
	sprite_2d.region_enabled = true
	sprite_2d.region_rect = setShipSkin()
	


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
	if Global.playerSkin == "Black":
		if Input.is_action_pressed("secondary_fire"):
			makeBullet()
	if hasShotRecently == false:
		if Input.is_action_just_pressed("fire"):
			shoot_audio.play()
			hasShotRecently = true
			makeBullet()
	else:
		await get_tree().create_timer(2).timeout
		hasShotRecently = false
		
		

func makeBullet():
	var newBullet = bulletObject.instantiate()
	game.add_child(newBullet)
	if Global.playerSkin == "Black":
		var sprite = newBullet.get_child(0)
		sprite.texture = load("res://assets/spaceinvader player laser.png")
		var particles = newBullet.get_child(2)
		particles.emitting = false
	newBullet.position = position
	return newBullet
	
func playerHit():
	explosion_audio.play()
	explosion_particles.emitting = true
	Global.life -= 1
	collision_shape_2d.disabled = true
	await get_tree().create_timer(1).timeout
	collision_shape_2d.disabled = false
	#print(Global.life)
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
	
	
func setShipSkin():
	var skin = Rect2(0,0,0,0)
	if Global.playerSkin == "Purple":
		skin = Rect2(32,0,32,32)
	elif Global.playerSkin == "Gray":
		skin = Rect2(64,0,32,32)
	elif Global.playerSkin == "Yellow":
		skin = Rect2(96,0,32,32)
	elif Global.playerSkin == "Blue":
		skin = Rect2(128,0,32,32)
	elif Global.playerSkin == "Black":
		skin = Rect2(160,0,32,32)
	return skin
