extends Control

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://level.tscn")

func _on_quit_button_pressed():
	get_tree().quit()

func _on_credits_button_pressed():
	get_tree().change_scene_to_file("res://objects/Screens/credits_screen.tscn")

func _on_howtoplay_button_pressed():
	get_tree().change_scene_to_file("res://objects/Screens/howtoplay_screen.tscn")
