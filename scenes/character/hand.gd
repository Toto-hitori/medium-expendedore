extends CharacterBody2D
class_name Hand
var ready_to_grab : bool = false
signal grab_object
func _init():
	DisplayServer.mouse_set_mode(DisplayServer.MOUSE_MODE_HIDDEN)

func _physics_process(_delta):
	velocity =  (get_global_mouse_position() - global_position)  * 8
	move_and_slide()

func _process(_delta):
	if Input.is_action_just_pressed("click") and ready_to_grab:
		grab_object.emit()

func _on_product_keyboad_keyboard_entered():
	$HandSprite.frame = 0
	$HandSprite.visible =  true
	$MouseSprite.visible = false


func _on_product_keyboad_keyboard_exited():
	$HandSprite.visible = false
	$MouseSprite.visible = true


func _on_object_hatch_hand_entered():
	$HandSprite.frame = 1
	$HandSprite.visible = true
	$MouseSprite.visible = false
	ready_to_grab = true


func _on_object_hatch_hand_left():
	$HandSprite.visible = false
	$MouseSprite.visible = true
	ready_to_grab = false
