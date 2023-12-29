extends Node2D

@onready var timer = $Timer
enum state {
	READY,
	READING,
	FINISHED
}
var currentstate = state.READY
# Called when the node enters the scene tree for the first time.
func _ready():
	var textFile = "res://scenes/TextScript/TextFiles/CowardEnding.txt"
	var currentFile = FileAccess.open(textFile,FileAccess.READ)
	
	var text = currentFile.get_as_text()
	text = text.split("\n")
	text.remove_at(text.size()-1)
	for line in text:
		if line == "pause": 
			otherTraveler() #play animation
		else:
			$TextBox.queue(line)
	pass

func otherTraveler():
	timer.start()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func changeState(newstate):
	currentstate = newstate
func _on_timer_timeout():
	pass
