extends Node2D

#Used to determine if the mouse is on the sprite
onready var sprite = get_node("Restart/Sprite")

#Gets the values for the Speed Slider
onready var speed = get_node("GameSpeed/HSlider")
onready var sValue = get_node("GameSpeed/Fast4")

#Gets the values for the Intensity of the Screen Shaker
onready var intensity = get_node("Screen Shake/Intensity/HSlider")
onready var iValue = get_node("Screen Shake/Intensity/Fast4")

#Gets the values for the Duration of the Screen Shaker
onready var duration = get_node("Screen Shake/Duration/HSlider")
onready var dValue = get_node("Screen Shake/Duration/Fast4")

#Get the object to adjust screenshake
onready var ball = get_tree().get_current_scene().get_node("Ball")


var speedValue = 0
var intensityValue = 0
var durationValue = 0

func _process(delta):
	
	speedValue = speed.value 
	sValue.text = String(speedValue)
	
	intensityValue = intensity.value
	iValue.text = String(intensityValue)
	
	durationValue = duration.value
	dValue.text = String(durationValue)
	
	ball.intensity = intensityValue
	ball.duration = durationValue
	Engine.time_scale = speedValue
	

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if sprite.get_rect().has_point(get_local_mouse_position()):
			get_tree().reload_current_scene()
			


