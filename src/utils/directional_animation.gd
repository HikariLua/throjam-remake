class_name DirectionalAnimation
extends Node
## This class handles 2D directional animations.
## It is necessary that the animations are named with the standard
## <action>_<direction>, where <action> is the action to be animated and
## <direction> is the direction in which the action will be performed, always
## connected by an "_" (underscore).

## Back and Forward is inverted to compensate the reflection
## caused by the camera perspective.
const DIR_DICT: Dictionary = {
	"left": Vector3.LEFT,
	"right": Vector3.RIGHT,
	"front": Vector3.BACK,
	"back": Vector3.FORWARD,
}


## Play an animation that has four direction variants: left, right, back and front
static func play_four_direction(
	animation_player: AnimationPlayer, direction: Vector3, anim_name: String
) -> void:
	assert(
		(
			animation_player.has_animation("%s_back" % anim_name)
			and animation_player.has_animation("%s_front" % anim_name)
			and animation_player.has_animation("%s_left" % anim_name)
			and animation_player.has_animation("%s_right" % anim_name)
		),
		"failed to play `%s` animations" % anim_name
	)
	assert(
		(
			(direction.x >= -1 and direction.x <= 1)
			and (direction.y >= -1 and direction.y <= 1)
			and (direction.z >= -1 and direction.z <= 1)
		),
		"directon out of range"
	)

	var new_anim: String = get_four_direction(anim_name, direction)

	if animation_player.current_animation == new_anim:
		return

	assert(
		animation_player.has_animation(new_anim),
		"animation player has no animation %s" % new_anim
	)

	var previous_animation: String = animation_player.current_animation
	var previous_position: float = animation_player.current_animation_position

	animation_player.play(new_anim)

	if previous_animation.begins_with(anim_name + "_"):
		animation_player.seek(previous_position)


static func get_four_direction(anim_name: String, direction: Vector3) -> String:
	var new_anim: String = ""
	for key: String in DIR_DICT.keys():
		if direction.distance_to(DIR_DICT.get(key)) <= 1:
			new_anim = anim_name + "_" + key
			break

	assert(new_anim != "", "invalid direction for animation %s" % anim_name)
	return new_anim
