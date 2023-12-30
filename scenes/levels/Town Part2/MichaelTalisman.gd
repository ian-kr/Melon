extends Area2D

var collected = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	self.show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "Player":
		 # Replace with function body.
		if collected == false:
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
			collected = true
			self.hide()
