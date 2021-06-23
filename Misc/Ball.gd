extends KinematicBody2D

export var speed_up = 1.1
export var intensity = 0.8
export var duration = 0.15
var max_speed = 15


var velocity = Vector2.ZERO
var speed = 0

#For Changing Animation if barricade is hit
var animName = ["1ST", "2ND", "3RD"]
var rightBar = 0
var leftBar = 0

onready var sMeter = get_tree().get_current_scene().get_node("Board").get_child(1)
onready var bar1 = get_tree().get_current_scene().get_node("Board").get_child(2).get_child(1)
onready var bar2 = get_tree().get_current_scene().get_node("Board").get_child(3).get_child(1)

# Called when the node enters the scene tree for the first time.
func _ready():
	sMeter.frame = 3


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var collision_info = move_and_collide(velocity*delta)
	
	if collision_info:
		var col_name = collision_info.collider.name
		
		if col_name == "RightBound":
			bar1.play(animName[rightBar])
			if rightBar < 2:
				rightBar += 1
			else:
				#talo na dapat to 
				yield(get_tree().create_timer(.4),"timeout")
				get_tree().reload_current_scene()
			
		if col_name == "LeftBound":
			bar2.play(animName[leftBar])
			if leftBar < 2:
				leftBar += 1
			else:
				#talo na dapat to 
				yield(get_tree().create_timer(.4),"timeout")
				get_tree().reload_current_scene()
		
		velocity = velocity.bounce(collision_info.normal)
		
#		if col_name == "Slasher":
#			CamShake.shake(1.5, duration)
			
		if col_name == "Slasher":
			CamShake.shake(1.5, duration)
			if speed < max_speed:
				if velocity == Vector2.ZERO:
					velocity.x += 50
					velocity.y += 50
				velocity.x *= speed_up
				velocity.y *= speed_up
				speed += 1
				sMeter.frame += 1
		
