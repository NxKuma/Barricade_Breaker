extends Sprite

export(int, "Gecko", "Crew", "Kiara", "Captain") var character = 0
var anim_name
var is_clicked = false
var focus_value = 0
onready var anim = get_node("AnimationPlayer")
onready var parent = self.get_parent()


func char_match():
	if !is_clicked:
		match character:
			0:
				frame = 1
			1:
				frame = 3
			2:
				frame = 5
			3:
				frame = 7
	print(is_clicked)

# Called when the node enters the scene tree for the first time.
func _ready():
	material.set_shader_param("flash_modifier", 0)
	char_match()

func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if get_rect().has_point(get_local_mouse_position()):
			anim.play("Flash_"+str(character))
			is_clicked = true
			focus_value += 10
			parent.focus(self)
			

