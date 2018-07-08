extends Node2D


func _ready():
	var prompt = ["amazing", "dragon", "Bhindi", "feared", "orc"]
	var story = "There once was an %s %s slayer named %s.  He was so %s that even the %ss would run from him."
	$Blackboard/StoryText.text = (story % prompt)
	

func _on_TextureButton_pressed():
	var new_text = $Blackboard/TextBox.get_text()
	_on_TextBox_text_entered(new_text)

func _on_TextBox_text_entered(new_text):
	$Blackboard/StoryText.text = new_text
	$Blackboard/TextBox.text = ""
