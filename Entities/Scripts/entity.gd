extends CharacterBody3D

class_name Entity

# Expose movement variables
@export var max_speed: float = 1.5
@export var accel: float = 10
@export var friction: float = 5

# Input direction for movement
var input_dir: Vector2

# Pressed the attack button, to be overridden by subclass
func attack_press() -> void:
	pass

# Released the attack button, to be overridden by subclass
func attack_release() -> void:
	pass

# Pressed the dodge button, to be overridden by subclass
func dodge_press() -> void:
	pass

# Released the dodge button, to be overridden by subclass
func dodge_release() -> void:
	pass

# Sets input direction provided by player or AI controller, to be overridden by subclass
func set__input_direction(_value: Vector2) -> void:
	pass

# Basic movement, to be overridden by subclass if needed
func move(delta):
	var camera: Camera3D = get_viewport().get_camera_3d()
	var direction: Vector3 = (camera.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x += direction.x * accel * delta
		velocity.z += direction.z * accel * delta
		velocity = velocity.limit_length(max_speed)
		rotation.y = -Vector2(velocity.x, velocity.z).angle() 
	else:
		if velocity.length() > friction * delta:
			velocity.x -= velocity.normalized().x * friction * delta
			velocity.z -= velocity.normalized().z * friction * delta
		else:
			velocity = Vector3(0, velocity.y, 0)
	
	move_and_slide()
