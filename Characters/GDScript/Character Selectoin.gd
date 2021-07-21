extends Node2D

var buttons = []

# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		buttons.append(child)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	pass
