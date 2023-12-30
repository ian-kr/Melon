extends CharacterBody2D

const SPEED : int = 300.0
	
var moving : bool = false
var health : int = 500
var golden : bool = false
var goldenset : bool = true
func _ready():
	$Cow_Animation.play("Cow_Idle")

func _process(delta):
	
	if health <= 200:
		golden = true
	if golden == true && goldenset == true:
		$Cow_Animation.play("GoldenCow_Idle")
		goldenset = false

func _physics_process(delta):
	move_and_slide()
