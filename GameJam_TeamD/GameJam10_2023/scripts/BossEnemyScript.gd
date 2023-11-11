extends Node2D

@export var health = 200

var time = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	wait(delta)

func take_damage(damage_amount):
	health = health - damage_amount
	
	if(health <= 0):
		queue_free()
		

func wait(delta):
	
	time = time + delta
	#print(time)
	
	if(time > 0.5):
		shoot((Vector2(randf_range(50, -50),randf_range(50, -50))).normalized())
		time = 0

func shoot(direction : Vector2):
	var bullet = load("res://objects/bullet.tscn").instantiate()
	bullet.damage = 10
	bullet.direction = direction
	bullet.shooter = self
	bullet.global_position = global_position
	get_tree().root.add_child(bullet)
	#$dwdAudioStreamPlayer2D.play()
	

	
