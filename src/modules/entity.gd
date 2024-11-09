class_name Entity
extends CharacterBody3D

@export_category("Motion")
@export var max_speed: float = 100

## The direction the model is looking to. It can't be 0 and its axis needs to
## be in the range >= -1 and <= 1.
@export var looking_direction: Vector3 = Vector3.MODEL_FRONT:
	get = _get_looking_direction,
	set = _set_looking_direction

var input_dir := Vector3.ZERO

## This is the input_dir but relative to the camera rotation
var relative_input_dir := Vector3.ZERO:
	set(value):
		assert(false, "Read only variable, write on input_dir instead")
	get:
		return (Camera.main_pivot.transform.basis * input_dir).normalized()

var direction := Vector3.ZERO


func _set_looking_direction(new_looking_direction: Vector3) -> void:
	if new_looking_direction == looking_direction:
		return

	assert(
		(
			(new_looking_direction.x >= -1 and new_looking_direction.x <= 1)
			and (new_looking_direction.y >= -1 and new_looking_direction.y <= 1)
			and (new_looking_direction.z >= -1 and new_looking_direction.z <= 1)
		)
	)

	if new_looking_direction == Vector3.ZERO:
		return

	looking_direction = new_looking_direction


func _get_looking_direction() -> Vector3:
	return (looking_direction * Camera.main_pivot.transform.basis).normalized()
