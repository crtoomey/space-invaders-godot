extends Node

var score = 0
var highScore = 0
var life = 3
var mothershipHitCount = 0
var enemyNum = 0
var secretExplosionHasHappened = false
var gameOverHasHappened = false
var gameOverScreen = preload("res://scenes/game_over_screen.tscn")
var hasKilled3Motherships = false
var hasGraySkin = false
var hasYellowSkin = false
var hasBlueSkin = false
var hasBlackSkin = false
var playerSkin = "Purple"

func getHighScore(newScore):
	print(newScore)
	if newScore >= highScore:
		highScore = newScore
		#print(highScore)
	else:
		highScore = highScore

func getEnemies():
	var enemyArray = get_tree().get_nodes_in_group("Enemies")
	return enemyArray

func gameOver():
	#print("Game Over")
	gameOverHasHappened = true
	await get_tree().create_timer(1).timeout
	gameOverHasHappened = false
	await get_tree().process_frame
	get_tree().change_scene_to_file("res://scenes/game_over_screen.tscn")

func getSkins():
	
	
	if hasKilled3Motherships == true:
		hasBlueSkin = true
	
	if secretExplosionHasHappened == true:
		hasBlackSkin = true

func setSkin(skin):
	if skin == 0:
		playerSkin = "Purple"
	elif skin == 1:
		playerSkin = "Gray"
	elif skin == 2:
		playerSkin = "Yellow"
	elif skin == 3:
		playerSkin = "Blue"
	elif skin == 4:
		playerSkin = "Black"
	else: 
		print("Unable to set skin")
