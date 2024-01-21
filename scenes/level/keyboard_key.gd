extends Node2D
class_name KeyboardKey
signal key_entered(val)

@export var val: int = 0 

func _ready():
	$Label.text = str(val)


func _on_area_2d_body_entered(body):
	if body is Hand:
		key_entered.emit(val)

