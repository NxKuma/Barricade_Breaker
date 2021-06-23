extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var ball = get_tree().get_current_scene().get_node("Ball")

# Called when the node enters the scene tree for the first time.
func _ready():
	Engine.time_scale = 1
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_mouse_entered():
	if name == "Restart":
		get_tree().reload_current_scene()
	

