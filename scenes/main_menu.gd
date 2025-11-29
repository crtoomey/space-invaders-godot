extends Node2D

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
				sprite.region_rect = Rect2(32,0,32,32)
				newShip.position = Vector2(marginX  + (64 * c), marginY + (64 * r))
				newShip.add_to_group("Ships")
			elif c == 2 and r == 2:
				var newShip = shipObject.instantiate()
				add_child(newShip)
				var sprite = newShip.get_child(0)
				sprite.region_enabled = true
				sprite.region_rect = Rect2(0,0,32,32)
				newShip.position = Vector2(marginX  + (64 * c),marginY + (64 * r))
				newShip.add_to_group("Ships")
			elif c == 4 and r == 2:
				var newShip = shipObject.instantiate()
				add_child(newShip)
				var sprite = newShip.get_child(0)
				sprite.region_enabled = true
				sprite.region_rect = Rect2(0,0,32,32)
				newShip.position = Vector2(marginX + (64 * c),marginY + (64 * r))
				newShip.add_to_group("Ships")
			elif c == 1 and r == 3:
				var newShip = shipObject.instantiate()
				add_child(newShip)
				var sprite = newShip.get_child(0)
				sprite.region_enabled = true
				sprite.region_rect = Rect2(0,0,32,32)
				newShip.position = Vector2(marginX + (64 * c),marginY + (64 * r))
				newShip.add_to_group("Ships")
			elif c == 5 and r == 3:
				var newShip = shipObject.instantiate()
				add_child(newShip)
				var sprite = newShip.get_child(0)
				sprite.region_enabled = true
				sprite.region_rect = Rect2(0,0,32,32)
				newShip.position = Vector2(marginX  + (64 * c),marginY + (64 * r))
				newShip.add_to_group("Ships")


func _on_start_button_pressed() -> void:
	hasStarted = true
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file("res://scenes/game.tscn")
