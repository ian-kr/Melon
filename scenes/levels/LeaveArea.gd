extends Area2D

var entered : bool = false



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(entered == true):
		if(Input.is_action_just_pressed("ui_accept")):
			get_tree().change_scene_to_file("res://scences/levels/Coward_Ending")


func _on_body_entered(body):
	entered = true
