extends CharacterBody2D

@export var SPEED: float = 150.0

const bulletPath = preload("res://fish_bullet.tscn")

var input_direction : Vector2 = Vector2.ZERO
var facing = "down"
var health : int = 100
var fish = 0
func _ready():
	$AnimationPlayer.play("walk_right")
func get_input():
	input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * SPEED

func _physics_process(delta):
	get_input()
	if(Input.is_action_just_pressed("fish")):
		shoot()
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

#TODO FIX THE GODDAMN FISH
func shoot():
	fish += 1
	var bullet = bulletPath.instantiate()
	bullet.name = "fish"+ str(fish)
	get_parent().add_child(bullet)
	bullet.position = $Marker2D.global_position

func swing():
	pass
