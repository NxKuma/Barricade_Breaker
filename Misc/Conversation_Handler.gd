extends Popup


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var right = get_node("Conversation_Handler/Right")
onready var left = get_node("Conversation_Handler/Left")
onready var label = get_node("Conversation_Handler/Dialogue/Label")

var number = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	left.visible = true
	right.visible = true
	label.percent_visible = 0
	get_tree().paused = true
	self.visible = true

func _process(delta):
	
	if number < 0.05:
		number += delta
	else:
		label.percent_visible += delta
		number = 0
	
	if label.percent_visible == 1:
		yield(get_tree().create_timer(1), "timeout")
		get_tree().paused = false
		self.visible = false
	
	if left.frame or right.frame == 1:
		right.position = Vector2(880, 416)
		left.position = Vector2(150, 416)
	else:
		left.position = Vector2(104,416)
		right.position = Vector2(924,416)
