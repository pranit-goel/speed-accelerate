extends Node

func _ready():
	$acc_sprite.connect("settext",self,"_on_settext") 
func _on_settext():
	$distance.set_text(str($acc_sprite.distance))
	$time.set_text(str($acc_sprite.time))

