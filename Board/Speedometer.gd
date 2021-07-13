extends Area2D

var intensity = 0.7
var duration = 0.14
var isTossed = false

onready var rBar = $Barricade
onready var lBar = $Barricade_2
onready var aTree = $AnimationTree
onready var center = $CenterAnim
onready var centerSprite = $Center

onready var ball = get_tree().get_current_scene().get_node("Ball")
onready var lPos = get_tree().get_current_scene().get_node("StartingPoint_L")
onready var rPos = get_tree().get_current_scene().get_node("StartingPoint_R")
onready var index = get_tree().get_current_scene().get_node("CanvasLayer").get_child(0)


# Called when the node enters the scene tree for the first time.
func _ready():
	rBar.frame = 0
	lBar.frame = 0
	centerSprite.frame = 0
	aTree.active = true
	
	var prop_index = index.max_index
	
	if index.max_index == prop_index:
		var rand = randi() % 10
		print(rand)
		
		if rand > 5:
			center.play("Toss_Heads")
		else:
			center.play("Toss_Tails")
		
		yield(get_tree().create_timer(0.01),"timeout")
		isTossed = true
	

func _shake():
	CamShake.shake(intensity, duration)
	
func _on_finished(place: Vector2):
	ball.global_position = place
	ball.scale_tween.interpolate_property(ball,"scale",Vector2(0,0),Vector2(0.7,0.7),1,Tween.TRANS_ELASTIC,Tween.EASE_OUT)
	ball.visible = true
	ball.scale_tween.start()

#func _input(event):
#	if Input.is_action_just_pressed("ui_accept") and isTossed == false:
#		var rand = randi() % 10
#		print(rand)
#
#		if rand > 5:
#			center.play("Toss_Heads")
#		else:
#			center.play("Toss_Tails")
#
#		yield(get_tree().create_timer(0.01),"timeout")
#		isTossed = true



func _on_CenterAnim_animation_finished(anim_name):
	if anim_name == "Toss_Heads":
		_on_finished(rPos.global_position)
		centerSprite.frame = 3
	else:
		_on_finished(lPos.global_position)
		centerSprite.frame = 3

	if anim_name == "Dead_L" or anim_name == "Dead_R":
		yield(get_tree().create_timer(.4),"timeout")
		Engine.time_scale = 1
		get_tree().reload_current_scene()
	
