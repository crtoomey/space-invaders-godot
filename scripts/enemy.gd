extends CharacterBody2D
@onready var enemyBulletObject = preload("res://scenes/enemy_bullet.tscn")
@onready var game: Node2D = $".."
@onready var enemy_bullet_timer: Timer = $"../EnemyBulletTimer"
@onready var explosion_animation: AnimatedSprite2D = $ExplosionAnimation
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var enemy: CharacterBody2D = $"."
@onready var explosion_particles: GPUParticles2D = $ExplosionParticles

func _process(delta: float) -> void:
	pass
	
	
func fireRandomly():

	var enemyBullet = enemyBulletObject.instantiate()

	game.add_child(enemyBullet)
	enemyBullet.position = position


func _on_enemy_bullet_timer_timeout() -> void:
	enemy_bullet_timer.wait_time = randf_range(3, 10)
	fireRandomly()

func enemyHit():
	explosion_particles.emitting = true
	#explosion_animation.play()
	
	
	
	
	
