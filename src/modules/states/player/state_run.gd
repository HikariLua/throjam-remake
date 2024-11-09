extends State

@onready var entity: Entity = owner

@onready var stateMachine: StateMachine = %StateMachine
@onready var bodyAnimationPlayer: AnimationPlayer = %BodyAnimationPlayer


func _physics_update(delta: float) -> void:
	entity.input_dir.z = Input.get_axis("move_forward", "move_backward")
	entity.input_dir.x = Input.get_axis("move_left", "move_right")

	entity.direction = entity.relative_input_dir

	entity.looking_direction = entity.direction

	entity.velocity = (entity.direction * entity.max_speed * delta)

	DirectionalAnimation.play_four_direction(
		bodyAnimationPlayer, entity.looking_direction, "run"
	)

	entity.move_and_slide()

	if entity.input_dir.x == 0 and entity.input_dir.z == 0:
		stateMachine.transition_state(%StateIdle)
