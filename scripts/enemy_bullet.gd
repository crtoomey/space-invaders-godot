extends CharacterBody2D

func _process(delta: float) -> void:
	position.y += 1 * 200 * delta
