class_name Product
var name : String
var code : String
var number : int
var scene_name : String
var scene : PackedScene 
var texture : Texture2D
var item_texture : Texture2D
func _init(_name,_code,_number,_scene,_texture,_item_texture):
	name = _name 
	code = _code 
	number = _number
	scene = load(_scene)
	texture = load(_texture)
	item_texture = load(_item_texture)
	
func release():
	number -= 1;
	var _scene = scene.instantiate()
	_scene.set("product",self)
	return _scene
