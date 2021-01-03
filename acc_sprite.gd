extends Sprite
var acceleration;signal stopeveryone
var speed = 0; var screensize; var distance
var pos; var time = 0; var answer; var scalepixel
signal settext
func _ready():
	randomize()
	acceleration = randi()%10 + 40
	screensize = get_viewport().size
	scalepixel = 1000/screensize[0]
	set_position(Vector2(1,300))
	set_process(true)
func _process(delta):
	if Input.is_action_pressed("ui_select")==true or position[0] >= screensize[0] or position[1] >= screensize[1] or position[0]<=0 or position[1]<=0:
		answer = stepify((2*distance)/(pow(time,2)),0.1)
		print(answer)
		emit_signal("settext")
		emit_signal("stopeveryone")
		set_process(false)
	else:
		time=stepify(time + delta,0.01)
		distance = stepify(scalepixel*(acceleration*pow(time,2))/2,0.1)
		pos = 1 + (acceleration*pow(time,2))/2
		set_position(Vector2(pos,position[1]))
		emit_signal("settext")
