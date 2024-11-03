extends State

@onready var character: CharacterBody3D = owner

@onready var stateMachine: StateMachine = %StateMachine
@onready var bodyAnimationPlayer: AnimationPlayer = %BodyAnimationPlayer


func _physics_update(delta: float) -> void:
	character.input_dir.z = Input.get_axis("move_forward", "move_backward")
	character.input_dir.x = Input.get_axis("move_left", "move_right")

	character.looking_direction = character.input_dir

	character.velocity = (character.input_dir * character.max_speed * delta)

	DirectionalAnimation.play_four_direction(
		bodyAnimationPlayer, character.looking_direction, "run"
	)

	character.move_and_slide()

	if character.input_dir.x == 0 and character.input_dir.z == 0:
		stateMachine.transition_state(%StateIdle)
