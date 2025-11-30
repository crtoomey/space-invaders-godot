extends Node2D

@onready var score_label: Label = $ScoreLabel
@onready var highscore_label: Label = $HighscoreLabel
@onready var game: Node2D = $"."
@onready var click_sound: AudioStreamPlayer2D = $ClickSound

func _ready() -> void:
	Global.getHighScore(Global.score)
	score_label.text = str(Global.score)
	highscore_label.text = str(Global.highScore)


func _on_restart_button_pressed() -> void:
	click_sound.play()
	Global.score = 0
	Global.life = 3
	Global.enemyNum = 0
	await get_tree().create_timer(.2).timeout
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_main_menu_button_pressed() -> void:
	click_sound.play()
	Global.score = 0
	Global.life = 3
	Global.enemyNum = 0
	await get_tree().create_timer(.2).timeout
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
