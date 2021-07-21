extends Line2D

var point

func _ready():
	set_as_toplevel(true)# Replace with function body.

func _physics_process(delta):
	point = get_parent().global_position
	add_point(point)
	if points.size() > 20:
		remove_point(0)
