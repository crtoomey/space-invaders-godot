extends Node2D

var skinsArray = []
var counter = 0
@onready var menu_ship: CharacterBody2D = $MenuShip
@onready var right_button: Button = $RightButton
@onready var left_button: Button = $LeftButton
@onready var click_sound: AudioStreamPlayer2D = $ClickSound


func _ready() -> void:
	skinsArray.append("Purple")
	skinsArray.append("Gray")
	skinsArray.append("Yellow")
	skinsArray.append("Locked")
	
	
func _process(_delta: float) -> void:
	if counter == 0:
		var sprite = menu_ship.get_child(0)
		sprite.region_enabled = true
		sprite.region_rect = Rect2(32,0,32,32)
	elif counter == 1 and Global.hasGraySkin == true:
		var sprite = menu_ship.get_child(0)
		sprite.region_enabled = true
		sprite.region_rect = Rect2(64,0,32,32)
	elif counter == 2 and Global.hasYellowSkin == true:
		var sprite = menu_ship.get_child(0)
		sprite.region_enabled = true
		sprite.region_rect = Rect2(96,0,32,32)
	elif counter == 3 and Global.hasBlueSkin == true:
		var sprite = menu_ship.get_child(0)
		sprite.region_enabled = true
		sprite.region_rect = Rect2(128,0,32,32)
	elif counter == 4 and Global.hasBlackSkin == true:
		var sprite = menu_ship.get_child(0)
		sprite.region_enabled = true
		sprite.region_rect = Rect2(160,0,32,32)
	else:
		var sprite = menu_ship.get_child(0)
		sprite.region_enabled = true
		sprite.region_rect = Rect2(0,0,32,32)


func _on_right_button_pressed() -> void:
	click_sound.play()
	counter += 1
	if counter < 5:
		right_button.disabled = false
	elif counter == 5:
		right_button.disabled = true
		left_button.disabled = false
	print(counter)
	


func _on_left_button_pressed() -> void:
	click_sound.play()
	counter -= 1
	if counter > 0:
		left_button.disabled = false
	elif counter == 0:
		left_button.disabled = true
		right_button.disabled = false
	print(counter)


func _on_main_menu_button_pressed() -> void:
	click_sound.play()
	await get_tree().create_timer(.2).timeout
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")



func _on_set_skin_button_pressed() -> void:
	click_sound.play()
	Global.setSkin(counter)
