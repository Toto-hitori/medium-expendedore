extends Node2D

signal hand_entered
signal hand_left

func _on_object_area_body_entered(_body):
	hand_entered.emit()

func _on_object_area_body_exited(_body):
	hand_left.emit()

func _on_falling_item_detection_area_body_entered(body):
	if(body is Item):
		var item = body.scene_load.instantiate()
		item.rotation = 3.14/2
		$ReadyProducts.add_child(item)
		body.queue_free()
		
	

