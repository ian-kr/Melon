extends Node2D

var battle : bool = false
var has_fish : bool = false
var has_sword : bool = false
var has_flower : bool = true

func _ready():
	var controls = "Controls\n"
	if len(Talisman.talismans) == 0:
		$Talismans/Panel.hide()
		var textFile = "res://scenes/TextScript/TextFiles/insideBarnIntro.txt"
		var currentFile = FileAccess.open(textFile,FileAccess.READ)
		#Play the scene
		var text = currentFile.get_as_text()
		text = text.split("\n")
		text.remove_at(text.size()-1)
		for line in text:
			$Textbox.queue(line)
	else:
		$Talismans/Panel.show()
		$Talismans.showTalismans()
		$Textbox.queue("Now it's finally time to fight him!")
		battle = true
		Talisman.battle = true
		for talisman in Talisman.talismans:
			if talisman == "Gabriel":
				has_flower = true
				controls += "Heal: L\n"
			if talisman == "Michael":
				has_sword = true
				controls += "Sword: J\n"
			if talisman == "Raphael":
				has_fish = true
				controls += "Fish: K\n"
		$Talismans/Panel/Panel2/Label.text = controls			
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if battle:
		$Talismans/Panel/Label.text = "Health: " + str($Player.health)
		if Input.is_action_just_pressed("fish") and has_fish == true:
			Fish_Attack()
		if Input.is_action_just_pressed("swing") and has_sword == true:
			Sword_Attack()
		if Input.is_action_just_pressed("heal") and has_flower == true:
			Flower_Heal()
		
	

func Fish_Attack():
	$Player.shoot()
	
func Sword_Attack():
	get_node("Player/SwingArea/SwordSwingShape").set_deferred("disabled", false)
	await get_tree().create_timer(1.0).timeout
	get_node("Player/SwingArea/SwordSwingShape").set_deferred("disabled", true)
	
func Flower_Heal():
	$Player.health = ($Player.health + 20) % 100
	#TODO : Play animation of healing
