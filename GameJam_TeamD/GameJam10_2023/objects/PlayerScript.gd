extends CharacterBody2D


@export var speed = 300.0
@export var jump_height = -600.0

@export var jump_charge = 0

var slider

# Get the gravity from the project settings
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Called when the node enters the scene tree for the first time.
func _ready():
	#get slider
	slider = $VSlider
	#hide slider
	slider.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_pressed("Jump") and is_on_floor():
		#add to jump charge
		jump_charge += delta
		
		#show slider
		slider.visible = true
		#set slider value
		slider.value = jump_charge
		
	#print when jump relased
	if Input.is_action_just_pressed("Jump"):
		print("jump button pressed")
		
	
	#if jump relased
	if Input.is_action_just_released("Jump") and is_on_floor():
		Jump_()
		
	#if fell off platform while charging
	if jump_charge > 0 and is_on_floor() == false:
		Jump_()

	# Get the input direction.
	var direction = Input.get_axis("Left", "Right")
	velocity.x = direction * speed
	#do movement
	move_and_slide()
	
func Jump_():
	#cap jump charge
	if(jump_charge > 1):
		jump_charge = 1
		print("jump charge capped at 1")

	#calculate jump height
	jump_height = (jump_charge * 2 ) * -200 + -500
	
	print("jump height is ", jump_height * -1)
	
	velocity.y = jump_height
		
	#reset jump charge
	jump_charge = 0
		
	#hide slider
	slider.visible = false
	#reset slider value
	slider.value = jump_charge
