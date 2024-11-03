extends State

@onready var character: CharacterBody3D = owner

@onready var stateMachine: StateMachine = %StateMachine
@onready var bodyAnimationPlayer: AnimationPlayer = %BodyAnimationPlayer
@onready var motionComponent: MotionComponent = %MotionComponent


func _physics_update(_delta: float) -> void:
	var direction: Vector3 = Vector3.ZERO

	direction.z = Input.get_axis("move_forward", "move_backward")
	direction.x = Input.get_axis("move_left", "move_right")

	motionComponent.looking_direction = direction

	character.velocity = Vector3.ZERO

	DirectionalAnimation.play_four_direction(
		bodyAnimationPlayer, motionComponent.looking_direction, "idle"
	)

	if direction.x != 0 or direction.z != 0:
		stateMachine.transition_state(%StateRun)
