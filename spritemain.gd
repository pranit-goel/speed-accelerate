extends Node
func _ready():
	$sprite.connect("settext",self,"_on_settext") 
func _on_settext():
	$distance.set_text(str($sprite.distance))
	$time.set_text(str($sprite.time))
	
