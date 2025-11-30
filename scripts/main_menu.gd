extends Node2D

@onready var click_sound: AudioStreamPlayer2D = $ClickSound
@onready var player: CharacterBody2D = $Player
@onready var shipObject = preload("res://scenes/menu_ship.tscn")

var columns = 6
var rows = 4
var marginY = 100
var marginX = 375
var hasStarted = false

func _ready() -> void:
	loadMenu()

func _physics_process(delta: float) -> void:
	var ship = get_node("MenuShip")
	if hasStarted == true:
		ship.position.y += -300 * delta
		


func loadMenu():
	for r in rows:
		for c in columns:
			if c == 3 and r == 1:
				var newShip = shipObject.instantiate()
				add_child(newShip)
				var sprite = newShip.get_child(0)
				sprite.region_enabled = true
				sprite.region_rect = setShipSkin()
				newShip.position = Vector2(marginX  + (64 * c), marginY + (64 * r))
				
			elif c == 2 and r == 2:
				var newShip = shipObject.instantiate()
				add_child(newShip)
				var sprite = newShip.get_child(0)
				sprite.region_enabled = true
				if Global.hasGraySkin == true and Global.playerSkin != "Gray":
					sprite.region_rect = Rect2(64,0,32,32)
				elif Global.hasGraySkin == true and Global.playerSkin == "Gray":
					sprite.region_rect = Rect2(32,0,32,32)
				else:
					sprite.region_rect = Rect2(0,0,32,32)
				newShip.position = Vector2(marginX  + (64 * c),marginY + (64 * r))
				
			elif c == 4 and r == 2:
				var newShip = shipObject.instantiate()
				add_child(newShip)
				var sprite = newShip.get_child(0)
				sprite.region_enabled = true
				if Global.hasYellowSkin == true and Global.playerSkin != "Yellow":
					sprite.region_rect = Rect2(96,0,32,32)
				elif Global.hasYellowSkin == true and Global.playerSkin == "Yellow":
					sprite.region_rect = Rect2(32,0,32,32)
				else:
					sprite.region_rect = Rect2(0,0,32,32)
				
				newShip.position = Vector2(marginX + (64 * c),marginY + (64 * r))
				
			elif c == 1 and r == 3:
				var newShip = shipObject.instantiate()
				add_child(newShip)
				var sprite = newShip.get_child(0)
				sprite.region_enabled = true
				if Global.hasBlueSkin == true and Global.playerSkin != "Blue":
					sprite.region_rect = Rect2(128,0,32,32)
				elif Global.hasBlueSkin == true and Global.playerSkin == "Blue":
					sprite.region_rect = Rect2(32,0,32,32)
				else:
					sprite.region_rect = Rect2(0,0,32,32)
				newShip.position = Vector2(marginX + (64 * c),marginY + (64 * r))
				
			elif c == 5 and r == 3:
				var newShip = shipObject.instantiate()
				add_child(newShip)
				var sprite = newShip.get_child(0)
				sprite.region_enabled = true
				if Global.hasBlackSkin == true and Global.playerSkin != "Black":
					sprite.region_rect = Rect2(160,0,32,32)
				elif Global.hasBlackSkin == true and Global.playerSkin == "Black":
					sprite.region_rect = Rect2(32,0,32,32)
				else:
					sprite.region_rect = Rect2(0,0,32,32)
				newShip.position = Vector2(marginX  + (64 * c),marginY + (64 * r))
				


func _on_start_button_pressed() -> void:
	click_sound.play()
	hasStarted = true
	await get_tree().create_timer(1.5).timeout
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	


func _on_skins_button_pressed() -> void:
	click_sound.play()
	await get_tree().create_timer(.2).timeout
	get_tree().change_scene_to_file("res://scenes/skins_menu.tscn")
	

func setShipSkin():
	var skin = Rect2(0,0,0,0)
	if Global.playerSkin == "Purple":
		skin = Rect2(32,0,32,32)
	elif Global.playerSkin == "Gray":
		skin = Rect2(64,0,32,32)
	elif Global.playerSkin == "Yellow":
		skin = Rect2(96,0,32,32)
	elif Global.playerSkin == "Blue":
		skin = Rect2(128,0,32,32)
	elif Global.playerSkin == "Black":
		skin = Rect2(160,0,32,32)
	return skin
