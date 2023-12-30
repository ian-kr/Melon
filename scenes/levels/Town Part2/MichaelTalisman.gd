extends Area2D

var collected = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	if (Talisman.talismans.find("Michael") != -1):
		self.hide()
	else:
		self.show()
		get_node("/root/TownP2/CharmMichael").hide()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "Player":
		 # Replace with function body.
		if collected == false:
			self.hide()
			if Talisman.michaelPieces != 2:
				Talisman.michaelPieces += 1
				if Talisman.michaelPieces == 1:
					get_node("/root/TownP2/TextBox").queue("I found a piece of it... It looks like I need 2 more pieces.") 
				else:
					get_node("/root/TownP2/TextBox").queue("I found a piece of it... It looks like I need 1 more piece.") 
			else:
				get_node("/root/TownP2/TextBox").queue("I got all the pieces now. Now I have the full charm.") 
				Talisman.talismans.append("Michael")
				Talisman.michaelPieces = 0
				get_node("/root/TownP2/CharmMichael").show()
				var timer = get_tree().create_timer(3.0)
				Talisman.talismans.append("Raphael")
				
				while (timer.time_left != 0):
					get_node("/root/TownP2/CharmMichael").position = Vector2(get_node("/root/TownP2/Camera2D").position) + Vector2(-13,-50)
					await get_tree().create_timer(0.01).timeout
			
				print("Hiding")
				get_node("/root/TownP2/CharmMichael").hide()
			
			collected = true
			
