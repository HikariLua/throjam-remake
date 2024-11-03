extends Marker3D


const ANIM_TIME: float = 1

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_right"):
		rotate_cam(Vector3(0, deg_to_rad(90), 0))
	if Input.is_action_just_pressed("ui_left"):
		rotate_cam(Vector3(0, deg_to_rad(-90), 0))


func rotate_cam(value_rad: Vector3) -> void:
	if %CamAnimPlayer.current_animation == "rotate":
		return
		
	var animation: Animation = %CamAnimPlayer.get_animation("rotate")
	
	animation.track_set_key_value(0, 0, rotation)
	
	var new_rotation: Vector3 = rotation + value_rad
	animation.track_set_key_value(0, 1, new_rotation)

	%CamAnimPlayer.play("rotate")
