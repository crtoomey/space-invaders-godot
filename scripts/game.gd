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
			newEnemy.position = Vector2(250 + (64 * c), margin + (64 * r))
			newEnemy.add_to_group("Enemies")
	
	
func moveEnemies():
	pass
