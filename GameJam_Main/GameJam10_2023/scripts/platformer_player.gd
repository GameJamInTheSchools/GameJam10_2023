extends CharacterBody2D

var SPEED = 200.0
var JUMP_SPEED = -400.0
var GRAVITY = 980
var animation_direction = Vector2.RIGHT

var health = 3

func _physics_process(delta):
	# gravity
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_SPEED
		$AudioStreamPlayer2D.play()
	
	# Move left and right
	var direction = Vector2.ZERO
	if Input.is_action_pressed("left"):
		direction += Vector2.LEFT
	if Input.is_action_pressed("right"):
		direction += Vector2.RIGHT
	
	velocity.x = direction.x * SPEED
	move_and_slide()
	
	# Play animations
	if not is_on_floor():
		$AnimatedSprite2D.play("jump")
	elif velocity.x != 0:
		animation_direction = direction
		var walking_backwards = false
		if velocity.x < 0:
			walking_backwards = true
		$AnimatedSprite2D.flip_h = walking_backwards
		$AnimatedSprite2D.play("run_side")
	else:
		$AnimatedSprite2D.play("idle")
		
	#shoot bullets in the direction you are looking
	if Input.is_action_just_pressed("shoot"):
		$pea_shooter.shoot(animation_direction)
	
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
