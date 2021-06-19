extends KinematicBody2D

var velocity = Vector2(50,50)
export var speed_up = 1.25
var speed = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	var collision_info = move_and_collide(velocity*delta)
	
	if collision_info:
		velocity = velocity.bounce(collision_info.normal)
		if speed < 10:
			velocity.x *= speed_up
			velocity.y *= speed_up
			speed += 1
		
		
