extends ColorRect

onready var anim = get_node("AnimationPlayer")

func _ready():
	visible = false
	connect("mouse_entered", self, "shimmer")

func shimmer():
		if get_rect().has_point(get_local_mouse_position()):
			anim.play("Shimmer")
