extends CharacterBody2D

var SPEED = 150.0

var health = 3

func _ready():
	Global.player = self

func _physics_process(delta):
	
	# Move in 4 directions
	var direction = Vector2.ZERO
	if Input.is_action_pressed("left"):
		direction += Vector2.LEFT
	if Input.is_action_pressed("right"):
		direction += Vector2.RIGHT
	if Input.is_action_pressed("up"):
		direction += Vector2.UP
	if Input.is_action_pressed("down"):
		direction += Vector2.DOWN
	
	velocity = direction * SPEED
	move_and_slide()
	
	#play animations
	if velocity.x != 0:
		var walking_left = false
		if velocity.x < 0:
			walking_left = true
		$AnimatedSprite2D.flip_h = walking_left
		$AnimatedSprite2D.play("run_side")
	elif velocity.y > 0:
		$AnimatedSprite2D.play("run_down")
	elif velocity.y < 0:
		$AnimatedSprite2D.play("run_up")
	else:
		$AnimatedSprite2D.play("idle")
	
	#shoot bullets in direction of mouse
	if(Input.is_action_just_pressed("shoot")):
		$pea_shooter.shoot(global_position.direction_to(get_global_mouse_position()))
	
	#say dialogue when we press Q
	if(Input.is_action_just_pressed("dialogue")):
		$dialogue.play_dialogue()

func take_damage(damage_amount):
	#reduce health
	health -= damage_amount
	
	#if we die, destroy the character, and go to the game over screen
	if(health <= 0):
		queue_free()
		get_tree().change_scene_to_file("res://objects/Screens/gameover_screen.tscn")
