extends Node2D

signal hand_entered
signal hand_left
@onready var ready_products = $ReadyProducts
func remove_first_object():
	if(ready_products.get_child_count() > 0):
		ready_products.get_child(0).queue_free()

func _on_object_area_body_entered(_body):
	hand_entered.emit()

func _on_object_area_body_exited(_body):
	hand_left.emit()

func _on_falling_item_detection_area_body_entered(body):
	if(body is Item):
		var item = body.scene_load.instantiate()
		item.rotation = 3.14/3
		ready_products.add_child(item)
		body.queue_free()

func _on_hand_grab_object():
	remove_first_object()
