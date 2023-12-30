extends Area2D

var entered = false

func _on_body_entered(body):
	if (body.name == "Player"):
		entered = true

func _on_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	entered = false
	
func _process(delta):
	if entered == true:
		if Input.is_action_just_pressed("ui_accept"):
			Talisman.battle = false
			get_tree().change_scene_to_file("res://scenes/levels/Town Part2/townPart2.tscn")
