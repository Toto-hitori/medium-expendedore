extends Node2D

@export var premonition: Texture2D 

func _ready():
	$Character.set_thinking_animation()
	$Sprite2D.texture = premonition

