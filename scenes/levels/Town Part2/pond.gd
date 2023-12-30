extends Area2D
var claimed = false
var mapfound = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play() # Replace with function body.
	$CharmRaphael.hide()
	claimed = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "Player":
		if mapfound == true:
			if(Input.is_action_just_pressed("ui_accept")):
				if claimed == false:
					claimed = true
					$CharmRaphael.show()
					get_node("/root/TownP2/TextBox").queue("There it is!")
					# Replace with function body.
					var timer = get_tree().create_timer(3.0)
					Talisman.talismans.append("Raphael")
					while (timer.time_left != 0):
						$CharmRaphael.position = Vector2(get_node("/root/TownP2/Camera2D").position) + Vector2(-5,-50)
						await get_tree().create_timer(0.1).timeout
					$CharmRaphael.hide()
