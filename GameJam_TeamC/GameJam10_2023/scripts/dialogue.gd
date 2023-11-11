extends CanvasLayer

@export_multiline var dialogue : Array[String]

var TEXT_SPEED = 100

var playing_dialogue = false
var dialogue_index = 0

func play_dialogue(index):
	#start the dialogue at the beginning
	set_dialogue_index(index)

func set_dialogue_index(index):
	#set the index of the dialogue
	dialogue_index = index
	$Textbox/RichTextLabel.visible_characters = 0
	
	if(index < dialogue.size()):
		#give the text box the correct dialogue to use
		$Textbox/RichTextLabel.text = dialogue[dialogue_index]
		playing_dialogue = true
		visible = true
		Global.dialogue_playing = true
	else:
		#hide the text box
		playing_dialogue = false
		visible = false
		Global.dialogue_playing = false

func _process(delta):
	if(playing_dialogue):
		#reveal text slowly
		$Textbox/RichTextLabel.visible_characters += TEXT_SPEED * delta
		
		#move on to next dialogue when player presses space
		if(Input.is_action_just_pressed("jump")):
			playing_dialogue = false
			visible = false
			Global.dialogue_playing = false
