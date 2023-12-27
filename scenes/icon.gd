#This is an example and a test to see if you have everything sorted out in godot
#After clicking start the godot icon should move to the left then to the right then thte left and so on...
extends Sprite2D

const SPEED : int = 10
var direction: int = 1
var pos: Vector2 = Vector2.ZERO # we do not want to change the icons variables directly it should be indirect

# Called when the node enters the scene tree for the first time.
func _ready():
	pos = Vector2(300,300)
	position = pos
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if pos.x  >= 900:
		direction = -1
	if pos.x <= 0:
		direction = 1
	pos.x += (SPEED*direction)
	position = pos
	pass
