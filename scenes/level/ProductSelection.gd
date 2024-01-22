extends Node
class_name ProductSelection
var products : Array[Product]
var current_selection : String = ""
var selected_product: Product 

signal product_select(name)
signal pick_product(val)
signal invalid_product()
func _init(): 
	products = [Product.new('Cuadrado\ntrufa',"11",1),
		Product.new('Kinda\ngood',"23",1),
		Product.new('Pan de\npipas',"31",1)
	]

func add_key(val : int):
	if(current_selection.length() < 2):
		current_selection += str(val)
		if(current_selection.length() == 2):
			$ProductSelectionTimer.start()

func product_selected() -> bool:
	return selected_product != null

func get_product_with_code(code : String):
	var p : Array[Product] = products.filter(func(product: Product):return product.code == current_selection)
	if p.size() == 0: 
		return null
	else: 
		return p[0]

func reset():
	current_selection = ""
	selected_product = null
	print('selection reset')

func ask_for_payment():
	if(selected_product == null):
		invalid_product.emit()
		$ResetTimer.start()
	else:
		product_select.emit(selected_product.name)
		pick_product.emit(selected_product.code)
		$ResetTimer.start()

func _on_product_selection_timer_timeout():
	selected_product = get_product_with_code(current_selection)
	ask_for_payment()

func _on_reset_timer_timeout():
	reset()

