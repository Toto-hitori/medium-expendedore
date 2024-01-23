extends Node

var _products : Array[Product]

func _init(): 
	_products = [Product.new('Cuadrado\ntrufa',"11",2),
		Product.new('Kinda\ngood',"23",1),
		Product.new('Pan de\npipas',"31",1)
	]

func get_product_with_code(code : String):
	var p : Array[Product] = _products.filter(func(product: Product):return product.code == code)
	if p.size() == 0: 
		return null
	else: 
		return p[0]

func get_procuts() -> Array[Product]:
	return _products
