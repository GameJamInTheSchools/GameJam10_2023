extends CharacterBody2D

var SPEED = 25.0

var health = 5 if name != "Final Boss" else 15

var detectedPlayer:Node2D = null
var _timer = null

func _on_timer_timeout():
	if detectedPlayer != null:
		$fireball_shooter.shoot(global_position.direction_to(detectedPlayer.position))

func _ready():
	Global.player = self
	_timer = Timer.new()
	add_child(_timer)
	
	_timer.connect("timeout", _on_timer_timeout)
	_timer.set_wait_time(1.0)
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()

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
		if(name == "Final Boss"):
			get_tree().change_scene_to_file("res://objects/screens/credits_screen.tscn")




func _on_area_2d_body_entered(body):
	if body.name == "Player":
		detectedPlayer = body

