extends Node
class_name ProductSelection

var products : Array[Product]
var current_selection : String = ""

func _init(): 
	products = [Product.new('Cuadrado trufa',"1",1)]

func add_key(val : int):
	current_selection += str(val)
