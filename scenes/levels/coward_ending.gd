extends Node2D

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
			$TextBox.queue(line)
			await pause() #play animation
			await otherTraveler()
		else:
			$TextBox.queue(line)
	pass

func otherTraveler():
	#Play animation here
	await get_tree().create_timer(5.0).timeout


func pause():
	#Waits until the pause is empty
	while($TextBox.textqueue.is_empty() != true):
		await get_tree().create_timer(0.5).timeout
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func changeState(newstate):
	currentstate = newstate

