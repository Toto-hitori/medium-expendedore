extends Node2D

func _ready():
	place_products()
	
func _on_screen_release_product(code : String):
	release_product(code)

func release_product(code: String):
	var item = Products.release_product(code)
	if(item != null):
		var roller = $RollyThings.get_child(int(code[0])-1).get_child(int(code[1])-1)
		roller.roll()
		item.global_position = roller.global_position - Vector2(130,140)
		item.rotation = 3.14/6
		$FallingProducts.add_child(item)
		Products.generate_random()
		print(Products.get_random_selection())

func place_products():
	for p in Products.get_products():
		var node = Node2D.new()
		node.name = p.code
		for i in p.number:
			var spr = Sprite2D.new()
			spr.name = str(i)
			spr.texture = p.item_texture
			node.add_child(spr)
		$PlacedProducts.add_child(node)
