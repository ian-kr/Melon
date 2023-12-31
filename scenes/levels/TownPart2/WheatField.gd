extends Area2D

var inside = false
var collect = false
@onready var huntTimer = $Timer
var claiming = false #I'm too lazy right now to clean this up


# Called when the node enters the scene tree for the first time.
func _ready():
	$CharmGabriel.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_just_pressed("ui_accept")):
		if claiming == false:
			if (collect == true):
				claiming = true
				collect = false
				$CharmGabriel.show()
				get_node("/root/TownP2/TextBox").queue("Found it.")
				var timer = get_tree().create_timer(3.0)
				if (Talisman.talismans.find("Gabriel") == -1):
					Talisman.talismans.append("Gabriel")
				while (timer.time_left != 0):
					$CharmGabriel.position = Vector2(get_node("/root/TownP2/Camera2D").position) + Vector2(-13,-50)
					await get_tree().create_timer(0.01).timeout
				$CharmGabriel.hide()
				claiming = false
			else:
				if (inside == true):
					inside = false
					get_node("/root/TownP2/TextBox").queue("Too early. I need to keep looking.")	
					huntTimer.stop()
					startHunt()


func startHunt():
	get_node("/root/TownP2/TextBox").queue("Now where is that charm...")
	get_node("/root/TownP2/TextBox").queue("pause")
	await pause()
	inside = true
	huntTimer.wait_time = 7.0
	huntTimer.start()


func _on_body_entered(body):
	print("Yes")
	if (body.name == "Player"):
		if (inside == false):
			startHunt()
			
	
func pause():
	#Waits until the pause is empty
	while(get_node("/root/TownP2/TextBox").textqueue.is_empty() != true):
		await get_tree().create_timer(0.5).timeout
		
func _on_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	inside = false
	collect = false
	huntTimer.stop()


func _on_timer_timeout():
	collect = true
	print("Found!")
