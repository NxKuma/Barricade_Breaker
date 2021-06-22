extends Line2D

var point


# Called when the node enters the scene tree for the first time.
func _ready():
	set_as_toplevel(true)# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	point = get_parent().global_position
	add_point(point)
	if points.size() > 20:
		remove_point(0)
