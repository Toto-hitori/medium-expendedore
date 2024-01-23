extends Node
class_name ProductSelection
var current_selection : String = ""
var selected_product: Product 

signal product_select(name)
signal pick_product(val)
signal invalid_product()

func add_key(val : int):
	if(current_selection.length() < 2):
		current_selection += str(val)
		if(current_selection.length() == 2):
			$ProductSelectionTimer.start()

func product_selected() -> bool:
	return selected_product != null

func reset():
	current_selection = ""
	selected_product = null

func ask_for_payment():
	if(selected_product == null):
		invalid_product.emit()
		$ResetTimer.start()
	else:
		product_select.emit(selected_product.name)
		pick_product.emit(selected_product.code)
		$ResetTimer.start()

func _on_product_selection_timer_timeout():
	selected_product = Products.get_product_with_code(current_selection)
	ask_for_payment()

func _on_reset_timer_timeout():
	reset()

