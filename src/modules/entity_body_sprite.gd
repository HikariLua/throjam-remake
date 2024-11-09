extends Sprite3D


func _ready() -> void:
	Camera.main_cam_rotation_changed.connect(_on_cam_rotation_changed)


func _on_cam_rotation_changed(new_rotation: Vector3) -> void:
	self.rotation.y = new_rotation.y
