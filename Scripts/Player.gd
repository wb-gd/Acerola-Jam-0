extends Node3D

@export var entity_type: Game.Entities

var entity: Entity

func _ready():
	entity = Game.get_entity(entity_type).instantiate()
	add_child(entity)

func _physics_process(delta):
	var input_dir: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	entity.set_input_direction(input_dir)
