extends Node
class_name Marker

enum Dir {
	UP, DOWN, LEFT, RIGHT,
	UL, UR, DL, DR,
}

var Neighbors: Dictionary = {
	Dir.UP: null, Dir.DOWN: null,
	Dir.LEFT: null, Dir.RIGHT: null,
	Dir.UL: null, Dir.UR: null,
	Dir.DL: null, Dir.DR: null,
}

var available_Neighbors: Dictionary = {
	Dir.UP: null, Dir.DOWN: null,
	Dir.LEFT: null, Dir.RIGHT: null,
	Dir.UL: null, Dir.UR: null,
	Dir.DL: null, Dir.DR: null,
}

var space: Space = null

func assign_space(spot: Space) -> void:
	spot.marker = self
	space = spot
