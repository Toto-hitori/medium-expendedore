extends Node2D

func _ready():
	place_products()
	
func _on_screen_release_product(code : String):
	release_product(code)

func release_product(code: String):
	var item = Products.release_product(code)
	if(item != null):
		var roller = get_roller_with_code(code)
		roller.roll()
		item.global_position = roller.global_position - Vector2(130,140)
		item.rotation = 3.14/6
		$FallingProducts.add_child(item)
		Products.generate_random()
		remove_first_product(code)

func place_products():
	for p in Products.get_products():
		var node = Node2D.new()
		node.name = p.code
		for i in p.number:
			var spr = Sprite2D.new()
			spr.name = str(i)
			spr.texture = p.item_texture
			spr.position -= i* Vector2(3,3)
			node.add_child(spr)	
		var roller = get_roller_with_code(p.code)
		node.global_position = roller.global_position - Vector2(130,140)
		$PlacedProducts.add_child(node)

func get_roller_with_code(code):
	return $RollyThings.get_child(int(code[0])-1).get_child(int(code[1])-1)

func remove_first_product(code):
	$PlacedProducts.get_children().filter(func(node : Node):return node.name == code)[0].get_children()[0].queue_free()
