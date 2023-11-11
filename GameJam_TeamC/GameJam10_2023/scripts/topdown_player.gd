extends CharacterBody2D

var SPEED = 150.0

var health = 20
var playedFinalBossDialog = false

func _ready():
	Global.player = self
	if(Global.scene == "main"):
		$dialogue.play_dialogue(0)
	elif(Global.scene == "final"):
		$dialogue.play_dialogue(2)

func _physics_process(delta):
	
	if(Global.dialogue_playing):
		return
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
	if(Input.is_action_just_pressed("shoot")):
		$fireball_shooter.shoot(global_position.direction_to(get_global_mouse_position()))
		

func take_damage(damage_amount):
	if(Global.dialogue_playing):
		return
	#reduce health
	health -= damage_amount
	
	#if we die, destroy the character, and go to the game over screen
	if(health <= 0):
		queue_free()
		get_tree().change_scene_to_file("res://objects/Screens/gameover_screen.tscn")


func _on_final_boss_dialog_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	pass # Replace with function body.


func _on_final_boss_dialog_body_entered(body):
	if(playedFinalBossDialog == false):
		$dialogue.play_dialogue(3)
		playedFinalBossDialog = true
