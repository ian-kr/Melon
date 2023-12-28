extends CharacterBody2D

const SPEED : int = 300.0
	

func _physics_process(delta):
	
	move_and_slide()
