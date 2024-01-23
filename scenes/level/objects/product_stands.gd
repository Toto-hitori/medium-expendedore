extends Node2D

func _on_screen_release_product(code : String):
	release_product(code)

func release_product(code: String):
	var roller = $RollyThings.get_child(int(code[0])-1).get_child(int(code[1])-1)
	roller.roll()
	var item = Products.release_product(code)
	item.global_position = roller.global_position - Vector2(130,140)
	item.rotation = 3.14/6
	$FallingProducts.add_child(item)
