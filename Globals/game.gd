extends Node

enum Entities {slime}
var slime_entity = preload("res://Entities/slime.tscn")

func get_entity(type: Entities) -> PackedScene:
	match type:
		Entities.slime:
			return slime_entity
		_:
			return null
