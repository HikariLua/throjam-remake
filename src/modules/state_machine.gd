class_name StateMachine
extends Node
## Generic finite state machine. It will control the state logic and flow.

@export var initial_state: State

@onready var active_state: State = initial_state


func transition_state(new_state: State, msg: Dictionary = {}) -> void:
	active_state._on_exit()

	active_state = new_state

	active_state._on_enter(msg)


func _process(delta: float) -> void:
	active_state._update(delta)


func _physics_process(delta: float) -> void:
	active_state._physics_update(delta)
