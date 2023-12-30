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
		Talisman.phase = 2
	if health <= 0:
		Talisman.endingLocation = self.position
		Talisman.cowLocation = get_node("/root/InsideBarn/Boss").position
		get_tree().change_scene_to_file("res://scenes/levels/Good Ending/goodEnding.tscn")
	if golden == true && goldenset == true:
		$Cow_Animation.play("GoldenCow_Idle")
		goldenset = false

func _physics_process(delta):
	move_and_slide()

