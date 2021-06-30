extends Sprite

onready var player = get_node("AnimationPlayer")
onready var tree = get_node("AnimationTree").get("parameters/playback")
onready var pop = get_tree().get_current_scene().get_node("CanvasLayer/Pop")

var click_count = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false

func _physics_process(delta):
	if pop.label.percent_visible == 1:
		visible = true
		
	if visible == false:
		click_count = 1
		

func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and click_count == 1:
		if get_rect().has_point(get_local_mouse_position()):
			tree.travel("Click")
			click_count += 1
			yield(get_tree().create_timer(0.3),"timeout")
			
			pop.index += 1
			if pop.index <= 2:
				pop.dialouge_set()
				visible = false
			else:
				pop.visible = false
				get_tree().paused = false
			



