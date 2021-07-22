extends Node2D

var buttons = []

# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		buttons.append(child)
	
	for button in buttons:
		print(button.is_clicked)


func focus(object: Sprite):
	var button_focus = object
	
	for button in buttons:
		if button == button_focus:
			if button.is_clicked:
				button.focus_value += 10
		else:
			button.is_clicked = false
			button.char_match()
			

#func _physics_process(delta):
#	for button in buttons:
#		if button.is_clicked:
#			button.focus_value += 10
		
		
		print(button.focus_value)

