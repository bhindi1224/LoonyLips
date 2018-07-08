extends Node2D


func _ready():
	var prompt = ["amazing", "dragon", "Bhindi", "feared", "orc"]
	var story = "There once was an %s %s slayer named %s.  He was so %s that even the %ss would run from him."
	$Blackboard/StoryText.bbcode_text = (story % prompt)
	