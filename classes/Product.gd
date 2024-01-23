class_name Product
var name : String
var code : String
var number : int
var scene_name : String
var scene : PackedScene 
func _init(_name,_code,_number,_scene):
	name = _name 
	code = _code 
	number = _number
	scene = load(_scene)

func release():
	number -= 1;
	var _scene = scene.instantiate()
	_scene.set("product",self)
	return _scene
