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

onready var board = get_tree().get_current_scene().get_node("../Board")
onready var sMeter = get_tree().get_current_scene().get_node("Board/Center")
onready var bar1 = get_tree().get_current_scene().get_node("Board/Barricade/RightBar")
onready var bar2 = get_tree().get_current_scene().get_node("Board/Barricade_2/LeftBar")
onready var startR = get_tree().get_current_scene().get_node("StartingPoint_R")
onready var startL = get_tree().get_current_scene().get_node("StartingPoint_L")

onready var startPoint = get_node("Starting Point")
onready var scale_tween = get_node("Scale_Tween")
onready var line = get_node("Line2D")


# Called when the node enters the scene tree for the first time.
func _ready():
	sMeter.frame = 0
	visible = false
	line.visible = false

func _pop_up():
	Engine.time_scale = 0.3
	yield(get_tree().create_timer(.3),"timeout")
	Engine.time_scale = 1
	
	speed = 0
	sMeter.frame = 3
	line.visible = false
	
	visible = false
	scale_tween.interpolate_property(self,"scale",Vector2(0,0),Vector2(0.7,0.7),1,Tween.TRANS_ELASTIC,Tween.EASE_OUT)
	visible = true
	scale_tween.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var collision_info = move_and_collide(velocity*delta)
	
	if velocity == Vector2.ZERO:
		startPoint.visible = true
	else: 
		startPoint.visible = false
	
	if position == startL.position or startR.position:
		if scale_tween.is_active() == false:
			line.visible = true
		else:
			line.visible = false
	
	
	if collision_info:
		var col_name = collision_info.collider.name
		
		if col_name == "RightBound":
			bar1.play(animName[rightBar])
			position = startR.position
			velocity = Vector2.ZERO
			_pop_up()
			if rightBar < 2:
				rightBar += 1
			else:
				#talo na dapat to 
				yield(get_tree().create_timer(.4),"timeout")
				get_tree().reload_current_scene()
			
		if col_name == "LeftBound":
			bar2.play(animName[leftBar])
			position = startL.position
			velocity = Vector2.ZERO
			_pop_up()
			if leftBar < 2:
				leftBar += 1
			else:
				#talo na dapat to 
				yield(get_tree().create_timer(.4),"timeout")
				get_tree().reload_current_scene()
		
		velocity = velocity.bounce(collision_info.normal)
		

		if col_name == "Slasher":
			CamShake.shake(1.5, duration)
			Engine.time_scale = 0.1
			yield(get_tree().create_timer(.04),"timeout")
			Engine.time_scale = 1
			if speed < max_speed:
				if velocity == Vector2.ZERO:
					velocity.x += 50
					velocity.y += 50
				velocity.x *= speed_up
				velocity.y *= speed_up
				speed += 1
				sMeter.frame += 1
		
