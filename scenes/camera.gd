extends Camera2D


func _process(delta):
	zoom = Vector2(get_viewport_rect().size.x / 446,get_viewport_rect().size.y / 268)
