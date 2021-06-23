extends Area2D

var intensity = 0.7
var duration = 0.14

onready var rBar = $Barricade
onready var lBar = $Barricade_2
onready var aTree = $AnimationTree

# Called when the node enters the scene tree for the first time.
func _ready():
	rBar.frame = 0
	lBar.frame = 0
	aTree.active = true

func _shake():
	CamShake.shake(intensity, duration)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
