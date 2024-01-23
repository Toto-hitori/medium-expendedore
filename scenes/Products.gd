extends Node

var _products : Array[Product]
var _random_sel : Product
func _init(): 
	_products = [Product.new('Cuadrado\ntrufa',"11",2,"res://scenes/items/cuadrado_trufa.tscn","res://assets/secret-11.png","res://assets/items/cuadrado_trufa.png"),
		Product.new('Kinda\ngood',"23",1,"res://scenes/items/kinda_good.tscn","res://assets/Thinking_hands.png","res://assets/items/kinda_good.png"),
		Product.new('Pan de\npipas',"31",1,"res://scenes/items/pan_pipas.tscn","res://assets/secret-pipas.png","res://assets/items/pan_pipas.png")
	]

func get_product_with_code(code : String) -> Product:
	var p : Array[Product] = _products.filter(func(product: Product):return product.code == code && product.number > 0)
	if p.size() == 0: 
		return null
	else: 
		return p[0]

func get_products() -> Array[Product]:
	return _products

func release_product(code : String) -> Node2D:
	if(code == _random_sel.code):
		
		return get_product_with_code(code).release()
	else: 
		return null

func get_random_selection():
	if _random_sel == null:
		generate_random()
	return _random_sel

func generate_random():
	_random_sel = null
	if(has_products_left()):
		var rng = RandomNumberGenerator.new()
		while(_random_sel == null || _random_sel.number == 0):
			_random_sel = _products[rng.randi_range(0,_products.size()-1)]
	return _random_sel

func has_products_left() -> bool:
	return _products.filter(func(product: Product):return  product.number > 0).size() > 0
