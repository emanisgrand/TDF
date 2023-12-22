extends RigidBody3D
@export_range(1000,3000) var thrust_speed :float = 1000
@export var torque_speed :float = 120

func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_up"):
		apply_central_force(basis.y * delta * thrust_speed)

func _on_body_entered(body: Node) -> void:
	print(body.name)
