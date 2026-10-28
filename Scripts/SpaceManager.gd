extends Node2D

var space_scn: PackedScene = preload("res://Scenes/Space.tscn")
var player_scn: PackedScene = preload("res://Scenes/PlayerSpace.tscn")

var teleport : bool = false

@export var ring1_markers: Array[Marker]
@export var ring2_markers: Array[Marker]
@export var ring3_markers: Array[Marker]
@export var start_marker: Marker

func _ready() -> void:
	set_marker_neighbors()
	if PlayerData.tutorial: setup_tutorial() 
	else: setup()

#this is dumb, do better than this...
#I'm bout to do the dumbest thing... nevermind...
func set_marker_neighbors() -> void:
	$Markers/Mark1.Neighbors = {
		Marker.Dir.UP: $Markers/Mark16,
		Marker.Dir.DOWN: $Markers/Mark22,
		Marker.Dir.LEFT: $Markers/Mark7,
		Marker.Dir.RIGHT: $Markers/Mark2,
	}
	
	$Markers/Mark2.Neighbors = {
		Marker.Dir.UP: $Markers/Mark15,
		Marker.Dir.DOWN: $Markers/Mark21,
		Marker.Dir.LEFT: $Markers/Mark1,
		Marker.Dir.RIGHT: $Markers/Mark3,
	}
	
	$Markers/Mark3.Neighbors = {
		Marker.Dir.UP: $Markers/Mark14,
		Marker.Dir.DOWN: $Markers/Mark17,
		Marker.Dir.LEFT: $Markers/Mark2,
		Marker.Dir.RIGHT: $Markers/Mark4,
	}
	
	$Markers/Mark4.Neighbors = {
		Marker.Dir.UP: $Markers/Mark8,
		Marker.Dir.DOWN: $Markers/Mark18,
		Marker.Dir.LEFT: $Markers/Mark3,
		Marker.Dir.RIGHT: $Markers/Mark5,
	}
	
	$Markers/Mark5.Neighbors = {
		Marker.Dir.UP: $Markers/Mark11,
		Marker.Dir.DOWN: $Markers/Mark20,
		Marker.Dir.LEFT: $Markers/Mark4,
		Marker.Dir.RIGHT: $Markers/Mark6,
	}
	
	$Markers/Mark6.Neighbors = {
		Marker.Dir.UP: $Markers/Mark15,
		Marker.Dir.DOWN: $Markers/Mark21,
		Marker.Dir.LEFT: $Markers/Mark1,
		Marker.Dir.RIGHT: $Markers/Mark3,
	}
	
	$Markers/Mark7.Neighbors = {
		Marker.Dir.UP: $Markers/Mark15,
		Marker.Dir.DOWN: $Markers/Mark21,
		Marker.Dir.LEFT: $Markers/Mark1,
		Marker.Dir.RIGHT: $Markers/Mark3,
	}
	
	$Markers/Mark8.Neighbors = {
		Marker.Dir.UP: $Markers/Mark15,
		Marker.Dir.DOWN: $Markers/Mark21,
		Marker.Dir.LEFT: $Markers/Mark1,
		Marker.Dir.RIGHT: $Markers/Mark3,
	}
	
	$Markers/Mark9.Neighbors = {
		Marker.Dir.UP: $Markers/Mark15,
		Marker.Dir.DOWN: $Markers/Mark21,
		Marker.Dir.LEFT: $Markers/Mark1,
		Marker.Dir.RIGHT: $Markers/Mark3,
	}
	
	$Markers/Mark10.Neighbors = {
		Marker.Dir.UP: $Markers/Mark15,
		Marker.Dir.DOWN: $Markers/Mark21,
		Marker.Dir.LEFT: $Markers/Mark1,
		Marker.Dir.RIGHT: $Markers/Mark3,
	}
	
	$Markers/Mark11.Neighbors = {
		Marker.Dir.UP: $Markers/Mark15,
		Marker.Dir.DOWN: $Markers/Mark21,
		Marker.Dir.LEFT: $Markers/Mark1,
		Marker.Dir.RIGHT: $Markers/Mark3,
	}
	
	$Markers/Mark12.Neighbors = {
		Marker.Dir.UP: $Markers/Mark15,
		Marker.Dir.DOWN: $Markers/Mark21,
		Marker.Dir.LEFT: $Markers/Mark1,
		Marker.Dir.RIGHT: $Markers/Mark3,
	}
	
	$Markers/Mark13.Neighbors = {
		Marker.Dir.UP: $Markers/Mark15,
		Marker.Dir.DOWN: $Markers/Mark21,
		Marker.Dir.LEFT: $Markers/Mark1,
		Marker.Dir.RIGHT: $Markers/Mark3,
	}
	
	$Markers/Mark14.Neighbors = {
		Marker.Dir.UP: $Markers/Mark15,
		Marker.Dir.DOWN: $Markers/Mark21,
		Marker.Dir.LEFT: $Markers/Mark1,
		Marker.Dir.RIGHT: $Markers/Mark3,
	}
	
	$Markers/Mark15.Neighbors = {
		Marker.Dir.UP: $Markers/Mark15,
		Marker.Dir.DOWN: $Markers/Mark21,
		Marker.Dir.LEFT: $Markers/Mark1,
		Marker.Dir.RIGHT: $Markers/Mark3,
	}
	
	$Markers/Mark16.Neighbors = {
		Marker.Dir.UP: $Markers/Mark15,
		Marker.Dir.DOWN: $Markers/Mark21,
		Marker.Dir.LEFT: $Markers/Mark1,
		Marker.Dir.RIGHT: $Markers/Mark3,
	}
	
	$Markers/Mark17.Neighbors = {
		Marker.Dir.UP: $Markers/Mark15,
		Marker.Dir.DOWN: $Markers/Mark21,
		Marker.Dir.LEFT: $Markers/Mark1,
		Marker.Dir.RIGHT: $Markers/Mark3,
	}
	
	$Markers/Mark18.Neighbors = {
		Marker.Dir.UP: $Markers/Mark15,
		Marker.Dir.DOWN: $Markers/Mark21,
		Marker.Dir.LEFT: $Markers/Mark1,
		Marker.Dir.RIGHT: $Markers/Mark3,
	}
	
	$Markers/Mark19.Neighbors = {
		Marker.Dir.UP: $Markers/Mark15,
		Marker.Dir.DOWN: $Markers/Mark21,
		Marker.Dir.LEFT: $Markers/Mark1,
		Marker.Dir.RIGHT: $Markers/Mark3,
	}
	
	$Markers/Mark20.Neighbors = {
		Marker.Dir.UP: $Markers/Mark15,
		Marker.Dir.DOWN: $Markers/Mark21,
		Marker.Dir.LEFT: $Markers/Mark1,
		Marker.Dir.RIGHT: $Markers/Mark3,
	}
	
	$Markers/Mark21.Neighbors = {
		Marker.Dir.UP: $Markers/Mark15,
		Marker.Dir.DOWN: $Markers/Mark21,
		Marker.Dir.LEFT: $Markers/Mark1,
		Marker.Dir.RIGHT: $Markers/Mark3,
	}
	
	$Markers/Mark22.Neighbors = {
		Marker.Dir.UP: $Markers/Mark15,
		Marker.Dir.DOWN: $Markers/Mark21,
		Marker.Dir.LEFT: $Markers/Mark1,
		Marker.Dir.RIGHT: $Markers/Mark3,
	}
	
	$Markers/Mark23.Neighbors = {
		Marker.Dir.UP: $Markers/Mark15,
		Marker.Dir.DOWN: $Markers/Mark21,
		Marker.Dir.LEFT: $Markers/Mark1,
		Marker.Dir.RIGHT: $Markers/Mark3,
	}
	
	$Markers/Mark24.Neighbors = {
		Marker.Dir.UP: $Markers/Mark15,
		Marker.Dir.DOWN: $Markers/Mark21,
		Marker.Dir.LEFT: $Markers/Mark1,
		Marker.Dir.RIGHT: $Markers/Mark3,
	}
	
	$Markers/Mark25.Neighbors = {
		Marker.Dir.UP: $Markers/Mark7,
		Marker.Dir.DOWN: $Markers/Mark23,
		Marker.Dir.LEFT: $Markers/Mark19,
		Marker.Dir.RIGHT: $Markers/Mark16,
	}

#set markers avaiable neighbors to specific path and set specific spaces
func setup_tutorial():
	var mark = $Markers/Mark4
	var new_space = space_scn.instantiate()
	
	$Spaces.add_child(new_space)
	new_space.setup(Space.Type.START, Space.Data.new(), mark)

func setup():
	start_marker.add_child(create_space(Space.Type.START, Space.Data.new()))
	var player = player_scn.instantiate()
	add_child(player)
	player.position = start_marker.position
	
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
	new_space.setup()
	
	return new_space
