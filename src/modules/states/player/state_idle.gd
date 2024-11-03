extends State

@onready var character: CharacterBody3D = owner

@onready var stateMachine: StateMachine = %StateMachine
@onready var bodyAnimationPlayer: AnimationPlayer = %BodyAnimationPlayer


func _physics_update(_delta: float) -> void:
	character.input_dir.z = Input.get_axis("move_forward", "move_backward")
	character.input_dir.x = Input.get_axis("move_left", "move_right")

	character.looking_direction = character.input_dir

	character.velocity.x = 0
	character.velocity.z = 0

	DirectionalAnimation.play_four_direction(
		bodyAnimationPlayer, character.looking_direction, "idle"
	)

	if character.input_dir.x != 0 or character.input_dir.z != 0:
		stateMachine.transition_state(%StateRun)
