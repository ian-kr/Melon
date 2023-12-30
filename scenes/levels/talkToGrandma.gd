extends Area2D

var entered : bool = false
var textFile = "res://scenes/TextScript/TextFiles/GrandmaEster1.txt"
var currentFile = FileAccess.open(textFile,FileAccess.READ)
var convo = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
var moving = false
var direction = 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (moving == false):
		if (direction == 1):
			moving = true
			direction = 2
			goFront()
		else:
			direction = 1
			moving = true
			goBack()
	if entered == true:
		if convo == false:
			if Input.is_action_just_pressed("ui_accept"):
				convo = true
				var text = currentFile.get_as_text()
				text = text.split("\n")
				text.remove_at(text.size()-1)
				for line in text:
					get_node("/root/Town/TextBox").queue(line)
				pause()


func goFront():
	$GrandmaEster2.play("Left")
	var tween = create_tween()
	tween.tween_property(self,"position",Vector2(68,430),7)
	$Timer.start()
func goBack():
	$GrandmaEster2.play("right")
	var tween = create_tween()
	tween.tween_property(self,"position",Vector2(238,430),7)
	$Timer.start()

func _on_body_entered(body):
	entered = true # Replace with function body.

func pause():
	while(get_node("/root/Town/TextBox").textqueue.is_empty() != true):
		await get_tree().create_timer(0.5).timeout
	

func _on_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	convo = false
	entered = false  # Replace with function body.


func _on_timer_timeout():
	moving = false # Replace with function body.
