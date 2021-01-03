extends Node
var stopped = false
var speed_answer;var mainfaster_sprite = preload("res://mainfaster_sprite.tscn")
var count = 0; var faster_sprite_node
onready var f = mainfaster_sprite.instance()
var mainacc_sprite = preload("res://mainacc_sprite.tscn")
onready var k = mainacc_sprite.instance()
onready var sprite_node = get_node("mainsprite/sprite")
var acc_sprite
func _ready():
	$maininput.connect("entered",self,"_on_entered")
	sprite_node.connect("stopeveryone",self,"_on_stopeveryone")
	$instruction.set_text("Press space bar to stop the green boat.")
func _on_entered():
	if stopped == true:
		if int($maininput.user_answer) == stepify(sprite_node.speed_answer,1) and count == 0:
			$instruction.set_text("Press space bar to stop the red boat.")
			sprite_node.set_position(Vector2(1,100))
			sprite_node.time = 0
			sprite_node.set_process(true)
			$speed_answer_1.set_text(str(int($maininput.user_answer)))
			self.add_child(f)
			faster_sprite_node = get_node("mainfaster_sprite/faster_sprite")
			faster_sprite_node.connect("stopeveryone",self,"_on_stopeveryone")
			count+=1
			get_node("maininput/LineEdit").set_text("")
			stopped = false
		elif count==1 and int($maininput.user_answer) == stepify(faster_sprite_node.speed_answer,1):
			$instruction.set_text("Press space bar to stop the yellow boat.")
			sprite_node.set_position(Vector2(1,100))
			sprite_node.time = 0
			sprite_node.set_process(true)
			faster_sprite_node.set_position(Vector2(1,200))
			faster_sprite_node.time = 0
			faster_sprite_node.set_process(true)
			$speed_answer_2.set_text(str(int($maininput.user_answer)))
			self.add_child(k)
			acc_sprite = get_node("mainacc_sprite/acc_sprite")
			acc_sprite.connect("stopeveryone",self,"_on_stopeveryone")
			count+=1
			get_node("maininput/LineEdit").set_text("")
			stopped = false
		elif count == 2 and int($maininput.user_answer) == stepify(acc_sprite.answer,1):
			$instruction.set_text("CORRECT")
			$acc_answer.set_text(str(int($maininput.user_answer)))
			get_tree().paused = true
			stopped = false
		else:
			$instruction.set_text("Incorrect. Please try again.")
	else:
		$instruction.set_text("Please stop the boat by pressing space first")
func _on_stopeveryone():
	if count == 0:
		$instruction.set_text("Calculate constant speed. (round to nearest integer)")
	elif count == 1:
		$instruction.set_text("Calculate constant speed. (round to nearest integer)")
		sprite_node.set_process(false)
	elif count == 2:
		$instruction.set_text("Calculate constant acceleration. (round to nearest integer)")
		sprite_node.set_process(false)
		faster_sprite_node.set_process(false)
	stopped = true
