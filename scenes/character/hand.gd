extends CharacterBody2D
class_name Hand
func _init():
	DisplayServer.mouse_set_mode(DisplayServer.MOUSE_MODE_HIDDEN)

func _physics_process(delta):
	velocity =  (get_global_mouse_position() - global_position)  * 8
	move_and_slide()

func _on_keyboard_area_body_entered(body):
	print('area_entered')
	$HandSprite.visible = false
	$MouseSprite.visible = true


func _on_keyboard_area_body_exited(body):
	$HandSprite.visible = false
	$MouseSprite.visible = true


func _on_object_area_body_entered(body):
	$HandSprite.
	$HandSprite.visible = false
	$MouseSprite.visible = true


func _on_object_area_body_exited(body):
	$HandSprite.visible = false
	$MouseSprite.visible = true
