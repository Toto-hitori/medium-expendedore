extends Node

var products : Array[Product]

func _init(): 
	products = [Product.new('Cuadrado\ntrufa',"11",1),
		Product.new('Kinda\ngood',"23",1),
		Product.new('Pan de\npipas',"31",1)
	]
