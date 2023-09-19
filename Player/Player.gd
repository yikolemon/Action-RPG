extends CharacterBody2D

const FRICTION=200
const ACCELERATION=200
const MAX_SPEED=60*50

func _ready():
	print("hello world")
	

func _physics_process(delta):
	var input_vetor=Vector2.ZERO
	input_vetor.x=Input.get_action_strength("ui_right")-Input.get_action_strength("ui_left")
	input_vetor.y=Input.get_action_strength("ui_down")-Input.get_action_strength("ui_up")
	input_vetor=input_vetor.normalized()
	
#	print(input_vetor)
	
	if input_vetor!=Vector2.ZERO:
		velocity+=input_vetor* ACCELERATION*delta
		print(velocity)
		velocity=velocity.limit_length(MAX_SPEED*delta)
	else:
		velocity=velocity.move_toward(Vector2.ZERO,FRICTION*delta)
	
#	if Input.is_action_pressed("ui_right"):
#		velocity.x=10
#	elif  Input.is_action_pressed("ui_left"):
#		velocity.x=-10
#	elif  Input.is_action_pressed("ui_up"):
#		velocity.y=-10
#	elif Input.is_action_pressed("ui_down"):
#		velocity.y=10
#	else:
#		velocity.x=0
#		velocity.y=0
	move_and_collide(velocity * delta)
