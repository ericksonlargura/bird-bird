extends KinematicBody2D

var gravity = 300
var velocity = Vector2.ZERO
var maxSpeed = 100
var jumpForce = 200

func _ready():
	pass # Replace with function body.

func _process(delta):
	var moveVector = Vector2.ZERO
	moveVector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	moveVector.y = -1 if Input.is_action_just_pressed("jump") else 0
	
	velocity.x = moveVector.x * maxSpeed
	
	if(moveVector.y < 0 && is_on_floor()):
		velocity.y = moveVector.y * jumpForce
	
	
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
