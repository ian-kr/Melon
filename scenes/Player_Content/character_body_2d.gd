extends CharacterBody2D

@export var SPEED: float = 150.0

var input_direction : Vector2 = Vector2.ZERO
var facing = "down"

func _ready():
	$AnimationPlayer.play("walk_right")
func get_input():
	input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * SPEED

func _physics_process(delta):
	get_input()
	# Animation
	if velocity != Vector2.ZERO:  # Check if the player is moving
		if Input.is_action_just_pressed("up"):
			$AnimationPlayer.play("walk_up")
			facing = "up"
		if Input.is_action_just_pressed("down"):
			$AnimationPlayer.play("walk_down")
			facing = "down"
		if Input.is_action_just_pressed("right"):
			$AnimationPlayer.play("walk_right")
			facing = "right"
		if Input.is_action_just_pressed("left"):
			$AnimationPlayer.play("walk_left")
			facing = "left"
	else:  # Player is not moving, play idle animation
		$AnimationPlayer.play("idle_"+facing)  # Replace "idle" with your actual idle animation name
	
	move_and_slide()

