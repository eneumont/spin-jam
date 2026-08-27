extends Node2D

var space_scn: PackedScene = preload("res://Scenes/Space.tscn")

var teleport : bool = false

var ring1
var ring2
var ring3
var row1
var row2
var row3
var row4
var row5
var row6

@export var ring1_markers: Array[Marker]
@export var ring2_markers: Array[Marker]
@export var ring3_markers: Array[Marker]
@export var start_marker: Marker

func _ready() -> void:
	setup()

func setup():
	start_marker.add_child(create_space(Space.Type.START, Space.Data.new()))
	for i in range(3):
		set_ring(i + 1)

func set_ring(row: int):
	var wall_count: int
	var counter: int
	var spaces_list: Array[Node2D]
	
	match row:
		1:
			#4 or 3 walls?
			randomize()
			wall_count = randi_range(3, 4)
			
			#will have teleport space?
			randomize()
			teleport = (randi() % 2 == 1)
			
			#8 total
			spaces_list.append(create_space(Space.Type.TELEPORT if teleport else Space.Type.FIGHT, Space.Data.new() if teleport else Space.Data.new()))
			spaces_list.append(create_space(Space.Type.FIGHT, Space.Data.new()))
			spaces_list.append(create_space(Space.Type.FIGHT, Space.Data.new()))
			spaces_list.append(create_space(Space.Type.RANDOM, Space.Data.new()))
			spaces_list.append(create_space(Space.Type.EVENT, Space.Data.new()))
			spaces_list.append(create_space(Space.Type.SHOP, Space.Data.new()))
			spaces_list.append(create_space(Space.Type.SPIN, Space.Data.new()))
			spaces_list.append(create_space(Space.Type.TREASURE, Space.Data.new()))
			
			for n in ring1_markers.size():
				ring1_markers.get(n).add_child(spaces_list.pop_at(randi() % spaces_list.size()))
				#wall logic too
		2:
			#how many walls?
			randomize()
			wall_count = randi_range(0, 1)
			
			#12 total
			spaces_list.append(create_space(Space.Type.TELEPORT, Space.Data.new()))
			spaces_list.append(create_space(Space.Type.FIGHT, Space.Data.new()))
			spaces_list.append(create_space(Space.Type.FIGHT, Space.Data.new()))
			spaces_list.append(create_space(Space.Type.FIGHT, Space.Data.new()))
			spaces_list.append(create_space(Space.Type.ELITE_FIGHT, Space.Data.new()))
			spaces_list.append(create_space(Space.Type.RANDOM, Space.Data.new()))
			spaces_list.append(create_space(Space.Type.EVENT, Space.Data.new()))
			spaces_list.append(create_space(Space.Type.EVENT, Space.Data.new()))
			spaces_list.append(create_space(Space.Type.SHOP, Space.Data.new()))
			spaces_list.append(create_space(Space.Type.SPIN, Space.Data.new()))
			spaces_list.append(create_space(Space.Type.TREASURE, Space.Data.new()))
			
			randomize()
			match randi_range(1, 6):
				1:
					spaces_list.append(create_space(Space.Type.EVENT, Space.Data.new()))
				2:
					spaces_list.append(create_space(Space.Type.ELITE_FIGHT, Space.Data.new()))
				3:
					spaces_list.append(create_space(Space.Type.TREASURE, Space.Data.new()))
				4:
					spaces_list.append(create_space(Space.Type.SPIN, Space.Data.new()))
				5:
					spaces_list.append(create_space(Space.Type.RANDOM, Space.Data.new()))
				6:
					spaces_list.append(create_space(Space.Type.SHOP, Space.Data.new()))
			
			for n in ring2_markers.size():
				ring2_markers.get(n).add_child(spaces_list.pop_at(randi() % spaces_list.size()))
				#wall logic too
		3:
			#3-5 walls?
			randomize()
			wall_count = randi_range(3, 5)
			
			#16 total
			spaces_list.append(create_space(Space.Type.TELEPORT if !teleport else Space.Type.FIGHT, Space.Data.new() if !teleport else Space.Data.new()))
			spaces_list.append(create_space(Space.Type.FIGHT, Space.Data.new()))
			spaces_list.append(create_space(Space.Type.FIGHT, Space.Data.new()))
			spaces_list.append(create_space(Space.Type.EVENT, Space.Data.new()))
			spaces_list.append(create_space(Space.Type.EVENT, Space.Data.new()))
			spaces_list.append(create_space(Space.Type.EVENT, Space.Data.new()))
			spaces_list.append(create_space(Space.Type.SPIN, Space.Data.new()))
			spaces_list.append(create_space(Space.Type.SPIN, Space.Data.new()))
			spaces_list.append(create_space(Space.Type.ELITE_FIGHT, Space.Data.new()))
			spaces_list.append(create_space(Space.Type.ELITE_FIGHT, Space.Data.new()))
			spaces_list.append(create_space(Space.Type.RANDOM, Space.Data.new()))
			spaces_list.append(create_space(Space.Type.RANDOM, Space.Data.new()))
			spaces_list.append(create_space(Space.Type.SHOP, Space.Data.new()))
			spaces_list.append(create_space(Space.Type.SHOP, Space.Data.new()))
			spaces_list.append(create_space(Space.Type.TREASURE, Space.Data.new()))
			spaces_list.append(create_space(Space.Type.TREASURE, Space.Data.new()))
			
			for n in ring3_markers.size():
				ring3_markers.get(n).add_child(spaces_list.pop_at(randi() % spaces_list.size()))
				#wall logic too

func create_wall():
	pass

func create_space(type: Space.Type, data: Space.Data) -> Space:
	var new_space := space_scn.instantiate()
	new_space.space_type = type
	new_space.data = data
	
	return new_space
