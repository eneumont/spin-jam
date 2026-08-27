extends Node
class_name Marker

var space: Space = null

@export var ring_pos: Dictionary[String, int]
@export var row_pos: Dictionary[String, int]

func create_space(type: Space.Type, data: Space.Data) -> void:
	pass

func reassign_space(spot: Space) -> void:
	space = spot
