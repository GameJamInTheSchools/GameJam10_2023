extends Node

@export var health = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func take_damage(damage_amount):
	health = health - damage_amount
	
	if(health <= 0):
		queue_free()
