extends Node2D

var rows = 4
var columns = 8
var margin = 64
var randNum = randf_range(10,30)


@onready var enemyObject = preload("res://scenes/enemy.tscn")
@onready var mothershipObject = preload("res://scenes/mothership.tscn")
@onready var score: Label = $Score
@onready var shields_ui: Sprite2D = $ShieldsUI
@onready var mothership_timer: Timer = $MothershipTimer
@onready var game: Node2D = $"."

func  _ready() -> void:
	loadLevel()
	mothership_timer.wait_time = randNum
	mothership_timer.start()
	
func _process(delta: float) -> void:
	
	score.text = str(Global.score)
	#check to see if skins are unlocked
	if Global.score >= 1000:
		#print("Gray skin unlocked")
		Global.hasGraySkin = true
	if Global.score >= 3200:
		#print("Yellow skin unlocked")
		Global.hasYellowSkin = true
	if Global.hasKilled3Motherships == true:
		#print("Blue skin unlocked")
		Global.hasBlueSkin = true
		#print(Global.hasBlueSkin)
	#handles losing life and game overs
	if Global.life == 3:
		shields_ui.region_rect = Rect2(0,0,96,32)
	elif Global.life == 2:
		shields_ui.region_rect = Rect2(32,0,64,32)
	elif Global.life == 1:
		shields_ui.region_rect = Rect2(64,0,32,32)
	else:
		shields_ui.visible = false
		Global.gameOver()
		
		
	if Global.enemyNum == 0:
		
		newRound()

func loadLevel():
	for r in rows:
		for c in columns:
			var newEnemy = enemyObject.instantiate()
			add_child(newEnemy)
			Global.enemyNum += 1
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
			
	
func makeMothership():
	var newMothership = mothershipObject.instantiate()
	add_child(newMothership)
	newMothership.position = Vector2(1000, 32)


func _on_mothership_timer_timeout() -> void:
	makeMothership()
	randNum = randf_range(20,50)
	# reset timer
	mothership_timer.wait_time = randNum
	mothership_timer.start()

func newRound():
	rows = randf_range(1, 4)
	columns = randf_range(1, 8)
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
			
			newEnemy.position = Vector2(250 + (64 * c), 1 + (64 * r))
			Global.enemyNum += 1
			
