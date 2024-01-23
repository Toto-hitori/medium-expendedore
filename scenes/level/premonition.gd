extends Node2D

@export var premonition: Texture2D 

func _ready():
	$Character.set_thinking_animation()
	premonition = Products.get_random_selection().texture
	$Sprite2D.texture = premonition

func _on_back_button_pressed():
	get_tree().get_root().remove_child(GlobalScene.premonition_scene)
	GlobalScene.vending_scene.visible = true
