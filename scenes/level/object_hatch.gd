extends Node2D

signal hand_entered
signal hand_left

func _on_object_area_body_entered(body):
	hand_entered.emit()


func _on_object_area_body_exited(body):
	hand_left.emit()
