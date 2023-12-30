extends Node2D

var battle : bool = false
var has_fish : bool = false
var has_sword : bool = false
var has_flower : bool = false



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
		battle = true
		for talisman in Talisman.talismans:
			if talisman == "Gabriel":
				has_flower = true
			if talisman == "Michael":
				has_sword = true
			if talisman == "Raphael":
				has_fish = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if battle:
		if Input.is_action_just_pressed("fish") and has_fish == true:
			Fish_Attack()
		if Input.is_action_just_pressed("sword") and has_sword == true:
			Sword_Attack()
		if Input.is_action_just_pressed("flower") and has_flower == true:
			Flower_Heal()
		
	

func Fish_Attack():
	pass
	
func Sword_Attack():
	pass
	
func Flower_Heal():
	pass
	

	
