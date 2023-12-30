extends CharacterBody2D

var velo = Vector2(1,0)
var speed : int = 600
@onready var plr = get_node("/root/InsideBarn/Player")

func _physics_process(delta):
	
	if plr.facing == "down":
		velo = Vector2(0,1)
	if plr.facing == "up":
		velo = Vector2(0,-1)
	if plr.facing == "right":
		velo = Vector2(1,0)
	if plr.facing == "left":
		velo = Vector2(-1,0)
	
	var collision_info = move_and_collide(velo.normalized()*delta*speed)
