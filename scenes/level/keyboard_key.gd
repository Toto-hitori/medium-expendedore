extends Node2D
class_name KeyboardKey
signal key_entered(val)
signal key_left

@export var val: int = 0 

func _ready():
	$Label.text = str(val)


func _on_area_2d_body_entered(body):
	key_entered.emit(val)

