extends Node2D

var space_scn: PackedScene = preload("res://Scenes/Space.tscn")

var teleport : bool = false

@export var ring1 : Array[Marker2D]
@export var ring2 : Array[Marker2D]
@export var ring3 : Array[Marker2D]

var row1
var row2
var row3
var row4
var row5
var row6

func setup():
	for i in range(3):
		set_ring(i + 1)

func set_ring(row: int):
	var wall_count: int
	var counter: int
	var spaces_list: Array[Node2D]
	
	match row:
		1:
			randomize()
			wall_count = 4 if randi_range(0, 1) == 1 else 3
			
			randomize()
			var tele = (randi() % 2 == 1)
			
			#8 total
			spaces_list.append(create_space(Space.Type.TELEPORT if tele else Space.Type.FIGHT, Space.Data.new() if tele else Space.Data.new()))
			spaces_list.append(create_space(Space.Type.FIGHT, Space.Data.new()))
			spaces_list.append(create_space(Space.Type.FIGHT, Space.Data.new()))
			spaces_list.append(create_space(Space.Type.RANDOM, Space.Data.new()))
			spaces_list.append(create_space(Space.Type.ENCOUNTER, Space.Data.new()))
			spaces_list.append(create_space(Space.Type.SHOP, Space.Data.new()))
			spaces_list.append(create_space(Space.Type.SPIN, Space.Data.new()))
			spaces_list.append(create_space(Space.Type.TREASURE, Space.Data.new()))
			
			for n in ring1.size():
				if n % 2 == 0:
					counter += 1
					if counter == wall_count:
						#place wall
						counter = 0
				else:
					add_child(spaces_list.pop_at(randi() % spaces_list.size()))
		2:
			pass
		3:
			pass

func create_wall():
	pass

func create_space(type: Space.Type, data: Space.Data) -> Space:
	var new_space := space_scn.instantiate()
	new_space.space_type = type
	new_space.data = data
	
	return new_space
