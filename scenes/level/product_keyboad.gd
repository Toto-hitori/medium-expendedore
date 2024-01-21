extends Node2D
signal keyboard_entered
signal keyboard_exited

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_keyboard_area_body_entered(body):
	if body is Hand:
		keyboard_entered.emit()
		
func _on_keyboard_area_body_exited(body):
	if body is Hand:
		keyboard_exited.emit()
