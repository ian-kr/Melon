extends Node2D

@onready var plr = $Player
# Called when the node enters the scene tree for the first time.
func _ready():
	var textFile = "res://scenes/TextScript/TextFiles/quest.txt"
	var currentFile = FileAccess.open(textFile,FileAccess.READ)
	#Play the scene
	var text = currentFile.get_as_text()
	text = text.split("\n")
	text.remove_at(text.size()-1)
	for line in text:
		$TextBox.queue(line)
	#Ending


	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_treasure_map_body_entered(body):
	pass # Replace with function body.
