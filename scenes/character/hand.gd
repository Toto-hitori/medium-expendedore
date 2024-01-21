extends CharacterBody2D
class_name Hand
func _init():
	DisplayServer.mouse_set_mode(DisplayServer.MOUSE_MODE_HIDDEN)

func _physics_process(_delta):
	velocity =  (get_global_mouse_position() - global_position)  * 8
	move_and_slide()

func _on_object_area_body_entered(_body):
	$HandSprite.frame = 1
	$HandSprite.visible = true
	$MouseSprite.visible = false


func _on_object_area_body_exited(_body):
	$HandSprite.visible = false
	$MouseSprite.visible = true


func _on_product_keyboad_keyboard_entered():
	$HandSprite.frame = 0
	$HandSprite.visible =  true
	$MouseSprite.visible = false


func _on_product_keyboad_keyboard_exited():
	$HandSprite.visible = false
	$MouseSprite.visible = true
