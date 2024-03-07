extends Entity

class_name Slime

# Override, use the default movement
func set_input_direction(value: Vector2) -> void:
	input_dir = value

func _physics_process(delta):
	move(delta)
