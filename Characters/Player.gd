extends KinematicBody2D


onready var slash = get_node("StaticBody2D")
onready var Aplayer = get_node("AnimationPlayer")
onready var Atree = get_node("AnimationTree").get("parameters/playback")

# Called when the node enters the scene tree for the first time.
func _ready():
	slash.position = Vector2(0,100)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	if Input.is_action_just_pressed("ui_accept"):
		position.x -= 0.1
		Atree.travel("Attack")
