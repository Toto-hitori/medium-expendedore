extends TextureRect
class_name Screen

var products : ProductSelection
signal release_product(code)
func _ready():
	products = $ProductsSelection

func _process(_delta):
	if(!products.product_selected()):
		if(products.current_selection != ""):
			set_text(products.current_selection)
		else:
			set_text("Selecciona un \n producto")

func set_text(text : String):
	$Label.text = text
	
func _on_product_keyboad_key_pressed(selected_key):
	products.add_key(selected_key)

func _on_products_selection_invalid_product():
	set_text("Producto invalido")

func _on_products_selection_product_select(_name):
	set_text(_name)

func _on_products_selection_pick_product(code : String):
	release_product.emit(code)
