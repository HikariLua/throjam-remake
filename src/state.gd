class_name State
extends Node
## Basic state class. It is a virtual class only used for static typing
## generic states.


## Process logic
func _update(_delta: float) -> void:
	pass


## Physics process logic
func _physics_update(_delta: float) -> void:
	pass


## Run after the transition
func _on_enter(_msg: Dictionary = {}) -> void:
	pass


## Run before the transition
func _on_exit() -> void:
	pass
