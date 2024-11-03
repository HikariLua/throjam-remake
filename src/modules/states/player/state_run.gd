extends State

@onready var entity: Entity = owner

@onready var stateMachine: StateMachine = %StateMachine
@onready var bodyAnimationPlayer: AnimationPlayer = %BodyAnimationPlayer


func _physics_update(delta: float) -> void:
	entity.direction.z = Input.get_axis("move_forward", "move_backward")
	entity.direction.x = Input.get_axis("move_left", "move_right")

	entity.looking_direction = entity.direction

	entity.velocity = (entity.direction * entity.max_speed * delta)

	DirectionalAnimation.play_four_direction(
		bodyAnimationPlayer, entity.looking_direction, "run"
	)

	entity.move_and_slide()

	if entity.direction.x == 0 and entity.direction.z == 0:
		stateMachine.transition_state(%StateIdle)
