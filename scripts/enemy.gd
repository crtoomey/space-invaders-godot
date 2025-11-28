extends CharacterBody2D
@onready var enemyBulletObject = preload("res://scenes/enemy_bullet.tscn")
@onready var game: Node2D = $".."
@onready var enemy_bullet_timer: Timer = $"../EnemyBulletTimer"

func _process(delta: float) -> void:
	pass
	
func fireRandomly():

	var enemyBullet = enemyBulletObject.instantiate()

	game.add_child(enemyBullet)
	enemyBullet.position = position


func _on_enemy_bullet_timer_timeout() -> void:
	enemy_bullet_timer.wait_time = randf_range(3, 10)
	fireRandomly()
