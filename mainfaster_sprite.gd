extends Node
var speed_answer = 0; var simp = 0
func _ready():
	$faster_sprite.connect("settext",self,"_on_settext") 
func _on_settext():
	$distance.set_text(str($faster_sprite.distance))
	$time.set_text(str($faster_sprite.time))
	speed_answer = $faster_sprite.speed_answer

