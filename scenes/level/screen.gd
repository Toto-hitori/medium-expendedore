extends TextureRect
class_name Screen

var products : ProductSelection

func _init():
	products = ProductSelection.new()

func _process(_delta):
	if(!products.product_selected()):
		if(products.current_selection != ""):
			set_text(products.current_selection)
	else:
		set_text(products.selected_product)

func set_text(text : String):
	$Label.text = text
	
func _on_product_keyboad_key_pressed(selected_key):
	products.add_key(selected_key)
