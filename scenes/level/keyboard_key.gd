extends Node2D
class_name KeyboardKey

@export var val: int = 0 

func _ready():
	$Label.text = str(val)
