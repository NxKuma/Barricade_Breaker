extends KinematicBody2D

export var speed_up = 1.1
export var max_speed = 15


var velocity = Vector2.ZERO
var speed = 0

onready var sMeter = get_tree().get_current_scene().get_node("Board").get_child(1)

# Called when the node enters the scene tree for the first time.
func _ready():
	sMeter.frame = 3


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var collision_info = move_and_collide(velocity*delta)
	
	if collision_info:
		velocity = velocity.bounce(collision_info.normal)
		if speed < max_speed:
			if velocity == Vector2.ZERO:
				velocity.x += 50
				velocity.y += 50
			velocity.x *= speed_up
			velocity.y *= speed_up
			speed += 1
			sMeter.frame += 1
			print(speed)
		
