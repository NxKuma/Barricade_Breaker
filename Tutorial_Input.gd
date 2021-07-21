extends Sprite


export(int, "W", "Space", "Click") var input = 0

onready var anim_player = get_node("AnimationPlayer")
onready var anim_tree = get_node("AnimationTree")
onready var anim_travel = get_node("AnimationTree").get("parameters/playback")


# Called when the node enters the scene tree for the first time.
func _ready():
	match input:
		0:
			anim_tree.active = true
			anim_travel.travel("W_Press")
		1:
			anim_tree.active = false
			anim_player.play("Space_Bar")
		2:
			anim_tree.active = false
			anim_player.play("Click")
			


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
