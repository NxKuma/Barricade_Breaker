extends Sprite


export(int, "W", "A", "S", "D", "Space", "Click") var input = 0

onready var anim_player = get_node("AnimationPlayer")


# Called when the node enters the scene tree for the first time.
func _ready():
	match input:
		0:
			anim_player.play("W_Press")
		1:
			anim_player.play("A_Press")
		2:
			anim_player.play("S_Press")
		3:
			anim_player.play("D_Press")
		4:
			anim_player.play("Space_Bar")
		5:
			anim_player.play("Click")
			


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
