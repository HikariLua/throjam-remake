extends State

@onready var character: CharacterBody3D = owner

@onready var stateMachine: StateMachine = %StateMachine
@onready var bodyAnimationPlayer: AnimationPlayer = %BodyAnimationPlayer
@onready var motionComponent: MotionComponent = %MotionComponent


func _physics_update(delta: float) -> void:
	var direction: Vector3 = Vector3.ZERO

	direction.z = Input.get_axis("move_forward", "move_backward")
	direction.x = Input.get_axis("move_left", "move_right")

	motionComponent.looking_direction = direction

	character.velocity = (
		direction.normalized() * motionComponent.max_speed * delta
	)

	DirectionalAnimation.play_four_direction(
		bodyAnimationPlayer, motionComponent.looking_direction, "run"
	)

	character.move_and_slide()

	if direction.x == 0 and direction.z == 0:
		stateMachine.transition_state(%StateIdle)