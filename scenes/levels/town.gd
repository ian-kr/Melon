extends Node2D

@onready var plr = $Player
# Called when the node enters the scene tree for the first time.
func _ready():
	var introText = "res://scenes/TextScript/intro.txt"
	var currentFile = FileAccess.open(introText,FileAccess.READ)
	
	var text = currentFile.get_as_text()
	text = text.split("\n")
	text.remove_at(text.size()-1)
	for line in text:
		$TextBox.queue(line)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
