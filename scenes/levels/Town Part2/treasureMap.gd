extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$TreasureMap.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "Player":
		$TreasureMap.show()
		get_node("/root/TownP2/TextBox").queue("This is a map. Maybe I should follow it.")
		get_node("/root/TownP2/TextBox").queue("pause")
		await pause()
		$TreasureMap.hide()
		get_node("/root/TownP2/pond").mapfound = true

func pause():
	#Waits until the pause is empty
	while(get_node("/root/TownP2/TextBox").textqueue.is_empty() != true):
		await get_tree().create_timer(0.5).timeout
