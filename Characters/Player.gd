extends KinematicBody2D

var FRICTION = 170
var ACCELERATION = 260
var MAX_SPEED = 160

var velocity = Vector2.ZERO
var input_vector = Vector2.ZERO

onready var Aplayer = get_node("AnimationTree")
onready var Atree = get_node("AnimationTree").get("parameters/playback")


func _ready():
	Aplayer.active = true

func _input(event):
	
	if Input.is_action_just_pressed("ui_accept"):
		position.x -= 0.18	
		Atree.travel("Attack")
	elif input_vector.x > 0:
		Atree.travel("Back")
	elif input_vector.x < 0:
		Atree.travel("Forward")
	elif input_vector.x == 0: 
		Atree.travel("Idle")
	
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION)
	
	

func _physics_process(delta):
	move_and_slide(velocity)
	
	for index in get_slide_count():
		var collission = get_slide_collision(index)
		
		if collission.collider.is_in_group("Moving"):
			CamShake.shake(0.8, 0.15)
			Atree.travel("Shield")
			position.x += 0.5
	
	
