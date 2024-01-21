extends Node
class_name ProductSelection

var products : Array[Product]
var current_selection : String = ""
var selected_product = ""
func _init(): 
	products = [Product.new('Cuadrado trufa',"11",1)]

func add_key(val : int):
	if(!product_selected()):
		current_selection += str(val)
		if(product_selected()):
			selected_product = get_product_with_code(current_selection)
		
func product_selected():
	return current_selection.length() == 2

func get_product_with_code(code : String):
	var p : Array[Product] = products.filter(func(product: Product):return product.code == current_selection)
	return "Product not found" if p.size() == 0 else p[0].name
