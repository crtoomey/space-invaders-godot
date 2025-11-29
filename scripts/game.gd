extends Node2D

var rows = 4
var columns = 8
var margin = 32


@onready var enemyObject = preload("res://scenes/enemy.tscn")

func  _ready() -> void:
	loadLevel()
	
func _process(delta: float) -> void:
	pass


func loadLevel():
	for r in rows:
		for c in columns:
			var newEnemy = enemyObject.instantiate()
			add_child(newEnemy)
			var sprite = newEnemy.get_child(0)
			sprite.region_enabled = true
			if r < 1:
				sprite.region_rect = Rect2(0,0,32,32)
			elif r < 2:
				sprite.region_rect = Rect2(32,0,32,32)
			elif r < 3:
				sprite.region_rect = Rect2(64,0,32,32)
			else:
				sprite.region_rect = Rect2(96,0,32,32)
			newEnemy.position = Vector2(250 + (64 * c), margin + (64 * r))
			
	
	
func moveEnemies():
	pass
