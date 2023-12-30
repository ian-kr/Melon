extends CharacterBody2D

const SPEED : int = 300.0
	
var moving : bool = false
var health : int = 500
	
	
func _ready():
	$Cow_Animation.play("Cow_Idle")


func _physics_process(delta):
	move_and_slide()
