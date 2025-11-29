extends Node

var score = 0
var life = 3

func getEnemies():
	var enemyArray = get_tree().get_nodes_in_group("Enemies")
	return enemyArray
