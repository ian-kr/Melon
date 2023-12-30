extends CharacterBody2D

var velo = Vector2(1,0)
var speed : int = 300


func _physics_process(delta):
	
	if $ezkiel.facing == "down":
		velo = Vector2(0,1)
	if $ezkiel.facing == "up":
		velo = Vector2(0,-1)
	if $ezkiel.facing == "right":
		velo = Vector2(1,0)
	if $ezkeil.facing == "left":
		velo = Vector2(-1,0)
	
	var collision_info = move_and_collide(velo.normalized()*delta*speed)
