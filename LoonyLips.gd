extends Node2D

var player_words = [] # the words the player chooses
var template = [
		{
		"prompt": ["an adjective (one syllable)", "another adjective (two syllables)", "an animal (one syllable)"],
		"story": "A %s %s pond...\nA %s jumps into the pond,\nSplash! Silence again."
		},
		{
		"prompt": ["an adjective", "a creature", "a name", "another adjective", "a type of monster"],
		"story" : "There once was a %s %s slayer named %s.  He was so %s that even the %ss would run from him."
		}
		]
var current_story


func _ready():
	randomize()
	current_story = template[randi() % template.size()]
	$Blackboard/StoryText.text = "Welcome to Loony Lips!  We are going to have an amazing time together.  If you'll just give me a few words, I'll give you funny stories.  \n\n\nCan I have " + current_story.prompt[player_words.size()] + " please?"
	$Blackboard/TextBox.text = ""
	
func _on_TextureButton_pressed():
	if is_story_done():
		get_tree().reload_current_scene()
	else: 
		var new_text = $Blackboard/TextBox.get_text()
		_on_TextBox_text_entered(new_text)

func _on_TextBox_text_entered(new_text):
	player_words.append(new_text)
	$Blackboard/TextBox.text = ""
	check_player_word_length()

func is_story_done():
	return player_words.size() == current_story.prompt.size()

func prompt_player():
	$Blackboard/StoryText.text = ("Can I have " + current_story.prompt[player_words.size()] + ", please?")
	
func check_player_word_length():
	if is_story_done():
		tell_story()
	else:
		prompt_player()
		
func tell_story():
	$Blackboard/StoryText.text = current_story.story % player_words
	$Blackboard/TextureButton/RichTextLabel.text = "Again!"
	end_game()

func end_game():
	$Blackboard/TextBox.queue_free()