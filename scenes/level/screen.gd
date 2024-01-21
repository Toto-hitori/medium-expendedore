extends TextureRect
class_name Screen

var products : ProductSelection

func _init():
	products = ProductSelection.new()



func _on_product_keyboad_key_pressed(selected_key):
	products.add_key(selected_key)
