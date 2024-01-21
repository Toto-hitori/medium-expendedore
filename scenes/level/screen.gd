extends TextureRect
class_name Screen

var products : ProductSelection

func _init():
	products = ProductSelection.new()

func _process(delta):
	if(products.current_selection != ""):
		$Label.text = products.current_selection
	
func _on_product_keyboad_key_pressed(selected_key):
	products.add_key(selected_key)
