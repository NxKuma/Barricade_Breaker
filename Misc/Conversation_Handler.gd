extends Popup

onready var right = get_node("Conversation_Handler/Right")
onready var left = get_node("Conversation_Handler/Left")
onready var label = get_node("Conversation_Handler/Dialogue/RichTextLabel")
onready var button = get_node("Conversation_Handler/Dialogue/Button")
onready var button_anim = get_node("Conversation_Handler/Dialogue/Button/AnimationPlayer")
onready var button_tree = get_node("Conversation_Handler/Dialogue/Button/AnimationTree").get("parameters/playback")

var speed_complete = 0
var click_count = 1
var file = File.new()
var json
var current_talker
var pos
var index = 0
var text_complete = false

func dialouge_set():
	file.open("res://Misc/Dialogue.json",file.READ)
	json = parse_json(file.get_as_text()) 
	file.close()
	
	label.percent_visible = 0
	text_complete = false
	var string_index = String(index)
	var dialogue = json[string_index]
	label.bbcode_text = dialogue.text
	pos = dialogue.pos
	
	if pos == "Left":
		current_talker = left
		left.modulate = Color(1, 1, 1, 1)
		if dialogue.solo ==  false:
			right.visible = true
			right.modulate = Color(1, 1, 1, 0.7)
		else:
			right.modulate = Color(1, 1, 1, 0)
	else:
		current_talker = right
		right.modulate = Color(1, 1, 1, 1)
		if dialogue.solo ==  false:
			left.visible = true
			left.modulate = Color(1, 1, 1, 0.7)
		else:
			left.modulate = Color(1, 1, 1, 0)
		
	current_talker.frame = dialogue.frame
	speed_complete = dialogue.txt_spd
	
	if current_talker.frame == 1:
		if current_talker == right:
			right.position = Vector2(880, 416)
		else:
			left.position = Vector2(150, 416)
	else:
		left.position = Vector2(104,416)
		right.position = Vector2(924,416)

func _ready():
	dialouge_set()
	left.visible = true
	right.visible = true
	label.percent_visible = 0
	get_tree().paused = true
	self.visible = true

	
func _physics_process(delta):
	if speed_complete < 0.05:
		speed_complete += delta
	else:
		label.percent_visible += delta
		speed_complete = 0
		
	if Input.is_action_just_pressed("ui_accept"):
		if label.percent_visible < 1:
			label.percent_visible = 1
		else:
			button.next_dialogue()
		


