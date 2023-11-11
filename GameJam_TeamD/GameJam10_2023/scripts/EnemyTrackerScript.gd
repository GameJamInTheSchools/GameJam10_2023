extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	self.self_modulate.a = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (get_children().size() <= 0):
		self.self_modulate.a = 225

func _on_scene_4_pressed():
	get_tree().change_scene_to_file("res://objects/screens/title_screen.tscn")
