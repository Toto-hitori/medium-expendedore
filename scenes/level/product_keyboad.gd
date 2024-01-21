extends Node2D
signal keyboard_entered
signal keyboard_exited

signal key_pressed(selected_key)
var selected_key: int = 0
func _ready():
	for key in $Keys.get_children():
		key.connect("key_entered",_on_key_entered)

func _process(delta):
	if Input.is_action_just_pressed("click") and selected_key != 0:
		key_pressed.emit(selected_key)
	
func _on_keyboard_area_body_entered(body):
	if body is Hand:
		keyboard_entered.emit()
		
func _on_keyboard_area_body_exited(body):
	if body is Hand:
		keyboard_exited.emit()
		selected_key = 0

func _on_key_entered(val):
	selected_key = val
