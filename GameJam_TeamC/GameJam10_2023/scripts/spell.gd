extends Area2D

var direction = Vector2.ZERO
var shooter = null
var SPEED = 200

func _ready():
	$AnimatedSprite2D.play("fire")

func _process(delta):
	#move the bullet
	position += direction * SPEED * delta

func _on_body_entered(body):
	#hit things
	if body != shooter:
		
		if(body.has_method("take_damage")):
			body.take_damage(1)
			SPEED = 0
			var _timer = Timer.new()
			add_child(_timer)
	
			_timer.connect("timeout", _on_timer_timeout)
			_timer.set_wait_time(1.0)
			_timer.start()
		
			$AnimatedSprite2D.play("explode")
			
		#deal damage to the thing hit

func _on_timer_timeout():
	queue_free()
