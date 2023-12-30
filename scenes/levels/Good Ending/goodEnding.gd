extends Node2D
var textFile = "res://scenes/TextScript/TextFiles/goodEnding.txt"
var currentFile = FileAccess.open(textFile,FileAccess.READ)
var text = currentFile.get_as_text()

# Called when the node enters the scene tree for the first time.
func _ready():
	text = text.split("\n")

	text.remove_at(text.size()-1)
	print(text)
	var locationStart = Talisman.endingLocation
	var cowStart = Talisman.cowLocation
	$Player.position = locationStart
	$Boss.position = cowStart
	$Player.play("walkLeft")
	var tween = create_tween()
	tween.tween_property($Player,"position",Vector2(295,287),2)
	tween.tween_property($Boss,"position",Vector2(69,-46),2)
	await get_tree().create_timer(2.0).timeout
	$Player.play("idleRight")
	for line in text:
		print(line)
		if line == "end":
			$Textbox.queue(line)
			$Textbox/"End Panel"/Label.text = "The End\n\nEnding: Nice Dinner"
			await pause()
		else:
			$Textbox.queue(line)
	
	$Player.play("cookingCow")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func pause():
	#Waits until the pause is empty
	while($Textbox.textqueue.is_empty() != true):
		await get_tree().create_timer(0.5).timeout
	
