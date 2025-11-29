extends CharacterBody2D

var direction = 1
var speed = 32
var randNum = randf_range(5,30)

@onready var enemyBulletObject = preload("res://scenes/enemy_bullet.tscn")
@onready var game: Node2D = $".."
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var enemy: CharacterBody2D = $"."
@onready var explosion_particles: GPUParticles2D = $ExplosionParticles
@onready var enemy_bullet_timer: Timer = $EnemyBulletTimer
@onready var left_engine_particles: GPUParticles2D = $LeftEngineParticles
@onready var right_engine_particles: GPUParticles2D = $RightEngineParticles


func  _ready() -> void:
	startDirection()
	# start initial timer
	enemy_bullet_timer.wait_time = randNum
	enemy_bullet_timer.start()
	


func _physics_process(delta: float) -> void:
	
	
	#velocity = Vector2(1,1)
	var collision = move_and_collide(velocity * delta)
	
		# check to see if a collision occurred
	if collision:
		if collision.get_collider().name == "Borders":
			#print("collision")
			direction = direction * -1
			#velocity.x = 0
			await get_tree().create_timer(.5).timeout
			velocity.x = speed * direction
			var yCoord = position.y
		
			if position.y < yCoord + 32:
				position.y += 64 * delta
			else:
				velocity.y = 0
		
		
	
	
#func fireRandomly():
	#var randNum = randf_range(5, 20)
	#await get_tree().create_timer(randNum).timeout
	


	

func enemyHit():
	Global.score += 100
	print(Global.score)
	explosion_particles.emitting = true
	#explosion_animation.play()
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
	enemy.queue_free()
	
func startDirection():
	velocity = Vector2(speed, 0)


func _on_enemy_bullet_timer_timeout() -> void:
	var enemyBullet = enemyBulletObject.instantiate()
	game.add_child(enemyBullet)
	enemyBullet.position = position
	
	# reset timer
	enemy_bullet_timer.wait_time = randNum
	enemy_bullet_timer.start()
