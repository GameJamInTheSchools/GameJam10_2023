extends Node2D

func shoot(direction : Vector2):
	var bullet = load("res://objects/fireball.tscn").instantiate()
	bullet.direction = direction
	bullet.shooter = get_parent()
	bullet.global_position = global_position
	get_tree().root.add_child(bullet)
	$AudioStreamPlayer2D.play()
