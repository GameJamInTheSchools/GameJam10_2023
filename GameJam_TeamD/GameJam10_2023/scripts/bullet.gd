extends Area2D

var direction = Vector2.ZERO
var shooter = null
var SPEED = 500
var damage = 1

func _process(delta):
	#move the bullet
	position += direction * SPEED * delta

func _on_body_entered(body):
	#hit things
	if body != shooter:
		queue_free()
		
		#deal damage to the thing hit
		if(body.has_method("take_damage")):
			body.take_damage(damage)
