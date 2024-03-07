extends Entity

class_name Slime

@export var max_speed: float = 400
@export var accel: float = 1600
@export var friction: float = 600

var input_dir: Vector2

func set_input_direction(value: Vector2) -> void:
	input_dir = value

func move(delta):
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x += direction.x * accel * delta
		velocity.z += direction.z * accel * delta
		velocity = velocity.limit_length(max_speed)
	else:
		if velocity.length() > friction * delta:
			velocity.x -= velocity.normalized().x * friction * delta
			velocity.z -= velocity.normalized().z * friction * delta
		else:
			velocity = Vector3(0, velocity.y, 0)
	
	move_and_slide()

func _physics_process(delta):
	move(delta)
