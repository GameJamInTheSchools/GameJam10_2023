extends CharacterBody2D

var SPEED = 15.0

var health = 3

var detectedPlayer:Node2D = null

func _ready():
	Global.player = self

func _physics_process(delta):
	
	var direction = Vector2.ZERO
	if detectedPlayer != null:
		direction = global_position.direction_to(detectedPlayer.position)
	
	velocity = direction * SPEED
	move_and_slide()
	
	#play animations
	if velocity.x != 0:
		var walking_left = true
		if velocity.x < 0:
			walking_left = false
		$AnimatedSprite2D.flip_h = walking_left
		$AnimatedSprite2D.play("run_side")
	elif velocity.y > 0:
		$AnimatedSprite2D.play("run_down")
	elif velocity.y < 0:
		$AnimatedSprite2D.play("run_up")
	else:
		$AnimatedSprite2D.play("idle")
	
	#shoot bullets in direction of mouse
	#if(Input.is_action_just_pressed("shoot")):
	#	$pea_shooter.shoot(global_position.direction_to(get_global_mouse_position()))
	
	#say dialogue when we press Q
	#if(Input.is_action_just_pressed("dialogue")):
	#	$dialogue.play_dialogue()

func take_damage(damage_amount):
	#reduce health
	health -= damage_amount
	
	#if we die, destroy the character, and go to the game over screen
	if(health <= 0):
		queue_free()




func _on_area_2d_body_entered(body):
	detectedPlayer = body



func _on_area_2d_body_exited(body):
	detectedPlayer = null

