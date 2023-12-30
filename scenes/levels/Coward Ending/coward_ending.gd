extends Node2D
@onready var plr = $plr
@onready var other = $"Other traveler"



enum state {
	READY,
	READING,
	FINISHED
}
var currentstate = state.READY
var currentAnimation = []
# Called when the node enters the scene tree for the first time.
func _ready():
	other.position = Vector2(28,305)
	plr.position = Vector2(657,92)
	var textFile = "res://scenes/TextScript/TextFiles/CowardEnding.txt"
	var currentFile = FileAccess.open(textFile,FileAccess.READ)
	
	var text = currentFile.get_as_text()
	text = text.split("\n")
	text.remove_at(text.size()-1)
	moveSprite(plr,Vector2(657,300),5.0)
	plr.play("Walking Forward")
	
	for line in text:
		if line == "pause":
			$TextBox.queue(line)
			await pause() #play animation
			await otherTraveler()
		if line == "end":
			$TextBox.queue(line)
			$TextBox/"End Panel"/Label.text = "The End\n\nEnding: Coward"
			await pause()
		else:
			$TextBox.queue(line)
	moveSprite(plr,Vector2(-3000,318),20)
	moveSprite(other, Vector2(-3050,318),20)
	plr.play("Walking Left")
	other.play("Walk Left")
	$AudioStreamPlayer.play()
	await get_tree().create_timer(20.0).timeout
	plr.play("Walking Forward")
	plr.stop()
	other.play("IdleLeft")
	other.stop()

func moveSprite(sprite,pos,time):
	currentAnimation.append(sprite)
	var tween = create_tween()
	tween.tween_property(sprite,"position",pos,time)
	tween.connect("finished",on_tween_finished)
	
func on_tween_finished():
	currentAnimation.pop_front().stop()
	
func otherTraveler():
	other.play("Walk Right")
	moveSprite(other,Vector2(589,305),3)
	await get_tree().create_timer(3.0).timeout
	other.play("IdleRight")
	other.stop()

func pause():
	#Waits until the pause is empty
	while($TextBox.textqueue.is_empty() != true):
		await get_tree().create_timer(0.5).timeout
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func changeState(newstate):
	currentstate = newstate

