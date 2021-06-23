extends Node


var camera_shake_intensity = 0.0
var camera_shake_duration = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func shake(intensity, duration):
	if intensity > camera_shake_intensity and duration > camera_shake_duration:
		camera_shake_intensity = intensity
		camera_shake_duration = duration

func _process(delta):
	var camera = get_tree().current_scene.get_node("Camera2D")
	
	if camera_shake_duration <= 0:
		camera.offset = Vector2.ZERO
		camera_shake_intensity = 0.0
		camera_shake_duration = 0.0
		return
		
	camera_shake_duration = camera_shake_duration - delta
	
	var offset = Vector2.ZERO
	offset = Vector2(randf(), randf()) * camera_shake_intensity
	camera.offset = offset
	
