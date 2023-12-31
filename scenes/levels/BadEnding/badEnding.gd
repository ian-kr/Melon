extends Node2D
var textFile = "res://scenes/TextScript/TextFiles/badEnd.txt"
var currentFile = FileAccess.open(textFile,FileAccess.READ)
var text = currentFile.get_as_text()

# Called when the node enters the scene tree for the first time.
func _ready():
	text = text.split("\n")
	text.remove_at(text.size()-1)
	var cow = "Cow"
	var locationStart = Talisman.endingLocation
	var cowStart = Talisman.cowLocation
	$Player.position = locationStart
	$Boss.position = cowStart
	if Talisman.phase == 2:
		cow = "GoldenCow"
	$Boss/Cow_Animation.play(cow + "_Idle")
	if (locationStart.x + 253 > 0):
		$Player/AnimationPlayer.play("walk_left")
	else:
		$Player/AnimationPlayer.play("walk_right")
	var tween = create_tween()
	
	tween.tween_property($Player,"position",Vector2(-253,-93),2)
	tween.tween_property($Boss,"position",Vector2(69,-46),1)
	
	await get_tree().create_timer(2.0).timeout
	$Boss/Cow_Animation.play(cow + "_Walking")
	$Player/AnimationPlayer.play("idle_right")
	await get_tree().create_timer(1.0).timeout
	$Boss/Cow_Animation.play(cow + "_Idle")
	for line in text:
		print(line)
		if line == "end":
			$Textbox.queue(line)
			$Textbox/"End Panel"/Label.text = "The End\n\nEnding: Enternal Sleep"
			await pause()
		else:
			$Textbox.queue(line)
	$AudioStreamPlayer.play()
	$Player/AnimationPlayer.play("ded")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func pause():
	#Waits until the pause is empty
	while($Textbox.textqueue.is_empty() != true):
		await get_tree().create_timer(0.5).timeout
	
