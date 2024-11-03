class_name MotionComponent
extends Node
## This class is used to compose an character body 3D with movement data and
## functions.

@export var max_speed: float = 100

## The direction the model is looking to. It can't be 0 and its axis needs to
## be in the range >= -1 and <= 1.
var looking_direction: Vector3 = Vector3.MODEL_FRONT:
	set = _set_looking_direction;


func _set_looking_direction(new_looking_direction: Vector3) -> void:
	if new_looking_direction == looking_direction:
		return

	assert(
		(new_looking_direction.x >= -1 and new_looking_direction.x <= 1)
		and (new_looking_direction.y >= -1 and new_looking_direction.y <= 1)
		and (new_looking_direction.z >= -1 and new_looking_direction.z <= 1)
	)

	if new_looking_direction == Vector3.ZERO:
		return

	looking_direction = new_looking_direction
