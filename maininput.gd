extends Node
var user_answer
signal entered
func _ready():
	pass 
func _on_LineEdit_text_entered(new_text):
	user_answer = new_text
	emit_signal("entered")
