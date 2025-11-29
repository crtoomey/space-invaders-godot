extends CharacterBody2D

var direction = 1
var speed = 32

@onready var enemyBulletObject = preload("res://scenes/enemy_bullet.tscn")
@onready var game: Node2D = $".."
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var enemy: CharacterBody2D = $"."
@onready var explosion_particles: GPUParticles2D = $ExplosionParticles
@onready var enemy_bullet_timer: Timer = $EnemyBulletTimer


func  _ready() -> void:
	startDirection()


func _physics_process(delta: float) -> void:
	
	
	#velocity = Vector2(1,1)
	var collision = move_and_collide(velocity * delta)
	
		# check to see if a collision occurred
	if collision:
		print("collision")
		direction = direction * -1
		await get_tree().create_timer(.5).timeout
		
		var yCoord = position.y
		
		if position.y < yCoord + 32:
			position.y += 64 * delta
		else:
			velocity.y = 0
		velocity.x = speed * direction
		
	
	
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
	
func startDirection():

	velocity = Vector2(speed, 0)


	

	
	
	
