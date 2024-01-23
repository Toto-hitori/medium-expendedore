extends Node2D
	

func _ready():
	Products.get_random_selection()

func _process(delta):
	$UI/FliparButton.visible = Products.has_products_left()

func _on_flipar_button_pressed():
	
	GlobalScene.vending_scene = get_tree().current_scene
	GlobalScene.vending_scene.visible = false
	GlobalScene.premonition_scene = load("res://scenes/level/premonition.tscn").instantiate()
	get_tree().get_root().add_child(GlobalScene.premonition_scene)
	
	print('a')