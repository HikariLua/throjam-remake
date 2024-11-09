class_name CameraController
extends Node

signal main_cam_rotation_changed(new_rotation: Vector3)

var main_cam: Camera3D = null
var main_pivot: Marker3D = null

var _previous_main_cam_rotation: Vector3 = Vector3.ZERO


func _ready() -> void:
	assert(main_cam != null, "main camera not set")
	assert(main_pivot != null, "main pivot not set")
	_previous_main_cam_rotation = main_cam.rotation


func _physics_process(_delta: float) -> void:
	if main_cam.global_rotation != _previous_main_cam_rotation:
		main_cam_rotation_changed.emit(main_cam.global_rotation)
		_previous_main_cam_rotation = main_cam.global_rotation
