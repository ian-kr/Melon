extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if len(Talisman.talismans) == 0:
		var textFile = "res://scenes/TextScript/TextFiles/insideBarnIntro.txt"
		var currentFile = FileAccess.open(textFile,FileAccess.READ)
		#Play the scene
		var text = currentFile.get_as_text()
		text = text.split("\n")
		text.remove_at(text.size()-1)
		for line in text:
			$Textbox.queue(line)
	else:
		$Talismans.showTalismans()
		$Textbox.queue("Now it's finally time to fight him!")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
