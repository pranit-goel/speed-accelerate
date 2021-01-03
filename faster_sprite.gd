extends Sprite
var vel; var time = 0
var speed; var speed_answer
var start_location = Vector2(1,200)
var vel_angle
signal settext; signal stopeveryone
var distance; var scalepixel; var screensize; var pos
func _ready():
	randomize()
	vel = Vector2(randi()%25 + 75,0)
	speed = vel.length()
	vel_angle = vel.angle()
	set_position(start_location)
	set_rotation(vel_angle)
	screensize = get_viewport().size
	scalepixel = 1000/screensize[0]
	set_process(true)
func _process(delta):
	if Input.is_action_pressed("ui_select")==true or position[0] >= screensize[0] or position[1] >= screensize[1] or position[0]<=0 or position[1]<=0:
		speed_answer = stepify(distance/time,0.1)
		print(speed_answer)
		emit_signal("stopeveryone")
		set_process(false)
	else:
		time = stepify(time + delta,0.01)
		pos = position + vel*delta
		set_position(pos)
		distance = stepify((pos - start_location).length()*scalepixel,0.1)
		emit_signal("settext")
