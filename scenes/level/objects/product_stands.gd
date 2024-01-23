extends Node2D

var products = ["res://scenes/items/cuadrado_trufa.tscn"]

func _on_screen_release_product(code : String):
	release_product(code)

func release_product(code: String):
	var roller = $RollyThings.get_child(int(code[0])-1).get_child(int(code[1])-1)
	roller.roll()
	var item = load(products[int(code[0])-1]).instantiate()
	item.global_position = roller.position 
	item.rotation = 3.14/6
	$FallingProducts.add_child(item)
