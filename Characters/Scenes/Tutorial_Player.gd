extends PathFollow2D

export var runSpeed = 192
onready var player = get_node("Player")

var point_lap

# Called when the node enters the scene tree for the first time.
func _ready():
	set_offset(0)
	player.Aplayer.active = true


func _physics_process(delta):
	set_offset(get_offset() + runSpeed * delta)
	
#	if offset >= 0.0 and offset < 162.45:
#		player.Atree.travel("Idle")
#	elif offset >= 162.45 and offset < 311.04:
#		player.Atree.travel("Forward")
#	elif offset >= 311.04 and offset < 471.02:
#		player.Atree.travel("Idle")
#	elif offset >= 471.02:
#		player.Atree.travel("Back")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
