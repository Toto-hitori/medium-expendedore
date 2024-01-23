extends Node

var _products : Array[Product]

func _init(): 
	_products = [Product.new('Cuadrado\ntrufa',"11",2,"res://scenes/items/cuadrado_trufa.tscn"),
		Product.new('Kinda\ngood',"23",1,"res://scenes/items/kinda_good.tscn"),
		Product.new('Pan de\npipas',"31",1,"res://scenes/items/pan_pipas.tscn")
	]

func get_product_with_code(code : String):
	var p : Array[Product] = _products.filter(func(product: Product):return product.code == code)
	if p.size() == 0: 
		return null
	else: 
		return p[0]

func get_products() -> Array[Product]:
	return _products

func release_product(code : String) -> Node2D:
	return get_product_with_code(code).release()
