extends Node2D
class_name KeyboardKey

@export var val = ""

func _ready():
	$Label.text = val
